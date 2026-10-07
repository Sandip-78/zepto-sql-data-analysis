drop table if exists zepto;

create table zepto (
	sku_id SERIAL PRIMARY KEY,
	category VARCHAR(120),
	name VARCHAR(150) NOT NULL,
	mrp NUMERIC(8,2),
	discountPercent NUMERIC(5,2),
	availableQuantity INTEGER,
	discountSellingPrice NUMERIC(8,2),
	weightInGms INTEGER,
	outOfStock BOOLEAN,
	quantity INTEGER
);

-- data exploration

-- count rows
select count(*) from zepto;

-- sample data look
select * from zepto limit 10;

--null value checking
select * from zepto where name is null or
category is null or
mrp is null or
discountPercent is null or
availableQuantity is null or
weightInGms is null or
outOfStock is null or
quantity is null;

--different categroy products
select DISTINCT category from zepto order by category;

--check how many products in stock and outOfStock
select outOfStock, count(sku_id) from zepto group by outOfStock;

--products that appear multiple times
select name, count(sku_id) from zepto 
group by name having count(sku_id) > 1 order by count(sku_id) DESC;

-- data cleaning

-- product with price = 0 
select * from zepto where mrp = 0 OR discountSellingPrice = 0

delete from zepto where mrp = 0

-- convert paise into rupee
update zepto set mrp = mrp/100.0, discountSellingPrice = discountSellingPrice/100.0

select mrp, discountSellingPrice from zepto;


-- Find the top 10 best-value products based on the discount percentage.
select DISTINCT name, mrp, discountPercent from zepto 
order by discountPercent DESC limit 10;


-- What are the Products with High MRP but Out of Stock
select DISTINCT name, mrp from zepto where outOfStock = 'true' order by mrp DESC;


-- Calculate Estimated Revenue for each category
select category, sum(discountSellingPrice * availableQuantity) as total_revenue from zepto 
group by category order by total_revenue DESC


-- Find all products where MRP is greater than ₹500 and discount is less than 10%.
select DISTINCT name, mrp, discountPercent from zepto 
where mrp > 500 and discountPercent< 10
order by mrp DESC, discountPercent DESC


-- Identify the top 5 categories offering the highest average discount percentage.
select category, round(avg(discountPercent),2) as avg_discount from zepto 
group by category order by avg_discount DESC limit 5


-- Find the price per gram for products above 100g and sort by best value.
select DISTINCT name, weightInGms, discountSellingPrice, 
round(discountSellingPrice/weightInGms,2) as price_per_gram from zepto
where weightInGms >= 100 order by price_per_gram


-- Group the products into categories like Low, Medium, Bulk.
select DISTINCT name, weightInGms,
case when weightInGms < 1000 then 'Low'
     when weightInGms < 5000 then 'Medium'
	 else 'Bulk'
	 end as weight_category
from zepto

-- What is the Total Inventory Weight Per Category
select category, sum(weightInGms * availableQuantity) as total_weight
from zepto group by category order by total_weight

I