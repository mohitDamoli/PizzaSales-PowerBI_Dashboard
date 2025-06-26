 select * from pizza_sales
                                   --KPI's Calculations --
-- total revenue
 select SUM(total_price) as Total_Revenue from pizza_sales

 -- average order value
select SUM(total_price) / COUNT(distinct order_id) as Avg_Order_Value from pizza_sales

--total pizzas sold
select SUM(quantity) as Total_pizza_Sold from pizza_sales

--total orders
select COUNT(distinct order_id) as Total_Orders from pizza_sales

--AVG pizzas per order
select cast(SUM(quantity) as decimal (10,2))/
       cast(COUNT(distinct order_id) AS decimal(10,2)) as Avg_Pizza_Per_order from pizza_sales


	   -----CHARTS Requirements----

select * from pizza_sales

 ---daily trend for orders
select DATENAME(DW,order_date) as Order_Day ,count(distinct order_id) as Total_orders 
from pizza_sales
group by DATENAME(DW,order_date)

--monthly trend of orders
select DATENAME(MONTH,order_date) as Month_Name ,count(distinct order_id) as Total_orders 
from pizza_sales
group by DATENAME(MONTH,order_date)
order by Total_orders

--% Sales by pizza category

select pizza_category, SUM(total_price) as total_sales,
round(SUM(total_price)*100/(select SUM(total_price) as percent_of_total_sales from pizza_sales),2)
from pizza_sales
group by pizza_category

-- % of salesby pizza size
select pizza_size, cast(SUM(total_price) as decimal(10,2)) as total_sales,
round(SUM(total_price)*100/(select SUM(total_price) from pizza_sales),2) as  percent_of_total_sales
from pizza_sales
group by pizza_size

----Top 5 best  

select top 5 pizza_name , SUM(total_price) as total_Revenue from pizza_sales
group by pizza_name
order by total_Revenue desc

---bottom 5 
select top 5 pizza_name , SUM(total_price) as total_Revenue from pizza_sales
group by pizza_name
order by total_Revenue asc











