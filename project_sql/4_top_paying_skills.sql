/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

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
LIMIT 25

/*
Here's a breakdown of the results for top paying skills for Data Analysts:
High Salary, Low Demand: Skills like SVN and Golang offer high compensation but are less commonly required.
High Demand, Moderate Salary: Tools like Hadoop, Databricks, and GCP dominate job postings, reflecting their widespread use in analytics workflows.
Data Engineering Overlap: Many skills (Kafka, Cassandra, MongoDB) suggest that roles are expanding beyond traditional analytics into data engineering and real-time processing.

[
  {
    "skills": "svn",
    "avg_salary": "400000",
    "demand_count": "1"
  },
  {
    "skills": "golang",
    "avg_salary": "165000",
    "demand_count": "1"
  },
  {
    "skills": "unify",
    "avg_salary": "163782",
    "demand_count": "1"
  },
  {
    "skills": "cassandra",
    "avg_salary": "163042",
    "demand_count": "2"
  },
  {
    "skills": "kafka",
    "avg_salary": "154298",
    "demand_count": "14"
  },
  {
    "skills": "mongo",
    "avg_salary": "140000",
    "demand_count": "3"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500",
    "demand_count": "2"
  },
  {
    "skills": "pytorch",
    "avg_salary": "137500",
    "demand_count": "1"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "137500",
    "demand_count": "1"
  },
  {
    "skills": "mongodb",
    "avg_salary": "137061",
    "demand_count": "14"
  },
  {
    "skills": "terraform",
    "avg_salary": "136891",
    "demand_count": "2"
  },
  {
    "skills": "scala",
    "avg_salary": "135973",
    "demand_count": "8"
  },
  {
    "skills": "linux",
    "avg_salary": "131667",
    "demand_count": "18"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "130000",
    "demand_count": "3"
  },
  {
    "skills": "no-sql",
    "avg_salary": "129391",
    "demand_count": "2"
  },
  {
    "skills": "postgresql",
    "avg_salary": "127011",
    "demand_count": "8"
  },
  {
    "skills": "gitlab",
    "avg_salary": "126441",
    "demand_count": "2"
  },
  {
    "skills": "jenkins",
    "avg_salary": "126261",
    "demand_count": "3"
  },
  {
    "skills": "hadoop",
    "avg_salary": "126025",
    "demand_count": "21"
  },
  {
    "skills": "aurora",
    "avg_salary": "124423",
    "demand_count": "3"
  },
  {
    "skills": "git",
    "avg_salary": "124263",
    "demand_count": "15"
  },
  {
    "skills": "gcp",
    "avg_salary": "124255",
    "demand_count": "21"
  },
  {
    "skills": "angular",
    "avg_salary": "123177",
    "demand_count": "6"
  },
  {
    "skills": "c++",
    "avg_salary": "121875",
    "demand_count": "8"
  },
  {
    "skills": "databricks",
    "avg_salary": "120919",
    "demand_count": "25"
  }
]
*/