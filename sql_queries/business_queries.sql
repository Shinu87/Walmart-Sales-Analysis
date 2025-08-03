USE walmart_db;
SELECT * FROM walmart_data;

-- Business Problems
-- 1)Find different Payment method and number of transactions,nmber of qty sold
select payment_method,count(*) as nooftrans , sum(quantity) as totalqtysold from walmart_data group by payment_method; 

-- 2)identify the highest rated category for each branch,displaying the branch,category avg rating
select * 
from 
(
SELECT 
    Branch, 
    category, 
    AVG(rating) AS avgrating, 
    RANK() OVER(PARTITION BY Branch ORDER BY AVG(rating) DESC) AS `rank` 
FROM walmart_data 
GROUP BY category, Branch 
ORDER BY Branch, avgrating DESC
)  AS RANKED where `rank` = 1;


-- 3)identify the busiest day for each branch based on the number of transactions
select * from (select branch , dayname(date) as day_name , count(*) as totaltrans , RANK() OVER(partition by branch order by count(*) desc) as `rank` from walmart_data group by branch,day_name order by branch asc) as ranked where `rank` = 1;

-- 4)Calculate the total quantity of items sold per payment method,list payment method and total quantity
select payment_method , count(*) as totalquantity,sum(quantity) as totalquantity1 from walmart_data group by payment_method;

-- 5)determine the average,minimum and maximum rating of category for each city list the city , average_rating,min_rating and max_ratning
select city,category,min(rating) as minrating,max(rating) as maxrating,avg(rating) as avgrating from walmart_data group by city,category order by city asc;

-- 6)calculate the total profit for each category by considering totalprofit as unitprice * quantity*profit_margin,list category and total_profit,oorder from hhighest to lowest profit
select category,SUM(unit_price *  quantity * profit_margin) as profit from walmart_data group by category order by profit desc;

-- 7)determine the most common payment method for each branch display branch and the preferred payment method
select * from (select branch,payment_method,count(*) as count,RANK() over(partition by branch order by count(*) desc) as `rank` from walmart_data group by branch,payment_method order by branch asc) as ranked where `rank` = 1;

-- 8)categories sales into 3 group morning,afternoon,evening find out each of the shift and number of invoices
SELECT 
    branch,
    CASE
        WHEN HOUR(TIME(time)) < 12 THEN 'Morning'
        WHEN HOUR(TIME(time)) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS day_time,
    COUNT(*) AS total_transactions
FROM 
    walmart_data
GROUP BY 
    branch, day_time
ORDER BY 
    branch, day_time;

-- 9)Identify 5 branch with highest descrease ratio in revenue compare to last year(current year 2023 and last year 2022)

WITH revenue2022 AS (
    SELECT 
        branch, 
        SUM(total) AS revenue2022 
    FROM 
        walmart_data 
    WHERE 
        YEAR(date) = 2022 
    GROUP BY 
        branch
),
revenue2023 AS (
    SELECT 
        branch, 
        SUM(total) AS revenue2023 
    FROM 
        walmart_data 
    WHERE 
        YEAR(date) = 2023 
    GROUP BY 
        branch
)

SELECT 
    ls.branch, 
    ls.revenue2022, 
    cs.revenue2023,
    (CAST(ls.revenue2022 - cs.revenue2023 AS DECIMAL(10,2)) / CAST(ls.revenue2022 AS DECIMAL(10,2))) * 100 AS drop_percentage
FROM 
    revenue2022 AS ls
JOIN 
    revenue2023 AS cs 
ON 
    ls.branch = cs.branch
WHERE 
    ls.revenue2022 > cs.revenue2023 order by drop_percentage desc ;



