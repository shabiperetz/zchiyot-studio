# סורק את תיקיית assets/frames, מייצר תמונות מוקטנות (thumbs) ובונה frames.json
# שהאפליקציה טוענת אוטומטית.
# - כולל רק תמונות אנכיות (יחס גובה/רוחב >= 1.4, קרוב ל-9:16)
# - מדלג על כפילויות (אותו תוכן בדיוק, לפי hash)
# - יוצר thumbnail קטן (JPEG רוחב 300) בתיקיית thumbs/ לכל מסגרת — לטעינה מהירה בגריד
# - סוג "overlay" אם השם כולל overlay/transparent, אחרת "bg"
# הרצה: לחיצה ימנית -> Run with PowerShell, או:  powershell -File build-frames-manifest.ps1

Add-Type -AssemblyName System.Drawing
$dir = $PSScriptRoot
$thumbsDir = Join-Path $dir 'thumbs'
if (-not (Test-Path $thumbsDir)) { New-Item -ItemType Directory -Path $thumbsDir | Out-Null }

# מקודד JPEG לאיכות 72
$jpeg = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
$encParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
$encParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [int64]72)

$THUMB_W = 300
$exts = @('.png', '.jpg', '.jpeg', '.webp')
$files = Get-ChildItem -File -Path $dir | Where-Object { $exts -contains $_.Extension.ToLower() } | Sort-Object Name

$seen = @{}
$list = New-Object System.Collections.ArrayList
foreach ($f in $files) {
  # דילוג על כפילויות לפי hash
  $hash = (Get-FileHash -Path $f.FullName -Algorithm MD5).Hash
  if ($seen.ContainsKey($hash)) { continue }

  # טעינת התמונה ובדיקת יחס אנכי
  try { $img = [System.Drawing.Image]::FromFile($f.FullName) }
  catch { continue }
  $w = $img.Width; $h = $img.Height
  if ($w -le 0 -or ($h / $w) -lt 1.4) { $img.Dispose(); continue }

  $seen[$hash] = $true

  # יצירת thumbnail
  $tw = $THUMB_W; $th = [int][math]::Round($tw * $h / $w)
  $tb = New-Object System.Drawing.Bitmap($tw, $th)
  $tg = [System.Drawing.Graphics]::FromImage($tb)
  $tg.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $tg.DrawImage($img, 0, 0, $tw, $th)
  $tg.Dispose(); $img.Dispose()
  $thumbName = [IO.Path]::GetFileNameWithoutExtension($f.Name) + '.jpg'
  $tb.Save((Join-Path $thumbsDir $thumbName), $jpeg, $encParams)
  $tb.Dispose()

  $type = if ($f.Name -match 'overlay|transparent|shakuf') { 'overlay' } else { 'bg' }
  # רק file/type/thumb. שמות התצוגה (עברית) נקבעים באפליקציה כדי להימנע מבעיות קידוד.
  [void]$list.Add([ordered]@{ file = $f.Name; type = $type; thumb = 'thumbs/' + $thumbName })
}

$json = if ($list.Count -eq 0) { '[]' }
        elseif ($list.Count -eq 1) { "[`n" + ($list[0] | ConvertTo-Json) + "`n]" }
        else { $list | ConvertTo-Json }

[IO.File]::WriteAllText((Join-Path $dir 'frames.json'), $json, (New-Object System.Text.UTF8Encoding($false)))
Write-Output "frames.json + thumbs: $($list.Count) frames (from $($files.Count) files)"
