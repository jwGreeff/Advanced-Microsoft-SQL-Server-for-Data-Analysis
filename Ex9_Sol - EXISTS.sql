--Exercise 1:
/*Select all records from the Purchasing.PurchaseOrderHeader table such that there is at least one item in 
the order with an order quantity greater than 500. The individual items tied to an order can be found in the 
Purchasing.PurchaseOrderDetail table.

Select the following columns: PurchaseOrderID, OrderDate, SubTotal, TaxAmt

Sort by purchase order ID.*/

SELECT
       A.PurchaseOrderID
      ,A.OrderDate
      ,A.SubTotal
	  ,A.TaxAmt

FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A

WHERE EXISTS (
	SELECT
	1
	FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
	WHERE A.PurchaseOrderID = B.PurchaseOrderID
		AND B.OrderQty > 500
)

ORDER BY 1


--Exercise 2:
/*Modify your query from Exercise 1 as follows:

Select all records from the Purchasing.PurchaseOrderHeader table such that there is at least one item in 
the order with an order quantity greater than 500, AND a unit price greater than $50.00.

Select ALL columns from the Purchasing.PurchaseOrderHeader table for display in your output.

Even if you have aliased this table to enable the use of a JOIN or EXISTS, you can still use the 
SELECT * shortcut to do this. Assuming you have aliased your table "A", simply use "SELECT A.*" to 
select all columns from that table.*/

SELECT
       A.*

FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A

WHERE EXISTS (
	SELECT
	1
	FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
	WHERE A.PurchaseOrderID = B.PurchaseOrderID
		AND B.OrderQty > 500
		AND B.UnitPrice > 50
)

ORDER BY 1


--Exercise 3:
/*Select all records from the Purchasing.PurchaseOrderHeader table such that NONE of the items within the 
order have a rejected quantity greater than 0.

Select ALL columns from the Purchasing.PurchaseOrderHeader table using the "SELECT *" shortcut.*/

SELECT
       A.*

FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A

WHERE NOT EXISTS (
	SELECT
	1
	FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
	WHERE A.PurchaseOrderID = B.PurchaseOrderID
		AND B.RejectedQty > 0
)

ORDER BY 1