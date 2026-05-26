# india-job-market-analysis

**End-to-end analysis of 19,229 Data Science & Data Analytics job postings from Naukri.com — covering data cleaning, skill extraction, SQL querying, and a Power BI dashboard.**

---

## Project Overview

This project explores the Indian job market for data roles by scraping and analyzing listings from Naukri.com. The goal is to answer practical questions a job seeker or hiring manager would care about: which cities dominate hiring, what skills actually get demanded vs. what gets talked about, how experience requirements break down, and why salary transparency is nearly nonexistent.

The pipeline goes from raw scraped data → Python preprocessing & EDA → normalized skill extraction → SQL analysis → Power BI dashboard.

---
## Repository Structure

```
india-job-market-analysis/
│
├── data/
│   ├── raw_job_data.csv             
│   ├── jobs_clean.csv                
│   └── skills_exploded_data.csv     
│
├── notebooks/
│   └── Job_market_eda___preprocessing.ipynb 
│
├── sql files/
│   └── job_market_queries.sql       
│
├── power bi dashboard & files/
│   ├── job_market_analysis_dashboard.pbix    
│   └── job_market_analysis_dashboard.pdf      
│
└── README.md
```

---

## Dataset

**Source:** Naukri.com job listings  
**Scope:** Data Science and Data Analytics roles across India  
**Size:** 19,229 job postings 

---



## Pipeline Overview
Step 1 — Data Cleaning & Feature Engineering (Jupyter)
Step 2 — Exploratory Data Analysis (Jupyter)
Step 3 — Load to PostgreSQL
Step 4 — SQL Analysis
Step 5 — Power BI Dashboard

---


**
## Key Findings

**Market structure**
- 51% of listings target Data Analytics roles; Data Science accounts for ~12%
- 74% of roles require 1–5 years of experience; only 7.5% are fresher-friendly

**Geography**
- Bangalore holds 22% of all listings (4,165 jobs) — roughly 3× Gurgaon and Pune combined
- Top 5 cities (Bangalore, Hyderabad, Mumbai, Gurgaon, Pune) account for the majority of listings

**Skills**
- "Data Analysis" and "Analytical" appear in 3,878 and 3,050 listings respectively — soft analytical ability is demanded as frequently as hard tools
- Machine Learning dominates Data Science listings; SQL and Excel are more prevalent in Data Analytics
- Python leads in Data Science; SQL is the top tool for Data Analytics
- Power BI demand outpaces Tableau in analytics roles

**Salary transparency**
- 91.1% of listings do not disclose salary — candidates across all experience bands negotiate without a reference point**

---
