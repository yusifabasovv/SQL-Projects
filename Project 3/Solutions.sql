

Q1 :	

select concat(hr.firstname,' ',hr.lastname) as Employees,concat(s.first_name,' ',s.last_name) as Managers from BikeStores.sales.staffs s, TSQLV4.hr.Employees hr where hr.mgrid=s.manager_id

Q2 :	

CREATE FUNCTION bname(@brandname varchar(255))  
RETURNS TABLE  
AS  
RETURN   
(  
   SELECT p.model_year as Year,b.brand_name,sum(s.quantity) as [Total Quantity],
       sum(o.quantity*o.list_price*(1-o.discount)) as [Total Revenue] from production.brands b,production.products p,sales.order_items o ,production.stocks s
where b.brand_id=p.brand_id and p.product_id=o.product_id and p.product_id=s.product_id and b.brand_name=@brandname group by b.brand_name,p.model_year
);  


select * from bname('Ritchey')

Q2.1	:

CREATE FUNCTION cname(@categoryname varchar(255))  
RETURNS TABLE  
AS  
RETURN   
(  SELECT p.model_year as Year,c.category_name,sum(s.quantity) as [Total Quantity],
       sum(o.quantity*o.list_price*(1-o.discount)) as [Total Revenue] from production.categories c,production.products p,sales.order_items o ,production.stocks s
where c.category_id=p.category_id and p.product_id=o.product_id and p.product_id=s.product_id and c.category_name=@categoryname group by c.category_name,p.model_year 
);  

select * from cname('Children Bicycles')

Q2.2	:

CREATE FUNCTION store(@storename varchar(255),@year smallint)  
RETURNS TABLE  
AS  
RETURN   
( select s.store_name,p.product_name,p.model_year,st.quantity from production.products p,sales.stores s,production.stocks st where
p.product_id=st.product_id and s.store_id=st.store_id and s.store_name=@storename and p.model_year=@year
);  


select * from store('Santa Cruz Bikes',2016)




