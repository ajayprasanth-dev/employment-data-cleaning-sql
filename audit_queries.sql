--To check the table info
PRAGMA table_info(Messy_dataset);

--Find the total number of rows in the table
SELECT count(*) as total_rows from Messy_dataset;

--Count null values column-wise
SELECT 
sum(case when Status is NULL or Status='' then 1 else 0 END)as Status_null_count,
sum(case when "Age Group" is NULL or "Age Group" ='' then 1 else 0 END)as Age_Group_null_count,
sum(case when Education is NULL or Education='' then 1 else 0 END)as Education_null_count,
sum(case when Industry is NULL or Industry='' then 1 else 0 END)as Industry_null_count,
sum(case when Location is NULL or Location='' then 1 else 0 END)as Location_null_count,
sum(case when "AI Risk"  is NULL or "AI Risk"='' then 1 else 0 END)as AI_Risk_null_count,
sum(case when "Years of Experience" is NULL or "Years of Experience"='' then 1 else 0 END)as Years_of_Experience_null_count,
sum(case when "Monthly Salary (INR)" is NULL or "Monthly Salary (INR)"='' then 1 else 0 END)as Monthly_Salary_null_count,
sum(case when "Date Recorded" is NULL or "Date Recorded"='' then 1 else 0 END)as DateRecorded_null_count
FROM Messy_dataset;

--Calculate the percentage of null values for each column
SELECT 
(sum(case when Status is NULL or Status='' then 1 else 0 END)*100)/count(*) as Status_null_percentage,
(sum(case when "Age Group" is NULL or "Age Group" ='' then 1 else 0 END)*100)/count(*) as Age_Group_null_percenttage,
(sum(case when Education is NULL or Education='' then 1 else 0 END)*100)/count(*) as Education_null_percentage,
(sum(case when Industry is NULL or Industry='' then 1 else 0 END)*100)/count(*) as Industry_null_percentage,
(sum(case when Location is NULL or Location='' then 1 else 0 END)*100)/count(*)as Location_null_percentage,
(sum(case when "AI Risk"  is NULL or "AI Risk"='' then 1 else 0 END)*100)/count(*) as AI_Risk_null_percetage,
(sum(case when "Years of Experience" is NULL or "Years of Experience"='' then 1 else 0 END)*100)/count(*) as Years_of_Experience_null_percentage,
(sum(case when "Monthly Salary (INR)" is NULL or "Monthly Salary (INR)"='' then 1 else 0 END)*100)/count(*) as Monthly_Salary_null_percentage,
(sum(case when "Date Recorded" is NULL or "Date Recorded"='' then 1 else 0 END)*100)/count(*) as DateRecorded_null_percentage
FROM Messy_dataset;

--Find the unique values count for each column

SELECT
    COUNT(DISTINCT Status) as unique_status_count,
    COUNT(DISTINCT "Age Group") as unique_age_group_count,
    COUNT(DISTINCT Education) as unique_education_count,
    COUNT(DISTINCT Industry) as unique_industry_count,
    COUNT(DISTINCT Location) as unique_location_count,
    COUNT(DISTINCT "AI Risk") as unique_ai_risk_count,
    COUNT(DISTINCT "Years of Experience") as unique_experience_count,
    COUNT(DISTINCT "Monthly Salary (INR)") as unique_salary_count,
    COUNT(DISTINCT "Date Recorded") as unique_date_count
FROM Messy_dataset;



