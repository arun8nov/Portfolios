

--KPIs

--Total Revenue 

select sum(total_price) as Total_Revenue from [pizza_sales ]

--Average Order Value

select  sum(total_price) / count(distinct order_id) as Average_Order_Value from [pizza_sales ]

--Total Pizzas Sold

select sum(quantity) as Total_Orders from [pizza_sales ]

--Total Orders

select count(distinct order_id) as Total_Orders from [pizza_sales ]

--Average Pizzas Per Order

select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Average_Pizzas_per_Order
from [pizza_sales ]

--Chart Requirement 

--Daily Trent

select datename(dw, order_date) as order_day, 
count(distinct order_id) as Total_Orders from [pizza_sales ]
group by datename(dw, order_date)

--Hourly Trent

select datepart(HOUR, order_time) as order_hours ,
count(distinct order_id) as Total_Orders from [pizza_sales ]
group by datepart(HOUR, order_time)
order by datepart(HOUR, order_time)

--Percentage of sales by pizza catagary

select pizza_category, sum(total_price) as Total_Sales, 
cast(sum(total_price)*100 / (select sum(total_price) from [pizza_sales ]) as decimal(10,2)) as PCT
from [pizza_sales ]
group by pizza_category

--Percentage of sales by pizza size

select pizza_size, sum(total_price) as Total_Sales, 
cast(sum(total_price)*100 / (select sum(total_price) from [pizza_sales ]) as decimal(10,2)) as PCT
from [pizza_sales ]
group by pizza_size
order by pizza_size

--Total pizza sold by pizza category

select pizza_category, sum(quantity) as Pizza_Count from [pizza_sales ] group by pizza_category

--Top 5 best seller by Total pizza sold

select top 5 pizza_name, sum(quantity) as Pizza_sold from [pizza_sales ]
group by pizza_name order by Pizza_sold desc

--last 5 worst pizza sold 

select top 5 pizza_name, sum(quantity) as Pizza_sold from [pizza_sales ]
group by pizza_name order by Pizza_sold asc
