# CoffeeShop-Analysis
The Coffee Shop Analysis Project provides a comprehensive and detailed analysis of coffee shops set in three distinct locations, over the period of six months, from January to June 2023.
# Elohim Coffee Shop — Sales Analysis & Recommendations ☕📊

[![Project Status](https://img.shields.io/badge/status-completed-brightgreen?style=for-the-badge)](https://github.com/)
[![Tools](https://img.shields.io/badge/Tools-SQL%20|%20PowerBI%20|%20Tableau%20|%20Excel-blue?style=for-the-badge)](https://github.com/)
[![Author](https://img.shields.io/badge/author-themikatekompapele-purple?style=for-the-badge)](https://github.com/themikatekompapele)

---

## Project summary (one-liner)
Analyze Elohim Coffee Shop sales to identify top revenue drivers, peak times, customer purchasing behavior, and provide clear recommendations to increase revenue and optimize operations.

## Executive summary
- Time range analyzed: 6-month period (growth observed from Jan → Jun).
- Revenue doubled from January ($83.48K) to June ($169.52K).
- Overall store pattern: all locations show similar growth and balanced revenue distribution.
- Location highlights: Hell’s Kitchen accounts for ~34.02% of total analyzed revenue (total period revenue: ~$712K); Astoria rose from ~$26K to ~$56K in June.
- Peak hours: Sales spike from ~7 AM, with the largest surge between 8 AM–10 AM.
- Purchase behavior: Most transactions contain 1–2 items; basket sizes of 3–4 items are rare.
- Product mix: Coffee & Tea generate ~70% of revenue. Premium/packaged items (loose tea, flavored items, packaged chocolate) underperform.

---

## Intended audience
- Store managers and regional operations
- Marketing / promotions team
- Inventory & procurement
- Data & BI teams (for reproducibility)
- Portfolio / case study reviewers

---

## Key findings (detailed)
1. Growth & trend
   - Consistent month-over-month growth through the 6-month window.
   - Revenue doubled from Jan ($83.48K) to Jun ($169.52K). The increase is visible across all stores.

2. Location performance
   - Balanced revenue distribution across locations — no single store dominates.
   - Hell’s Kitchen: ~34.02% of the period revenue (~$712K total across analyzed period).
   - Astoria: notable jump from ~$26K to ~$56K in June — likely seasonal demand or targeted promotions.

3. Time-of-day pattern
   - Peak period: ~7 AM–10 AM; most pronounced between 8 AM–10 AM.
   - After 10 AM, sales decline and remain relatively steady.

4. Transaction & basket analysis
   - Majority of transactions are single-item or 2-item purchases.
   - Low frequency of larger baskets (3–4 items).

5. Product performance
   - Coffee & Tea = ~70% of total revenue.
   - Premium / packaged items underperform — possibly price sensitivity or low visibility.

---

## Top actionable recommendations
1. Morning-focused promotions & staffing
   - Schedule peak staffing 7 AM–10 AM to reduce wait times and increase throughput.
   - Launch breakfast combos (coffee + pastry) priced competitively for 7–10 AM.

2. Loyalty & retention
   - Implement a simple loyalty program (stamps or points) to increase repeat visits and average ticket size.
   - Offer bonus points for combo purchases to encourage bundling.

3. Upsell & bundling
   - Train POS prompts to suggest bundling (e.g., "Add a pastry for $X").
   - Introduce limited-time bundle discounts to test lift on premium items.

4. Reposition or trial premium items
   - Test smaller, trial-size offerings or sampling of loose teas and flavors.
   - Consider temporary discounts on premium inventory to increase trial and collect feedback.

5. Targeted promotions by store
   - Run A/B promotions in Astoria to learn what drove the June spike; replicate in other locations as appropriate.
   - Deploy geo-targeted offers for off-peak hours to smooth demand.

6. Inventory & procurement optimization
   - Use morning demand forecasts to adjust inventory (reduce waste, ensure availability of high-sellers).
   - De-prioritize slow-moving SKUs or test repositioning/price changes.

7. Measure & iterate
   - Track KPIs: daily revenue, avg. basket size, items per transaction, conversion rate for upsells, redemption rate for loyalty.
   - Run controlled experiments for offers and measure incremental revenue.

---

## Data (recommended files)
- data/Bright Coffee Shop Analysis - Transactions (1).csv — (transaction_id, store, datetime, product_id, product_name, qty, price, total)

---

## Methods & tools used / recommended
- Data wrangling and analysis: SQL
- BI & visualization: PowerBI, Google Looker Studio
- Spreadsheets: Excel (pivot analysis & quick-checks)

---

## Sample SQL queries (quick starters)

Top 10 products by revenue:
```sql
SELECT product_name, SUM(qty * price) AS revenue
FROM sales_transactions
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;
```

Revenue by store and month:
```sql
SELECT store, DATE_TRUNC('month', datetime) AS month, SUM(qty * price) AS revenue
FROM sales_transactions
GROUP BY store, month
ORDER BY month, revenue DESC;
```

Peak hours (hour-of-day revenue):
```sql
SELECT EXTRACT(hour FROM datetime) AS hour, SUM(qty * price) AS revenue, COUNT(DISTINCT transaction_id) AS transactions
FROM sales_transactions
GROUP BY hour
ORDER BY revenue DESC;
```

Basket size distribution (items per transaction):
```sql
SELECT t.transaction_id, SUM(qty) AS items
FROM sales_transactions t
GROUP BY t.transaction_id;
-- then aggregate counts per items to see distribution
```

Revenue share by category (Coffee & Tea vs others):
```sql
SELECT category, SUM(qty * price) AS revenue, SUM(qty * price) / (SELECT SUM(qty * price) FROM sales_transactions) AS share
FROM sales_transactions s
JOIN products p ON s.product_id = p.product_id
GROUP BY category
ORDER BY revenue DESC;
```

---

## Visuals & deliverables to include
- Time-series: daily revenue + moving average (6- or 7-day)
- Heatmap: revenue by hour (rows) vs day-of-week (cols)
- Bar charts: top products by revenue and avg. price per item
- Stacked bar: revenue share per category per store
- Dashboard screenshots: place under `reports/figures/` and link from README
- Interactive PowerBI / Tableau workbook files in `dashboards/`

(Include dashboard screenshots in reports/figures/ and reference them here.)

---

## License
This repository and analysis content: MIT License (default). Update if you prefer another license.

---

Thank you — this README is ready to be added to your repo. If you'd like, tell me:
- Where to place it (repo name), and I can create the file for you;
- Or upload the data + 2–3 dashboard screenshots and I will embed the charts and update the figures and visuals in the README.
