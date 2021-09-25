## First part

### Q1 :

SELECT convert(decimal(10,1),sum(case when titleofcourtesy in ('Mr.','Dr.') then 1.0 else 0 end)/count(*)*100) as MaleRatio,
       convert(decimal(10,1),sum(case when titleofcourtesy in ('Ms.','Mrs.') then 1.0 else 0 end)/count(*)*100) as FemaleRatio
       FROM hr.Employees


### Q2 :

select concat(firstname,' ',lastname) as FullName from hr.Employees where datediff(year,hiredate,getdate())>5



### Q3 :

select concat(firstname,' ',lastname) as FullName,datediff(year,birthdate,getdate()) as AGE from hr.Employees where birthdate=(select min(birthdate) from hr.Employees) or birthdate=(select max(birthdate) from hr.Employees)




## Second part


### Q4 :


select isnull(fax,phone) as Fax from sales.Customers

          
### Q5 :

Select  Substring(contactname, 1,Charindex(',', contactname)-1) as Name,
Substring(contactname, Charindex(',', contactname)+1, LEN(contactname)) as  Surname
from sales.Customers



