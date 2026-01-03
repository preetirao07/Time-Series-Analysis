TIME SERIES ANALYSIS 

-- Date math
SELECT date('2020-06-30') - date('2020-05-31') as days;

SELECT age(date('2020-06-30'),date('2020-01-01'));

SELECT date_part('month',age('2020-06-30','2020-01-01')) as months;

SELECT date('2020-06-01') + interval '10 days' as new_date;

SELECT date('2020-06-01') + 17 as new_date;

-- Time math

SELECT time '05:00' + interval '3 hours' as new_time;

We can subtract intervals from times:
SELECT time '05:00' - interval '3 hours' as new_time;


-- The Retail Sales Data Set

-- create table to import data
create table retail_sales
(sales_month date,
naics_code varchar,
kind_of_business varchar,
reason_for_null varchar,
sales decimal);

drop table retail_sales
-- populate the table with data from csv file through import/export function

select * from retail_sales

1. TRENDING THE DATA
-- Check the trend of the total retail and food services sales in the US
select sales_month, sales from retail_sales
where kind_of_business = 'Retail and food services sales, total';

-- Yearly trend of total Retail and food services sales
select date_part('year', sales_month) as sales_year, sum(sales) as sales
from retail_sales
where kind_of_business = 'Retail and food services sales, total'
group by 1
order by 1 asc

-- Yearly trend of different kind_of_business
select date_part('year', sales_month) as sales_year , kind_of_business, sum(sales) as sales
from retail_sales
group by 1,2
order by 1 asc;

-- -- Yearly trend of few different kind_of_business in leisure activities: Book stores, Sporting goods stores, Hobby stores
select date_part('year', sales_month) as sales_year , kind_of_business, sum(sales) as sales
from retail_sales
where kind_of_business in ('Book stores', 'Sporting goods stores', 'Hobby, toy, and game stores')
group by 1,2
order by 1 asc;


-- sales at women’s clothing stores and at men’s clothing stores
-- Note: Some string values contain apostrophes
-- In SQL, apostrophes inside strings must be escaped by doubling them (''),
-- so they are treated as part of the value rather than the end of the string

select sales_month, kind_of_business, sales
from retail_sales
where kind_of_business in ('Men''s clothing stores', 'Women''s clothing stores');

