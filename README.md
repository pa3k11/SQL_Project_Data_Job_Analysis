# Introduction
📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

Data hails from my [SQL Course](https://lukebarousse.com/sql). It's packed with insights on job titles, salaries and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and job with no degree mentioned, focusing on jobs that do not require a degree. This query highlights the high paying opportunities in the field.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    job_no_degree_mention,
    name AS company_name
FROM    
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND job_no_degree_mention = TRUE AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of the top data analyst jobs in 2023:
- **Wide Salary Range**: Top 10 paying data analyst roles span from $200,000 to $650,000, indicating significant salary potential in the field.
- **Employers**: Most of the jobs that offer high salaries are from tech companies, such as Meta, Google and TikTok
- **Job Title Variety**: There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.
```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        job_posted_date,
        job_no_degree_mention,
        name AS company_name
    FROM    
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_no_degree_mention = TRUE AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
);

SELECT
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN 
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
```
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
- **SQL** is leading with a lot of jobs requiring sql or variant of it
- **Python** and **Tableau** are also highly demanded skills.
- Other skills like Kafka, R, Pandas, and Power Bi show varying degrees of demand.

### 3. In-Demand Skills for Data Analysts

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_no_degree_mention = True
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
Here's the breakdown of the most demanded skills for data analysts in 2023
- **SQL** and **Excel** remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
- Programming and Visualization Tools like **Python**, **Tableau**, and **Power BI** are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

| **Skills**    | **Demand Count** |
|---------------|------------------|
| SQL           | 31,980           |
| Excel         | 20,549           |
| Python        | 17,327           |
| Tableau       | 14,103           |
| Power BI      | 13,450           |

*Table of the demand for the top 5 skills in data analyst job postings*

### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_no_degree_mention = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
Here's a breakdown of the results for top paying skills for Data Analysts:
- **High Salary, Low Demand**: Skills like SVN and Golang offer high compensation but are less commonly required.
- **High Demand, Moderate Salary**: Tools like Hadoop, Databricks, and GCP dominate job postings, reflecting their widespread use in analytics workflows.
- **Data Engineering Overlap**: Many skills (Kafka, Cassandra, MongoDB) suggest that roles are expanding beyond traditional analytics into data engineering and real-time processing.


| **#** | **Skills**    | **Average Salary** | **Demand Count** |
|-------|---------------|--------------------|------------------|
| 1     | SVN           | $400,000           | 1                |
| 2     | Golang        | $165,000           | 1                |
| 3     | Unify         | $163,782           | 1                |
| 4     | Cassandra     | $163,042           | 2                |
| 5     | Kafka         | $154,298           | 14               |
| 6     | Mongo         | $140,000           | 3                |
| 7     | Twilio        | $138,500           | 2                |
| 8     | PyTorch       | $137,500           | 1                |
| 9     | TensorFlow    | $137,500           | 1                |
| 10    | MongoDB       | $137,061           | 14               |

*Table of the average salary for the top 10 paying skills for data analysts*

### 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_no_degree_mention = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25;
```
Here's a breakdown of the most optimal skills for Data Analysts in 2023: 
- **High-Demand Programming Languages**: Python and R stand out for their high demand, with demand counts of 355 and 163 respectively. Despite their high demand, their average salaries are around $100,596 for Python and $99,129 for R, indicating that proficiency in these languages is highly valued but also widely available.
- **Cloud Tools and Technologies**: Skills in specialized technologies such as Snowflake, Azure and AWS show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
- **Business Intelligence and Visualization Tools**: Tableau and Looker, with demand counts of 305 and 74 respectively, and average salaries around $98,590 and $108,170, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
- **SQL**: SQL is by far the most demanded skill with demand count of 715 which is almost twice as much as second most demanded skill, Excel, it also has pretty high average salary od $96,628 which makes it the most optimal skill to learn as a Data Analyst.

| **#** | **Skills**      | **Demand Count** | **Average Salary** |
|-------|-----------------|------------------|--------------------|
| 1     | SQL             | 715              | $96,628            |
| 2     | Excel           | 375              | $83,842            |
| 3     | Python          | 355              | $100,596           |
| 4     | Tableau         | 305              | $98,590            |
| 5     | Power BI        | 223              | $91,114            |
| 6     | R               | 163              | $99,120            |
| 7     | SQL Server      | 87               | $96,533            |
| 8     | Word            | 87               | $83,101            |
| 9     | Azure           | 83               | $105,950           |
| 10    | Looker          | 74               | $108,170           |

*Table of the most optimal skills for data analyst sorted by demand count*

# What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **Advanced Query Development:** Proficient in crafting complex SQL queries, including advanced table joins and the effective use of `WITH` clauses for temporary table creation.  
- **Data Aggregation Expertise:** Skilled in leveraging `GROUP BY` and aggregate functions such as `COUNT()` and `AVG()` to efficiently summarize and analyze data.  
- **Analytical Problem-Solving:** Demonstrated ability to translate business questions into actionable insights through precise and insightful SQL queries.  

# Conclusions

### Insights
From the analysis, several general insights emerged:

1. **Top-Paying Data Analyst Jobs**: The highest-paying jobs for data analysts that do not require a degree offer a wide range of salaries, the highest at $650,000!
2. **Skills for Top-Paying Jobs**: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
3. **Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills with Higher Salaries**: Specialized skills, such as SVN and Golang, are associated with the highest average salaries, indicating a premium on niche expertise.
5. **Optimal Skills for Job Market Value**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.