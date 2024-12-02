/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on positions that do not require a degree positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
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
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
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
        skills_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN
    average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 25

-- rewriting this same query more concisely

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

/*
Here's a breakdown of the most optimal skills for Data Analysts in 2023: 
High-Demand Programming Languages: Python and R stand out for their high demand, with demand counts of 355 and 163 respectively. Despite their high demand, their average salaries are around $100,596 for Python and $99,129 for R, indicating that proficiency in these languages is highly valued but also widely available.
Cloud Tools and Technologies: Skills in specialized technologies such as Snowflake, Azure and AWS show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
Business Intelligence and Visualization Tools: Tableau and Looker, with demand counts of 305 and 74 respectively, and average salaries around $98,590 and $108,170, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
SQL: SQL is by far the most demanded skill with demand count of 715 which is almost twice as much as second most demanded skill, Excel, it also has pretty high average salary od $96,628 which makes it the most optimal skill to learn as a Data Analyst.

[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "715",
    "avg_salary": "96628"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "375",
    "avg_salary": "83842"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "355",
    "avg_salary": "100596"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "305",
    "avg_salary": "98590"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "223",
    "avg_salary": "91114"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "163",
    "avg_salary": "99120"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "87",
    "avg_salary": "96533"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "87",
    "avg_salary": "83101"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "83",
    "avg_salary": "105950"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "74",
    "avg_salary": "108170"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "73",
    "avg_salary": "85878"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "70",
    "avg_salary": "92171"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "68",
    "avg_salary": "106739"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "65",
    "avg_salary": "95853"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "60",
    "avg_salary": "104403"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "55",
    "avg_salary": "113362"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "51",
    "avg_salary": "94000"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "51",
    "avg_salary": "94000"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": "49",
    "avg_salary": "86847"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "44",
    "avg_salary": "115422"
  },
  {
    "skill_id": 198,
    "skills": "outlook",
    "demand_count": "39",
    "avg_salary": "87098"
  },
  {
    "skill_id": 15,
    "skills": "matlab",
    "demand_count": "31",
    "avg_salary": "80060"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "30",
    "avg_salary": "105415"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "29",
    "avg_salary": "108787"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "28",
    "avg_salary": "101952"
  }
]
*/