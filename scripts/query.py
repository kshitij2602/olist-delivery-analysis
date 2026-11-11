"""Run a .sql file against the local DuckDB database and print the result.

Usage (from the repo root):
    python scripts/query.py sql/00_load.sql
    python scripts/query.py sql/practice/s1_ex1.sql
"""
import sys
from pathlib import Path

import duckdb

ROOT = Path(__file__).resolve().parent.parent
DB = ROOT / "olist.duckdb"


def main() -> None:
    if len(sys.argv) != 2:
        sys.exit("Usage: python scripts/query.py <path-to-sql-file>")
    sql_path = Path(sys.argv[1])
    if not sql_path.is_absolute():
        sql_path = ROOT / sql_path
    if not sql_path.exists():
        sys.exit(f"File not found: {sql_path}")

    # Relative paths inside the SQL files (data/raw/...) resolve from the repo root.
    import os
    os.chdir(ROOT)

    con = duckdb.connect(str(DB))
    try:
        result = con.execute(sql_path.read_text(encoding="utf-8"))
        if result.description is None:
            print("Done (no result set).")
            return
        df = result.fetchdf()
        print(f"{len(df)} row(s)")
        print(df.head(50).to_string(index=False))
        if len(df) > 50:
            print(f"... {len(df) - 50} more row(s) not shown")
    finally:
        con.close()


if __name__ == "__main__":
    main()
