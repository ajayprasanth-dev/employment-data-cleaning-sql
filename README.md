#  Data Cleaning – Indian Employment Dataset

This repository documents a complete **SQL-based data cleaning project** on an Indian employment dataset.  
The goal is to **transform messy, inconsistent raw data into a structured, analysis-ready format** — simulating a real-world data analyst workflow.


##  Project Overview
- **Dataset Name:** Indian Employment Dataset  
- **Objective:** Audit, clean, and standardize raw data to prepare it for analysis.  
- **Focus:** Identifying anomalies, handling null values, standardizing formats, and documenting cleaning decisions.  
- **Tools Used:** SQLite (DB Browser), SQL  


##  Dataset Information
The dataset contains information on employment, salary, and demographic details.  
**Key columns include:**  
- `Status`  
- `Age Group`  
- `Education`  
- `Industry`  
- `Location`  
- `AI Risk`  
- `Years of Experience`  
- `Monthly Salary (INR)`  
- `Date Recorded`  

##  Cleaning Process
The cleaning followed a structured workflow:  

1. **Audit** – Checked row counts, null values, and unique entries.  
2. **Identify Anomalies** – Found inconsistent casing, typos, missing values, and invalid formats.  
3. **Apply Fixes** – Replaced nulls, standardized values, handled duplicates, corrected formats.  
4. **Validation** – Verified data quality after cleaning.  
5. **Documentation** – Recorded all anomalies and decisions for transparency.  


##  Key Cleaning Decisions
- **Status Column:** Removed null/blank entries and standardized responses.  
- **Age Group Column:** Fixed inconsistent ranges and filled missing values with appropriate categories.  
- **Education Column:** Corrected typos and unified inconsistent levels (e.g., "Bachlor" → "Bachelor").  
- **Industry Column:** Standardized industry names and removed duplicates.  
- **Location Column:** Cleaned inconsistent formatting and filled missing entries logically.  
- **AI Risk Column:** Replaced blanks with "Unknown" to preserve data integrity.  
- **Years of Experience Column:** Converted inconsistent formats into numeric ranges.  
- **Monthly Salary (INR) Column:** **Null values replaced with the median salary** to maintain realistic distribution.  
- **Date Recorded Column:** Standardized all entries into `YYYY-MM-DD` format.
  

##  Results
✅ Data transformed into a **clean, structured, analysis-ready dataset**  
✅ All missing values handled appropriately (median imputation, logical fills, Unknown category)  
✅ Standardized formats across salary, date, and categorical variables  
✅ Complete documentation for transparency  

