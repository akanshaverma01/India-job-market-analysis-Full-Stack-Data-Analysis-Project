-- ============================================================
--  India Job Market Analysis — SQL Queries
--  Dataset: Naukri.com (~19,229 job postings)
--  Tables : jobs              → cleaned_job_data
--           skills_exploded   → one row per skill mention
-- ============================================================


-- ────────────────────────────────────────────────────────────
--  TABLE 1 : jobs
-- ────────────────────────────────────────────────────────────

-- Q1. Total job postings and how many have salary disclosed
SELECT
    COUNT(*)                                              AS total_listings,
    SUM(CASE WHEN "Salary Disclosed" = 'Disclosed'
             THEN 1 ELSE 0 END)                          AS salary_disclosed,
    ROUND(
        SUM(CASE WHEN "Salary Disclosed" = 'Disclosed'
                 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    )                                                    AS disclosed_pct
FROM jobs;


-- Q2. Top 10 cities by number of job openings
SELECT
    "Primary Location"   AS city,
    COUNT(*)             AS job_count
FROM jobs
GROUP BY "Primary Location"
ORDER BY job_count DESC
LIMIT 10;


-- Q3. Experience level breakdown — how fresher-friendly is the market?
SELECT
    "Exp Category"       AS experience_level,
    COUNT(*)             AS job_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS pct_of_total
FROM jobs
GROUP BY "Exp Category"
ORDER BY job_count DESC;


-- Q4. Data Science vs Data Analytics — which role dominates?
SELECT
    "Role Type"          AS role,
    COUNT(*)             AS total_jobs,
    ROUND(AVG("Exp Min"), 1) AS avg_min_experience
FROM jobs
WHERE "Role Type" IN ('Data Science', 'Data Analytics')
GROUP BY "Role Type";


-- ────────────────────────────────────────────────────────────
--  TABLE 2 : skills_exploded
-- ────────────────────────────────────────────────────────────

-- Q5. Top 10 most in-demand skills across all listings
SELECT
    skill,
    COUNT(*)   AS mention_count
FROM skills_exploded
GROUP BY skill
ORDER BY mention_count DESC
LIMIT 10;


-- Q6. Which skills are most valued for freshers specifically?
SELECT
    skill,
    COUNT(*)   AS mention_count
FROM skills_exploded
WHERE exp_category = 'Fresher (0 Yrs)'
GROUP BY skill
ORDER BY mention_count DESC
LIMIT 10;


-- Q7. Python vs SQL — head-to-head across all roles
SELECT
    skill,
    COUNT(*)                                           AS total_mentions,
    SUM(CASE WHEN role_type = 'Data Science'
             THEN 1 ELSE 0 END)                        AS data_science_jobs,
    SUM(CASE WHEN role_type = 'Data Analytics'
             THEN 1 ELSE 0 END)                        AS data_analytics_jobs
FROM skills_exploded
WHERE skill IN ('Python', 'SQL')
GROUP BY skill
ORDER BY total_mentions DESC;


-- Q8. Bangalore vs rest — does location affect skill demand?
SELECT
    CASE WHEN primary_location = 'Bangalore'
         THEN 'Bangalore' ELSE 'Rest of India' END    AS region,
    skill,
    COUNT(*)                                           AS mention_count
FROM skills_exploded
WHERE skill IN ('Python', 'SQL', 'Machine Learning', 'Power BI', 'Tableau')
GROUP BY region, skill
ORDER BY region, mention_count DESC;
