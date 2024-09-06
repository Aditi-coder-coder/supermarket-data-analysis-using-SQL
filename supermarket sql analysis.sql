create database eda_supermarket;
use eda_supermarket;
select*from eda_supermarket.supermarket;

-- 1. Display the first 5 row from the dataset
select * from supermarket limit 5;

-- 2. Display the last 5 rows from the dataset
select * from supermarket order by "Invoice ID" desc limit 5;

-- 3. Display random 5 rows from the dataset
select*from supermarket order by rand() limit 5;

-- 4. display count, max, min, avg, and std values for a column in the dataset
select count('gross income'),min('gross income'),max('gross income'),avg('gross income'), std("gross income");

-- 5. Find the number of missing value
select count(*) from supermarket where Branch is null;

-- 6 count the number of occurrences of each city
select city, count(city) from supermarket group by city;

-- 7 find the most frequently used payment method
select payment, count(*) from supermarket group by payment order by count(*) desc ;

-- 8 Does the cost of goods sold affect the ratings that the customer provide (both col are numerical 
select cogs,rating from supermarket;

-- 9 find the most profitable branch as per gross income
select branch, sum(`gross income`) from supermarket group by branch;

-- 10 find the most used payment method city-wise
select city, sum(case when payment="Cash" then 1 else 0 end) as 'Cash',
sum(case when payment="Ewallet" then 1 else 0 end) as 'Ewallet',
sum(case when payment="Credit Card" then 1 else 0 end) as 'Credit Card' from supermarket group by city;

-- 11 find the product line purchased in the highest quantity
select*from supermarket;
select `Product line`, sum(Quantity) from supermarket group by `Product line` order by sum(Quantity) desc ;

-- 12 Display the daily sales by day of the week
update supermarket set date = str_to_date(Date,'%m/%d/%Y');
select dayname(date), dayofweek(date), sum(Total) from supermarket group by dayname(date), dayofweek(date);

-- 13 find the month with the highest sales
select monthname(date) as name, month(date) as month, sum(Total) as total from supermarket group by name, month
order by total desc;

-- 14 Find the time at which sales are highest
select hour(Time) as hour,sum(Total) as total from supermarket group by hour order by total desc;

-- 15 which gender spends more on average
select gender, avg(`gross income`) from supermarket group by gender;
















































