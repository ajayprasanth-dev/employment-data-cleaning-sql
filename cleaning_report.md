# Data Cleaning – Messy_dataset

This document describes the cleaning process for each column in the `Messy_dataset`.  
It includes anomalies, cleaning steps, reasoning, and final outcomes.

---

### 1) Status Column

**Original Anomalies:**  
EMPLOYED, UNEMPLOYED, Null, Unemployed, employed, unemployed, Employed

**Cleaning Steps:**  
1. Standardized `EMPLOYED` and `employed` → `Employed`.  
2. Standardized `UNEMPLOYED` and `unemployed` → `Unemployed`.  
3. Replaced `NULL` values → `Unknown`.

**why I put Unknown?**  
- Preserves row count – no data is lost.  
- Maintains transparency – allows grouping to show "Unknown".  
- Avoids false assumptions – NULL is explicitly marked.  
- Standard practice – using "Unknown" for missing categorical values is common.

✅ **Final standardized values:** `Employed`, `Unemployed`, `Unknown`.

---

### 2) Age Group Column

**Original Values:**  
25_34, 18-24, 45-54, 35 - 44, 55+, 25-34, 18 to 24

**Cleaning Steps:**  
- `'25_34','25-34','25 to 34'` → `25-34`  
- `'18-24','18 to 24'` → `18-24`  
- `'35 - 44'` → `35-44`  
- Replaced `NULL` → `Unknown`

**Unknown?**  
- Keeps demographic data intact.  
- Preserves all rows for analysis.  
- Avoids guessing values, which could introduce bias.

✅ **Final distinct values:** `25-34, 18-24, 45-54, 35-44, 55+, Unknown`.

---

### 3) Education Column

**Original Values:**  
high school, Diploma, High School, Masters, PhD, Master, Ph.D, Bachelors, Null, Bachelor's

**Cleaning Steps:**  
- `high school` → `High School`  
- `Bachelors` → `Bachelor's`  
- `Masters`, `Master` → `Master’s`  
- `Ph.D` → `PhD`  
- Replaced `NULL` → `Unknown`

**why unknown instead of null?**  
- Education is key for analysis (e.g., salary trends, AI risk perception).  
- Dropping rows loses useful data.  
- Imputing guesses introduces bias.  
- Using "Unknown" preserves rows without misleading results.

✅ **Final standardized values:** High School, Diploma, Bachelor's, Master’s, PhD, Unknown

---

### 4) Industry Column

**Original Values:**  
Technology, Fintech, Retail, Tech, null, Health, Healthcare, Education, Finance

**Cleaning Steps:**  
- `Tech` → `Technology`  
- `Health` → `Healthcare`  
- Replaced `NULL` → `Unknown`

**Unknown?**  
- Maintains transparency of missing data.  
- Avoids misleading insights.

✅ **Final standardized values:** Technology, Fintech, Retail, Healthcare, Education, Finance, Unknown

---

### 5) Location Column

**Original Values:**  
Urban, rural, Delhi, Hyderabad, Bangalore, Mumbai, urban, suburban

**Cleaning Steps:**  
- `urban` → `Urban`  
- `rural` → `Rural`  
- `suburban` → `Suburban`  
- Replaced `NULL` → `Unknown`

**Why I put unknown?**  
- Keeps all rows for analysis.  
- Enables counting of missing responses.

✅ **Final standardized values:** Urban, Rural, Suburban, Delhi, Hyderabad, Bangalore, Mumbai, Unknown

---

### 6) AI Risk Column

**Original Values:**  
moderate, Low, low, HIGH, Medium, High

**Cleaning Steps:**  
- `low` → `Low`  
- `moderate` → `Medium`  
- `HIGH` → `High`  
- Replaced `NULL` → `Unknown`

**Why I put unknown?**  
- AI Risk shows perception of risk.  
- Preserves all rows without guessing values.  
- "Unknown" can be treated as a separate category in analysis.

✅ **Final standardized values:** Low, Medium, High, Unknown

---

### 7) Years of Experience Column

**Original Values:** Mostly consistent with some NULL values.

**Cleaning Steps:**  
- Replaced `NULL` → `Unknown`.

**Unknown reason**  
- Preserves all rows for analysis.  
- Avoids introducing incorrect assumptions.

✅ **Final standardized values:** Original values + Unknown for missing

---

### 8) Monthly Salary Column

**Original Issues:**  
- Extra spaces in some rows  
- NULL values present

**Cleaning Steps:**  
- Trimmed extra spaces using the `TRIM()` function.  
- Replaced `NULL` values with **median salary**.

**Why I put median salary instead of NULL?**  
- Maintains data integrity.  
- Median replacement avoids skewing analysis.  
- Preserves dataset size.  
- Ensures numeric consistency for analysis.

✅ **Final standardized column:** Clean numeric salaries, no NULLs, missing values filled with median

---

### 9) Date Recorded Column

**Original Issues:**  
- Non-standard date formats  
- Some malformed entries

**Cleaning Steps:**  
- Standardized proper formats (YYYY-MM-DD).  
- Malformed dates replaced with `NULL`.

**The reason behind the null values**  
- Keeps dataset truthful – no invented dates.  
- Most analytical tools can handle NULLs.  
- Allows accurate filtering and counting.

✅ **Final column:** Standardized dates + NULLs for missing/invalid entries

---

### Final Status

- All columns cleaned and standardized.  
- Missing categorical data replaced with `Unknown`.  
- Monthly salary missing values replaced with **median**.  
- Dataset ready for analysis and visualization.
