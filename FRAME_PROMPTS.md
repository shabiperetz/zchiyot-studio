# מדריך פרומפטים למסגרות (מחוללי תמונות)

מדריך ליצירת מסגרות/רקעים למערכת "מפגש הספורט טבריה". אחרי הייצור מעלים דרך **"➕ הוסף מסגרת"** באפליקציה.

> חשוב: זה לא סותר את כלל "ללא AI" — הכלל מגן על **תמונת הזכייה האמיתית**. מסגרת/רקע הם אמנות דקורטיבית נפרדת.

---

## ⭐ פרומפט אחד ל-ChatGPT (העתק-הדבק)

```
אני צריך רקעים לעיצוב תמונות "סטורי" של זכיות לעסק בשם "מפגש הספורט טבריה"
(כתובת: שד' ספיר, טבריה). זהות המותג: ירוק עמוק + זהב, יוקרתי וחגיגי.

צור לי אחת-אחת 6 תמונות רקע אנכיות. אחרי כל תמונה עצור, ואני אכתוב "הבא"
כדי שתעבור לתמונה הבאה.

חוקים לכל התמונות (חובה בכולן):
- יחס אנכי 9:16, גודל 1080x1920.
- המרכז חייב להישאר ריק ונקי — שם תשב תמונת הזכייה האמיתית.
- הקישוט רק בשוליים ובפינות + מסגרת מעוטרת מסביב.
- רקע כהה, והאזור העליון והתחתון כהים במיוחד (שם יופיע טקסט).
- בלי שום טקסט, אותיות, מספרים או לוגו בכלל.
- בלי אנשים, בלי סימני מים.

6 הסגנונות:
1) שחור-זהב יוקרתי: רקע שחור עם זוהר עדין, מסגרת זהב זוהרת, קונפטי זהב בשוליים.
2) ירוק-זהב מיתוגי: גרדיאנט ירוק אמרלד לשחור, מסגרת זהב, קרני אור עדינות מלמעלה.
3) צ'אנס חגיגי: שחור וזהב, סמלי קלפים (עלה/לב/תלתן/יהלום) ומטבעות זהב בפינות.
4) חיש גד צבעוני: כהה עם מגנטה/טורקיז/זהב, נצנצים וקונפטי בשוליים.
5) ווינר ספורטיבי: כחול כהה ושחור עם זהב, קרני תאורת אצטדיון מלמעלה.
6) מסגרת אמינות מינימלית: רקע נקי כהה, מסגרת זהב דקה ואלגנטית, הרבה שטח ריק במרכז, בלי קונפטי.

התחל מתמונה 1.
```

### מסגרת שקופה (אחרי ה-6):
```
עכשיו צור מסגרת קישוט זהב מעוטרת עם מרכז שקוף לגמרי (חלון ריק באמצע),
רקע שקוף (transparent PNG), רק המסגרת עצמה, בלי מילוי רקע, יחס 9:16, בלי טקסט ובלי אנשים.
```
אם אין שקיפות אמיתית — בקש את המסגרת על רקע ירוק אחיד, ואז remove.bg → PNG שקוף.

---

## כללי זהב לכל מסגרת

1. יחס אנכי 9:16 (1080×1920). ב-Midjourney: `--ar 9:16`.
2. **מרכז פנוי** לתמונת הזכייה.
3. קישוט בשוליים/פינות בלבד.
4. רקע כהה (טקסט זהב/לבן צריך להיקרא); אזור עליון+תחתון כהים לטקסט.
5. **בלי טקסט:** `no text, no letters, no words, no watermark`.
6. **בלי אנשים:** `no people`.

## הגדרות לפי מחולל
- **Midjourney:** בסוף כל פרומפט `--ar 9:16 --style raw --q 2`
- **ChatGPT / DALL·E:** בתחילת הבקשה "Vertical 9:16 image, 1080x1920"
- **Leonardo / Ideogram / Firefly:** בחר יחס 9:16 בהגדרות

---

## פרומפטים בודדים — רקעים (Background, JPG)

**שחור-זהב יוקרתי:**
```
Luxury vertical background, deep black gradient with warm glow at top, ornate gold art-deco corners and thin glowing gold border, subtle gold bokeh and falling gold confetti along the edges, empty dark clear center for a photo, elegant premium celebration mood, no text, no letters, no people, no watermark --ar 9:16 --style raw
```

**ירוק-זהב (מיתוג):**
```
Elegant vertical background, deep emerald green to black gradient, glowing gold ornamental frame and decorative corners, soft light rays from top, gentle gold confetti at the edges, clean empty center for a photo, luxurious lucky celebration vibe, no text, no letters, no people --ar 9:16 --style raw
```

**צ'אנס חגיגי:**
```
Casino luxury vertical background, black and gold, playing card suits (spades hearts clubs diamonds) subtly scattered in the corners, golden coins and clover, glowing gold frame, empty clear center, festive lucky mood, no text, no letters, no people --ar 9:16 --style raw
```

**חיש גד צבעוני:**
```
Festive colorful vertical background, dark navy base with vibrant magenta teal and gold accents, sparkles glitter and confetti along the edges, silver and gold shimmer, instant-win celebration energy, empty clear center for a photo, no text, no letters, no people --ar 9:16 --style raw
```

**ווינר ספורטיבי:**
```
Sports stadium vertical background, dark blue and black with gold accents, dramatic stadium floodlight beams from the top, subtle soccer field texture, glowing gold frame, empty clear center, energetic match-night atmosphere, no text, no letters, no people --ar 9:16 --style raw
```

**מסגרת אמינות (מינימלי):**
```
Minimalist elegant vertical background, soft dark neutral gradient, thin refined double gold frame, very subtle texture, lots of clean empty space in the center for a photo, calm trustworthy premium look, no confetti, no text, no letters, no people --ar 9:16 --style raw
```

## מסגרת שקופה (Overlay PNG)
```
Ornate golden picture frame border, transparent empty center, decorative baroque gold corners, glowing edges, confetti accents only around the border, PNG with transparent background, isolated frame only, no background fill, no text, no people --ar 9:16
```
שקיפות: ייצר `on solid chroma green background` → הסר רקע ב-remove.bg / Photoroom. או השתמש ב-Ideogram/Firefly (תמיכה בשקיפות).

---

## אל תעשה ❌
- טקסט/מספרים/סכומים בתמונה (נוסיף באפליקציה)
- מרכז צפוף בקישוט
- רקע בהיר מדי (הטקסט ייעלם)
