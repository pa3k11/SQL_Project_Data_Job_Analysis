/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

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
)

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

/*
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
SQL is leading with a lot of jobs requiring sql or variant of it
Python and Tableau are also highly demanded skills.
Other skills like Kafka, R, Pandas, and Power Bi show varying degrees of demand.

[
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "salary_year_avg": "400000.0",
    "job_posted_date": "2023-10-03 11:22:20",
    "job_no_degree_mention": true,
    "company_name": "ЛАНИТ",
    "skills": "oracle"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "salary_year_avg": "400000.0",
    "job_posted_date": "2023-10-03 11:22:20",
    "job_no_degree_mention": true,
    "company_name": "ЛАНИТ",
    "skills": "kafka"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "salary_year_avg": "400000.0",
    "job_posted_date": "2023-10-03 11:22:20",
    "job_no_degree_mention": true,
    "company_name": "ЛАНИТ",
    "skills": "linux"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "salary_year_avg": "400000.0",
    "job_posted_date": "2023-10-03 11:22:20",
    "job_no_degree_mention": true,
    "company_name": "ЛАНИТ",
    "skills": "git"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "salary_year_avg": "400000.0",
    "job_posted_date": "2023-10-03 11:22:20",
    "job_no_degree_mention": true,
    "company_name": "ЛАНИТ",
    "skills": "svn"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-06-22 07:00:59",
    "job_no_degree_mention": true,
    "company_name": "Anthropic",
    "skills": "sql"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-06-22 07:00:59",
    "job_no_degree_mention": true,
    "company_name": "Anthropic",
    "skills": "python"
  },
  {
    "job_id": 285766,
    "job_title": "Partner Technology Manager, Data Analytics and AI",
    "salary_year_avg": "254000.0",
    "job_posted_date": "2023-07-28 13:01:20",
    "job_no_degree_mention": true,
    "company_name": "Google",
    "skills": "gcp"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-07-05 11:01:16",
    "job_no_degree_mention": true,
    "company_name": "Asana",
    "skills": "sql"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-07-05 11:01:16",
    "job_no_degree_mention": true,
    "company_name": "Asana",
    "skills": "snowflake"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-07-05 11:01:16",
    "job_no_degree_mention": true,
    "company_name": "Asana",
    "skills": "asana"
  },
  {
    "job_id": 112060,
    "job_title": "Business Intelligence Data Analyst - Global Monetization Product ...",
    "salary_year_avg": "208500.0",
    "job_posted_date": "2023-12-07 17:01:39",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 112060,
    "job_title": "Business Intelligence Data Analyst - Global Monetization Product ...",
    "salary_year_avg": "208500.0",
    "job_posted_date": "2023-12-07 17:01:39",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "python"
  },
  {
    "job_id": 112060,
    "job_title": "Business Intelligence Data Analyst - Global Monetization Product ...",
    "salary_year_avg": "208500.0",
    "job_posted_date": "2023-12-07 17:01:39",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "tableau"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "python"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "nosql"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "mongodb"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "mysql"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "postgresql"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "mongodb"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "cassandra"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "spark"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "pandas"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "hadoop"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "kafka"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "express"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "tableau"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "power bi"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok",
    "skills": "flow"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-05-25 10:00:43",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "sql"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-05-25 10:00:43",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "python"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-05-25 10:00:43",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "nosql"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-05-25 10:00:43",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "r"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-05-25 10:00:43",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "excel"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-05-25 10:00:43",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "tableau"
  },
  {
    "job_id": 1337808,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-08-03 11:00:53",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "sql"
  },
  {
    "job_id": 1337808,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-08-03 11:00:53",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "python"
  },
  {
    "job_id": 1337808,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-08-03 11:00:53",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "databricks"
  },
  {
    "job_id": 1337808,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-08-03 11:00:53",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "plotly"
  },
  {
    "job_id": 1337808,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-08-03 11:00:53",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "tableau"
  },
  {
    "job_id": 1337808,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-08-03 11:00:53",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc",
    "skills": "github"
  }
]

*/