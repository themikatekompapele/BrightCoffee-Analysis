--Query 1: to show us name of different stores/locations
SELECT DISTINCT store_location, store_id
FROM coffeeshopanalysis;

--Query 2: to calculate the number of coffee shops
SELECT COUNT(DISTINCT STORE_ID) AS number_of_coffeeshops
FROM coffeeshopanalysis;

-- Query to calculate total revenue by store location.
SELECT store_location,
       round(SUM(unit_price*transaction_qty),2) AS total_revenue
FROM coffeeshopanalysis
GROUP BY store_location;

--Query to determine what time the store opens/when first order is placed.
SELECT min(transaction_time)  AS opening_time
FROM coffeeshopanalysis;

--Query to determine the first day of operations by store location
SELECT min(transaction_date) AS first_day_of_purchase, store_location
FROM coffeeshopanalysis
GROUP BY store_location;

--Query to determine the time at which  the store closes
SELECT max(transaction_time) AS closing_time, store_location
FROM coffeeshopanalysis
GROUP BY store_location;

--Query to calculate revenue per product category at different times of the day.
select product_category,
       SUM(transaction_qty*unit_price) AS revenue,
       store_location,
       transaction_date,
       transaction_time,
CASE
    When transaction_time between '06:00:00' AND '11:59:59' THEN 'Morning'
    When transaction_time between '12:00:00' AND '15:59:59' THEN 'Afternoon'
    When transaction_time between '16:00:00' AND '19:59:59' THEN 'Evening'
    When transaction_time>='20:00:00' THEN 'Night'
END AS time_bucket
FROM coffeeshopanalysis
GROUP BY product_category, store_location, transaction_date, transaction_time
ORDER BY revenue DESC;

--Query to visualise revenue per month, per store, per category.

SELECT transaction_date,
       year(transaction_date) AS Year,
       month(transaction_date) AS Month,
       monthname(transaction_date) AS month_name,
       dayname (transaction_date) AS day_name,
       store_location,
       round(sum(transaction_qty*unit_price),2) AS revenue
FROM coffeeshopanalysis
GROUP BY ALL;













