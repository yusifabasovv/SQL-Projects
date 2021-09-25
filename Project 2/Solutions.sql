

##Q1 :

SELECT ROW_NUMBER() OVER(PARTITION BY custid
       ORDER BY freight ) AS Sequences,orderid as Order_ID from sales.Orders

##Q2 :

select quantity as Quantity ,
case
when quantity=(select avg(quantity) from production.stocks) then 'Stock Normal'
when quantity>(select avg(quantity) from production.stocks) then 'Stock Normal'
else 'Stock go out'
end as [Stock Condition]

from production.stocks

##Q3 :	

select p.product_name ,sum(o.list_price-o.discount) as Spending,sum(o.quantity) as [Stock Needed] from sales.order_items o,production.products p
 where o.product_id=p.product_id group by p.product_name order by Spending,[Stock Needed]


