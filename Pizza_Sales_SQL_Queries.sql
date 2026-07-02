Pizza Sales Analysis
SQL Queries for KPI Calculation & Analysis


select * from pizza_sales;

--TOTAL REVENUE
select sum(total_price) AS TOTAL_REVENUE from pizza_sales

--TOTAL ORDERS
select COUNT(Distinct order_id) AS TOTAL_ORDERS from pizza_sales

--TOTAL PIZZAS SOLD
select sum(quantity) AS TOTAL_PIZZAS_SOLD from pizza_sales

--AVERAGE ORDER VALUE
select sum(total_price)/count(Distinct order_id) AS AVERAGE_ORDER_VALUE from pizza_sales

--AVERAGE PIZZAS PER ORDER
select CAST(sum(quantity) AS FLOAT)/count(Distinct order_id) AS AVERAGE_PIZZAS_PER_ORDER from pizza_sales


--DAILY TRENDS
select
DATENAME(WEEKDAY,order_date) AS DAY_NAME,
count(Distinct order_id) AS TOTAL_ORDERS
from pizza_sales
GROUP BY DATENAME(WEEKDAY,order_date)
ORDER BY TOTAL_ORDERS DESC;

--MONTHLY TRENDS
select
DATENAME(MONTH,order_date) AS MONTH_NAME,
count(Distinct order_id) AS TOTAL_ORDERS
from pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY TOTAL_ORDERS DESC;

--PERCENTAGE OF PIZZA SALES BY CATEGORY
select
pizza_category,
sum(total_price) AS TOTAL_SALES,
sum(total_price)*100.0/
(select sum(total_price) from pizza_sales) AS REVENUE_PERCENTAGE
from pizza_sales
GROUP BY pizza_category
ORDER BY REVENUE_PERCENTAGE DESC;

--PERCENTAGE OF PIZZA SALES BY SIZE
select
pizza_size,
sum(total_price) AS TOTAL_SALES,
sum(total_price)*100.0/
(select sum(total_price) from pizza_sales) AS REVENUE_PERCENTAGE
from pizza_sales
GROUP BY pizza_size
ORDER BY REVENUE_PERCENTAGE DESC;

--TOTAL PIZZA SOLD BY PIZZA CATEGORY
select pizza_category,
sum(quantity) AS TOTAL_PIZZAS_SOLD
from pizza_sales
GROUP BY pizza_category
ORDER BY TOTAL_PIZZAS_SOLD DESC;


--TOP 5 BEST SELLERS BY REVENUE
select Top 5 pizza_name,
sum(total_price) AS REVENUE
from pizza_sales
GROUP BY pizza_name
ORDER BY REVENUE DESC;

--TOP 5 BEST SELLERS BY QUANTITY
select Top 5 pizza_name,
sum(quantity) AS QUANTITY_SOLD
from pizza_sales
GROUP BY pizza_name
ORDER BY QUANTITY_SOLD DESC;

--TOP 5 BEST SELLERS BY ORDERS
select top 5 pizza_name,
COUNT(DISTINCT order_id) AS TOTAL_ORDERS
from pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_ORDERS DESC;


--BOTTOM 5 BEST SELLERS BY REVENUE
select top 5
pizza_name,
sum(total_price) AS REVENUE
from pizza_sales
GROUP BY pizza_name
ORDER BY REVENUE ASC;

--BOTTOM 5 BEST SELLERS BY QUANTITY
select Top 5 pizza_name,
sum(quantity) AS QUANTITY_SOLD
from pizza_sales
GROUP BY pizza_name
ORDER BY QUANTITY_SOLD ASC;

--BOTTOM 5 BEST SELLERS BY ORDERS
select top 5 pizza_name,
COUNT(DISTINCT order_id) AS TOTAL_ORDERS
from pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_ORDERS ASC;

