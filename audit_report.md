# Dataset Audit Report

## Table Structure

| Column                 | Data Type | 
|------------------------|-----------|
| Status                 | TEXT      | 
| Age Group              | TEXT      | 
| Education              | TEXT      | 
| Industry               | TEXT      | 
| Location               | TEXT      | 
| AI Risk                | TEXT      | 
| Years of Experience    | TEXT      | 
| Monthly Salary (INR)   | TEXT      | 
| Date Recorded          | TEXT      | 

## Observations

- After reviewing the table, I found some inconsistencies in data types for the following columns:  
  **Age Group, Monthly Salary, Date Recorded, and Years of Experience.**
- The dataset contains **9 columns and 2,000 rows**.

## Null Values (Column-wise)

| Column                 | Null Count |
|------------------------|------------|
| Status                 | 268        |
| Age Group              | 232        |
| Education              | 196        |
| Industry               | 201        |
| Location               | 213        |
| AI Risk                | 284        |
| Years of Experience    | 1,020      |
| Monthly Salary (INR)   | 387        |
| Date Recorded          | 0          |

## Null Values Percentage

| Column                 | Null Percentage |
|------------------------|----------------|
| Status                 | 13%            |
| Age Group              | 11%            |
| Education              | 9%             |
| Industry               | 10%            |
| Location               | 10%            |
| AI Risk                | 14%            |
| Years of Experience    | 51%            |
| Monthly Salary (INR)   | 19%            |
| Date Recorded          | 0%             |

## Unique Values Count

| Column                 | Unique Values |
|------------------------|---------------|
| Status                 | 6             |
| Age Group              | 7             |
| Education              | 9             |
| Industry               | 8             |
| Location               | 8             |
| AI Risk                | 6             |
| Years of Experience    | 31            |
| Monthly Salary (INR)   | 978           |
| Date Recorded          | 2,000         |
