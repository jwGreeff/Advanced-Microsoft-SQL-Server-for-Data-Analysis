--Exercise 1
/*Update your calendar lookup table with a few holidays of your choice that always 
fall on the same day of the year - for example, New Year's.*/

UPDATE AdventureWorks2019.dbo.Calendar
SET
HolidayFlag =
	CASE
		WHEN DayOfMonthNumber = 1 AND MonthNumber = 1 THEN 1
		WHEN DayOfMonthNumber = 4 AND MonthNumber = 7 THEN 1
		WHEN DayOfMonthNumber = 11 AND MonthNumber = 11 THEN 1
		WHEN DayOfMonthNumber = 25 AND MonthNumber = 12 THEN 1
		ELSE 0
	END



--Exercise 2
/*Using your updated calendar table, pull all purchasing orders that were made on a holiday. 
It's fine to simply select all columns via SELECT *.*/

SELECT
A.*

FROM AdventureWorks2019.Sales.PurchasingOrderHeader A
	JOIN AdventureWorks2019.dbo.Calendar B
		ON A.OrderDate = B.DateValue

WHERE B.HolidayFlag = 1



--Exercise 3
/*Again using your updated calendar table, now pull all purchasing orders that were made on a 
holiday that also fell on a weekend.*/
SELECT
A.*

FROM AdventureWorks2019.Sales.PurchasingOrderHeader A
	JOIN AdventureWorks2019.dbo.Calendar B
		ON A.OrderDate = B.DateValue

WHERE B.HolidayFlag = 1
	AND B.WeekendFlag = 1





