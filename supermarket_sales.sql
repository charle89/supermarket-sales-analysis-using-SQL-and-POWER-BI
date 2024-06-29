use supermarket_sales;

select * from supermarket_sales;

--- convert string to date 
select str_to_date(date, "%m/ %d/ %Y") as IDate
from supermarket_sales;

update supermarket_sales
set date = str_to_date(date, "%m/ %d/ %Y");


describe supermarket_sales;
 
 -- Q1 total sales 
 create view total_sales as
 select sum(total) as `total sales`
 from supermarket_sales;
 
 -- Q2 average sales per transaction
 create view `average sales` as
select avg(total) as `average sales` 
from supermarket_sales;

-- Q3 total quantity sold
create view `total quantity sold` as
select sum(quantity) as `total quantity sold`
from supermarket_sales;

-- Q4 averagre rating
create view `average rating` as
select avg(rating) as `average rating`
from supermarket_sales;
-- Q5 total sales by branch monthly

create view `total sale by branch monthly` as
SELECT branch, DATE_FORMAT(date, '%Y-%m') AS sale_month,
    SUM(total) AS total_sales
FROM supermarket_sales
WHERE date >= '2019-01-01' AND date < '2019-04-01' 
GROUP BY branch, sale_month
ORDER BY branch, sale_month ;


select* from supermarket_sales;
-- Q6 sales by city in a particular january

SELECT city,SUM(total) AS total_sales
FROM supermarket_sales
WHERE DATE_FORMAT(date, '%Y-%m') = '2019-02'
GROUP BY city
ORDER BY total_sales DESc;
-- Q7 sales by city for each montht
create view `sales by city in every month` as
SELECT city,
    DATE_FORMAT (date, '%Y-%m') AS sale_month,
    SUM(total) AS total_sales
FROM supermarket_sales
WHERE date >= '2019-01-01' AND date < '2019-04-01' 
GROUP BY city, sale_month
ORDER BY city, sale_month;
  
  -- Q8 sales by product lines and payment methods
 
 
SELECT `product line` payment,
    SUM(total) AS total_sales
FROM supermarket_sales
GROUP BY `product line`, payment
ORDER BY `product line`, payment;

-- Q9 gross income by customer type
create view `gross income by customer type` as
SELECT `Customer type`, SUM(`gross margin percentage`) AS total_gross_incom
FROM supermarket_sales
GROUP BY `customer type`
ORDER BY `customer type`;

