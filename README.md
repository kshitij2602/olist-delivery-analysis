# Olist delivery performance and revenue-risk analysis

> Status: in progress. Sections below marked TODO are filled in as the analysis is completed.

## Business question

Why are orders delivered late, and what does it cost the business?

## Data

Brazilian E-Commerce Public Dataset by Olist (Kaggle, `olistbr/brazilian-ecommerce`): about 100k orders from 2016-2018 across customers, sellers, products, items, payments and reviews.
The raw data is not included in this repo. See "How to reproduce".

## Approach

1. SQL (DuckDB): load, clean and build analysis tables (`sql/`).
2. Python (pandas, scipy): statistical tests on the late-delivery and review-score relationship (`python/`).
3. Dashboard (TODO: Power BI or Tableau Public): link or screenshots in `dashboard/`.

## Key findings

TODO: 3-5 findings, each with a number. Write these last.

## Recommendations

TODO: 2-3 concrete actions with estimated impact and the assumptions behind the estimate.

## Limitations

TODO: what this analysis cannot tell you (observational data, definition of "late", missing cost data, etc.).

## How to reproduce

Requirements: Python 3.10+, a Kaggle account.

```powershell
git clone <this repo>
cd olist-delivery-analysis
# set up Kaggle credentials first (see below), then:
.\setup.ps1
```

Kaggle access: create an API token in your Kaggle account settings and follow Kaggle's current instructions for where to place it. Never commit credentials; `.gitignore` already excludes `kaggle.json` and `.env`.

Run any SQL file:

```powershell
.\.venv\Scripts\python.exe scripts\query.py sql\00_load.sql
```

## Repo layout

```
data/        raw CSVs (not committed)
sql/         numbered SQL files
python/      statistical tests
dashboard/   screenshots and dashboard link
scripts/     helper to run SQL files
```
