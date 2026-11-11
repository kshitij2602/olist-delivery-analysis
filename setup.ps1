# One-time setup for Windows PowerShell. Run from the repo root:
#   .\setup.ps1
# It does NOT handle your Kaggle credentials: do that yourself first (see README, "Kaggle access").

$ErrorActionPreference = "Stop"

Write-Host "1/4 Creating virtual environment (.venv)..."
python -m venv .venv
$py = ".\.venv\Scripts\python.exe"
$kaggle = ".\.venv\Scripts\kaggle.exe"

Write-Host "2/4 Installing packages..."
& $py -m pip install --upgrade pip
& $py -m pip install -r requirements.txt

Write-Host "3/4 Downloading the Olist dataset from Kaggle into data\raw ..."
New-Item -ItemType Directory -Force -Path "data\raw" | Out-Null
& $kaggle datasets download -d olistbr/brazilian-ecommerce -p data\raw --unzip

Write-Host "4/4 Loading CSVs into DuckDB (olist.duckdb)..."
& $py scripts\query.py sql\00_load.sql

Write-Host "Done. Check that the row counts above look right, then run sql\00_check_types.sql."
