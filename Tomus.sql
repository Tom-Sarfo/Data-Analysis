/*
This is a simple descriptive analysis for Tomus Sales data report from October 2021 to October 2022
Data is readily available on request
*/
-- 0. Selecting all records 
select * from TomusSales;

-- A onetime query for handling wrong input 
update TomusSales
 set Customer = replace(Customer, 'Abena vi', 'Abenavi');

-- 1. selecting the columns of interest--  
select ClientStatus, Customer, Design, Size, Colour, OrderReference,
 OrderDate from TomusSales order by OrderNumber;
 
 -- 2. Ranking orders according to marketing channel
 select distinct OrderReference, count(OrderReference) as Frequency 
 from TomusSales group by OrderReference order by Frequency desc;
 
 -- 3. Ranking orders by design to determine the mode of frequency--  
 select distinct Design, count(Design) as frequency from TomusSales 
 group by Design order by frequency desc;
 
 -- 4. count the number of orders from old and new customers--  
 select ClientStatus, if(ClientStatus="New Customer", count(ClientStatus), 
 count(ClientStatus)) as frequency FROM TomusSales group by ClientStatus;

-- 5. Ranking according to customer with highest to lowest orders
Select distinct Customer, count(Customer) as NumberOfOrders from TomusSales
group by Customer order by NumberOfOrders desc;

-- 6. Ranking according to sizes
 select distinct Size, count(Size) as Frequency from TomusSales 
 group by Size order by Frequency desc;
 
 -- 7. Ranking according colour 
 select distinct Colour, count(Colour) as Frequency from TomusSales 
 group by Colour order by Frequency desc;

-- 8. Tonto-Open and its most ordered size
select Design, Size, count(Size) as Frequency from TomusSales where Design ="Tonto-Open" group by Size order by Frequency desc;

-- 9. Design and its most ordered size 
-- (NB: input the name of design in the Design string to determine its size frequency -default Nsaa)
select Design, Size, count(Size) as Frequency from 
TomusSales where Design ="Nsaa" group by Size order by Frequency desc;


 
 
 