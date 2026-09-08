# E-commerce Sales Analysis — SQL & DuckDB

## Overview

This project analyzes e-commerce event data using **SQL and DuckDB** to understand user behavior, conversion funnels, customer journey times, and revenue performance.

The analysis focuses on transforming raw event-level data into meaningful business metrics that can support decisions around **conversion optimization, customer behavior, and sales performance**.

## Tools

* SQL
* DuckDB
* CSV

## Dataset

The project uses an event-based e-commerce dataset containing information such as:

* `user_id`
* `event_type`
* `event_date`
* `traffic_source`
* `amount`

Events analyzed include:

* `page_view`
* `add_to_cart`
* `checkout_start`
* `payment_info`
* `purchase`

The analyses focus on events occurring within the **last year**.

---

## Analyses

### 1. User Journey Analysis

Measures how long converted users take to progress through the purchasing journey.

The query identifies each user's first:

* Page view
* Add to cart
* Purchase

It then calculates:

* Number of converted users
* Average time from page view → add to cart
* Average time from add to cart → purchase
* Average total journey time

**SQL concepts:**

* CTEs
* `MIN()`
* Conditional aggregation
* `CASE WHEN`
* `HAVING`
* Date/time differences
* `AVG()`

---

### 2. Traffic Source Funnel Analysis

Analyzes user conversion performance by traffic source.

For each traffic source, the analysis calculates:

* Unique page-view users
* Unique add-to-cart users
* Unique purchasers
* Page view → add-to-cart conversion rate
* Page view → purchase conversion rate
* Add-to-cart → purchase conversion rate

The results are ordered by the number of purchases.

**SQL concepts:**

* CTEs
* `GROUP BY`
* `COUNT(DISTINCT ...)`
* Conditional aggregation
* Conversion-rate calculations
* Business segmentation

---

### 3. Overall Funnel Volume Analysis

Measures how many unique users reach each stage of the e-commerce funnel:

```text
Page View
    ↓
Add to Cart
    ↓
Checkout
    ↓
Payment Information
    ↓
Purchase
```

The query calculates the number of unique users reaching each stage.

This provides a high-level view of **where users enter and leave the purchasing funnel**.

**SQL concepts:**

* CTEs
* `COUNT(DISTINCT ...)`
* Conditional aggregation
* Funnel analysis

The resulting analysis is exported as a CSV file using DuckDB's `COPY TO` command.

---

### 4. Funnel Stage Conversion Analysis

Calculates the conversion rate between each consecutive stage of the purchasing funnel:

```text
Page View → Add to Cart
Add to Cart → Checkout
Checkout → Payment Information
Payment Information → Purchase
```

`NULLIF()` is used to prevent division-by-zero errors when calculating conversion rates.

This analysis helps identify **the stages where the largest proportion of users are lost**.

**SQL concepts:**

* CTEs
* Conditional aggregation
* Conversion-rate calculations
* `NULLIF()`
* Funnel analysis

---

### 5. Funnel Revenue Analysis

Analyzes overall revenue and purchasing activity.

The query calculates:

* Total unique visitors
* Total unique buyers
* Total orders
* Total revenue
* Average Order Value (AOV)
* Revenue per buyer
* Revenue per visitor

These metrics provide a high-level view of the relationship between **traffic, customers, orders, and revenue**.

**SQL concepts:**

* CTEs
* `COUNT(DISTINCT ...)`
* `COUNT()`
* `SUM()`
* Conditional aggregation
* Business KPI calculations

---

## SQL Concepts Practiced

This project provided practical experience with:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `COUNT()`
* `COUNT(DISTINCT ...)`
* `SUM()`
* `AVG()`
* `MIN()`
* `CASE WHEN`
* `NULLIF()`
* Common Table Expressions (CTEs)
* Date filtering
* Date/time calculations
* Conditional aggregation
* Funnel analysis
* Conversion-rate calculations
* Revenue KPIs
* User-level analysis

---

## Project Structure

```text
sales_analysis/
│
├── data/
│   └── events.csv
│
├── queries/
│   ├── user_journey.sql
│   ├── source_funnel.sql
│   ├── funnel_volume.sql
│   ├── funnel_conversion.sql
│   └── funnel_revenue.sql
│
├── results/
│   ├── user_journey_results.csv
│   ├── source_funnel_results.csv
│   ├── funnel_results.csv
│   ├── funnel_conversion_results.csv
│   └── funnel_revenue_results.csv
│
└── README.md
```

## Key Learning Outcomes

The main objective of this project was not simply to practice SQL syntax, but to develop the ability to translate **business questions into analytical SQL queries**.

The project demonstrates the ability to:

* Analyze users rather than only raw events
* Build multi-stage conversion funnels
* Measure conversion between funnel stages
* Compare conversion performance across traffic sources
* Analyze customer journey duration
* Calculate revenue-related KPIs
* Use CTEs to structure analytical queries
* Produce reusable CSV outputs from SQL analysis

## Conclusion

This project demonstrates practical SQL skills applicable to **Data Analyst and BI-oriented roles**, with a focus on e-commerce behavior, funnel analysis, customer journeys, and revenue performance.
