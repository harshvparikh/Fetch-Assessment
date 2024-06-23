# Fetch-Assessment
This repository contains my full blown solution for the Fetch Analytics Engineer assessment.

Great! Here is a polished version suitable for a GitHub README:

---

## Approach for Fetch Coding Analytics Assessment

### Environment Setup
- Configured a PostgreSQL database using Docker.

### Data Ingestion
- Stored JSON files.
- Loaded JSON files into the PostgreSQL database.

### Staging Tables Creation
- Created the following staging tables:
  - `brands`
  - `users`
  - `receipts`
  - `item_receipts`

### Business Understanding
- Analyzed the business questions and requirements.

### Data Modeling
- Applied Kimball’s methodology to design Fact and Dimension tables:
  - `dim_brands`
  - `dim_users`
  - `fact_receipts`
  - `bridge_item_receipts`

### Query Development
- Developed SQL queries on the created data model to address the business questions and requirements.

