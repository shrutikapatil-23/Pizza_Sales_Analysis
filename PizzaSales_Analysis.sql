USE pizza_sales;

select * from order_details;
select * from orders;
select * from pizza_types;
select * from Pizzas;

# Total no. of orders throughout the year
select count(*) 
from   orders;

# Total no. of pizzas ordered
select sum(Quantity) 
from   order_details;

# Average no. of orders per day
select count(*)/365 as avg_orders_Per_day
from   orders;

# Total Sales
select      sum(p.Price*o.Quantity) as Total_Sales
from        pizzas as p 
RIGHT join  order_details as o
on          p.Pizza_ID = o.Pizza_ID;


# Orders per hour
select     hour(Order_Time) as Hour_of_Day, 
           count(*) as No_of_Orders 
from       orders
group by   Hour_of_Day
Order by   Hour_of_Day;

# Pizzas per hour
select     hour(o.Order_Time) as Hour_of_Day, 
		   sum(d.Quantity) as No_of_Pizzas
from 	   orders as o 
join 	   order_details as d
on 		   o.Order_ID =d.Order_ID
group by   Hour_of_Day
Order by   Hour_of_Day;

# Order per month
select     month(Order_Date) as Month_of_Year, 
		   count(*) as No_of_Orders 
from 	   orders
group by   Month_of_Year
Order by   Month_of_Year;

# Pizzas per month
select     month(o.Order_Date) as month_of_year, 
           sum(d.Quantity) as No_of_Pizzas
from 	   orders as o 
join 	   order_details as d
on 		   o.Order_ID =d.Order_ID
group by   month_of_year
Order by   month_of_year;

# total categories in which pizzas are available
select   distinct(Category) as no_of_Categories 
from     pizza_types;

# Most Ordered category


# Pizzas available
select   count(distinct(Pizza_Type_ID)) as no_of_Pizzas 
from     pizza_types;

# In which sizes pizzaa are available?
select   distinct(Size) 
from     pizzas;

# which size of Pizzas are most orderd?
select 		p.size, 
			sum(o.Quantity) 
from        pizzas as p 
right join  order_details as o 
on 		    p.Pizza_ID = o.Pizza_ID
group by    p.size;

# When the XL and XXL pizzas ordered (hour)

#top 10 pizzas ordered by customers
CREATE VIEW pizza as 
SELECT		p.Pizza_ID, 
			p.Pizza_Type_ID,
			p.Size, 
			p.Price,
		    t.Pizza_Name,
            t.Category
FROM        pizzas as p
LEFT JOIN   pizza_types as t   
ON          p.Pizza_Type_ID = t.Pizza_Type_ID;


SELECT     p.Pizza_Name, 
		   sum(o.Quantity) AS no_of_orders
FROM  	   pizza AS p
JOIN       order_details AS o
ON   	   p.Pizza_ID = o.Pizza_ID
GROUP BY   p.Pizza_Name
ORDER BY   no_of_orders DESC
LIMIT      10;

# Bottom 10
SELECT     p.Pizza_Name, 
		   sum(o.Quantity) AS no_of_orders
FROM  	   pizza AS p
JOIN       order_details AS o
ON   	   p.Pizza_ID = o.Pizza_ID
GROUP BY   p.Pizza_Name
ORDER BY   no_of_orders asc
LIMIT      10;

# top 10 Pizzas by Sales
SELECT p.Pizza_Name,
		sum(o.Quantity*p.Price) AS Sales_per_Pizza
FROM 	pizza AS p
JOIN 	order_details AS o 
GROUP BY  P.Pizza_Name
ORDER BY  Sales_per_Pizza DESC
LIMIT     10;
        
 # Bottom 10      
 SELECT p.Pizza_Name,
		sum(o.Quantity*p.Price) AS Sales_per_Pizza
FROM 	pizza AS p
JOIN 	order_details AS o 
GROUP BY  P.Pizza_Name
ORDER BY  Sales_per_Pizza ASC
LIMIT     10;

