/*
Question: What are the top-paying Data Analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that do not require a degree
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, filtering jobs that do not require a degree.
*/

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
    job_title_short = 'Data Analyst' AND
    job_no_degree_mention = TRUE AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

/*
Here's the breakdown of the top data analyst jobs in 2023:
Wide Salary Range: Top 10 paying data analyst roles span from $200,000 to $650,000, indicating significant salary potential in the field.
Companies: Most of the jobs that offer high salaries are from tech companies, such as Meta, Google and TikTok
Job Title Variety: There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

RESULTS
=======
[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33",
    "job_no_degree_mention": true,
    "company_name": "Mantys"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "job_location": "Belarus",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "400000.0",
    "job_posted_date": "2023-10-03 11:22:20",
    "job_no_degree_mention": true,
    "company_name": "ЛАНИТ"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-06-22 07:00:59",
    "job_no_degree_mention": true,
    "company_name": "Anthropic"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23 12:04:42",
    "job_no_degree_mention": true,
    "company_name": "Meta"
  },
  {
    "job_id": 285766,
    "job_title": "Partner Technology Manager, Data Analytics and AI",
    "job_location": "Austin, TX",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "254000.0",
    "job_posted_date": "2023-07-28 13:01:20",
    "job_no_degree_mention": true,
    "company_name": "Google"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-07-05 11:01:16",
    "job_no_degree_mention": true,
    "company_name": "Asana"
  },
  {
    "job_id": 112060,
    "job_title": "Business Intelligence Data Analyst - Global Monetization Product ...",
    "job_location": "San Jose, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "208500.0",
    "job_posted_date": "2023-12-07 17:01:39",
    "job_no_degree_mention": true,
    "company_name": "TikTok"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "job_location": "Los Angeles, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "204584.5",
    "job_posted_date": "2023-06-17 14:00:38",
    "job_no_degree_mention": true,
    "company_name": "TikTok"
  },
  {
    "job_id": 1337808,
    "job_title": "Staff Business Data Analyst",
    "job_location": "Mountain View, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-08-03 11:00:53",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "job_location": "Mountain View, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-05-25 10:00:43",
    "job_no_degree_mention": true,
    "company_name": "Intuit Inc"
  }
]
*/