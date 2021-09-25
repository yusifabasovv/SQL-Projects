

Q1 :

SELECT ROW_NUMBER() OVER(PARTITION BY custid
       ORDER BY freight ) AS Sequences,orderid as Order_ID from sales.Orders

Q2 :

select quantity as Quantity ,
case
when quantity=(select avg(quantity) from production.stocks) then 'Stock Normal'
when quantity>(select avg(quantity) from production.stocks) then 'Stock Normal'
else 'Stock go out'
end as [Stock Condition]

from production.stocks

Q3 :	

SELECT soi.order_id, sc.first_name + ' ' + sc.last_name AS FullName, pp.product_name,
pp.list_price * soi.quantity * (1-soi.discount) AS TotalPrc
FROM [sales].[order_items] soi
INNER JOIN [sales].[orders] so on soi.order_id=so.order_id
INNER JOIN [sales].[customers] sc on sc.customer_id=so.customer_id  
INNER JOIN [production].[products] pp on  pp.product_id=soi.product_id

