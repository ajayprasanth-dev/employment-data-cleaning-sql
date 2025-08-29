--Cleaning Queries with Explanations

--Status Column

-- Standardize the `Status` column values to consistent format
UPDATE Messy_dataset 
SET Status="Employed"
WHERE Status IN ("EMPLOYED","employed");

UPDATE Messy_dataset 
SET Status="Unemployed"
WHERE Status IN ("UNEMPLOYED","unemployed");

-- Calculate the null percentage in Status column
SELECT 
    CAST((SUM(CASE WHEN Status IS NULL THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS INT) || '%' AS null_percentage
FROM Messy_dataset;

-- Another version of null percentage calculation
SELECT 
    (sum(case when Status is null then 1 else 0 end) * 100.0) / count(*) || '%' as null_percentage
FROM Messy_dataset;

-- Replace null values in Status column with "Unknown"
UPDATE Messy_dataset
SET Status="Unknown"
WHERE Status is NULL;

--Age Group Column

-- Check unique values in the Age Group column
SELECT DISTINCT "Age Group" FROM Messy_dataset;

-- Standardize different formats of age groups
UPDATE Messy_dataset
SET "Age Group"='25-34'
WHERE "Age Group" IN ('25_34','25-34','25 to 34');

UPDATE Messy_dataset
SET "Age Group"='18-24'
WHERE "Age Group" IN ('18-24','18 to 24');

UPDATE Messy_dataset
SET "Age Group" ='35-44'
WHERE "Age Group" ='35 - 44';

-- Advanced cleaning for large unique counts using regex
SELECT 
    TRIM(
        REGEXP_REPLACE("Age Group", '[^0-9]', '-', 'g'), 
        '-'
    ) AS Clean_Age_Group
FROM Messy_dataset;

-- Replace null values in Age Group with "Unknown"
UPDATE Messy_dataset
SET "Age Group"='Unknown'
WHERE "Age Group" is null;

--Education Column

-- Check unique values in Education column
SELECT DISTINCT Education from Messy_dataset;

-- Standardize Education values
UPDATE Messy_dataset
SET Education='High School'
WHERE Education ='high school';

UPDATE Messy_dataset
SET Education='Bachelor’s'
WHERE Education ='Bachelors';

UPDATE Messy_dataset
SET Education='Master’s'
WHERE Education IN("Master","Masters");

UPDATE Messy_dataset
SET Education='PhD'
WHERE Education='Ph.D';

UPDATE Messy_dataset 
SET Education="Bachelor's"
WHERE Education="Bachelor's";

-- Replace null values in Education column with "Unknown"
UPDATE Messy_dataset
SET Education="Unknown"
WHERE Education is null;

--Industry Column

-- Check unique values in Industry column
SELECT DISTINCT Industry FROM Messy_dataset;

-- Standardize Industry values
UPDATE Messy_dataset
SET Industry='Technology'
WHERE Industry='Tech';

UPDATE Messy_dataset
SET Industry='Healthcare'
WHERE Industry='Health';

-- Replace null values in Industry with "Unknown"
UPDATE Messy_dataset
SET Industry='unknown'
WHERE Industry is null;

--Location Column

-- Check unique values in Location column
SELECT DISTINCT Location from Messy_dataset;

-- Standardize Location values
UPDATE Messy_dataset
SET Location='Rural'
WHERE Location='rural';

UPDATE Messy_dataset
SET Location='Urban'
WHERE Location='urban';

UPDATE Messy_dataset
SET Location='Suburban'
WHERE Location='suburban';

-- Replace null values in Location with "Unknown"
UPDATE Messy_dataset
SET Location='Unknown'
WHERE Location is null;

--AI Risk Column

-- Check unique values in AI Risk column
SELECT DISTINCT "AI Risk" from Messy_dataset;

-- Normalize AI Risk values
UPDATE Messy_dataset
SET "AI Risk"='Low'
WHERE "AI Risk"='low';

UPDATE Messy_dataset
SET "AI Risk"='Medium'
WHERE "AI Risk"='moderate';

UPDATE Messy_dataset
SET "AI Risk"='High'
WHERE "AI Risk"='HIGH';

-- Replace null values in AI Risk with "Unknown"
UPDATE Messy_dataset
SET "AI Risk"='Unknown'
WHERE "AI Risk" is NULL;

--Years of Experience Column

-- Check unique values in Years of Experience column
SELECT DISTINCT "Years of Experience" from Messy_dataset;

-- Replace null values in Years of Experience with "Unknown"
UPDATE Messy_dataset
SET "Years of Experience"='Unknown'
WHERE "Years of Experience" is NULL;

--Monthly Salary Column

-- Trim extra spaces in Monthly Salary column
UPDATE Messy_dataset
SET "Monthly Salary (INR)"=trim("Monthly Salary (INR)");

-- Convert salary text column to integer
UPDATE Messy_dataset
SET "Monthly Salary"= CAST(TRIM(salary_column) AS INT);

-- Calculate median salary for missing value replacement
SELECT AVG("Monthly Salary (INR)") AS Median_Salary
FROM (
    SELECT "Monthly Salary (INR)"
    FROM messy_dataset
    WHERE "Monthly Salary (INR)" IS NOT NULL
    ORDER BY "Monthly Salary (INR)"
    LIMIT 2 - (SELECT COUNT(*) FROM messy_dataset WHERE "Monthly Salary (INR)" IS NOT NULL) % 2
    OFFSET (SELECT (COUNT(*) - 1) / 2 FROM messy_dataset WHERE "Monthly Salary (INR)" IS NOT NULL)
);

-- Replace null values in Monthly Salary with median
UPDATE messy_dataset
SET "Monthly Salary (INR)" = 33200
WHERE "Monthly Salary (INR)" IS NULL;

--Date Recorded Column

-- Standardize proper dates (YYYY-DD-MM -> YYYY-MM-DD)
UPDATE Messy_dataset
SET "Date Recorded" = 
    SUBSTR("Date Recorded", 1, 4) || '-' || 
    SUBSTR("Date Recorded", 9, 2) || '-' ||  
    SUBSTR("Date Recorded", 6, 2)           
WHERE "Date Recorded" LIKE '202%-__-__';

-- Set malformed dates to NULL
UPDATE Messy_dataset
SET "Date Recorded" = NULL
WHERE "Date Recorded" LIKE '%/-_%';
