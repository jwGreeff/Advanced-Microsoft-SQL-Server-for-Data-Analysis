--Exercise 1
/*Create a user-defined function that returns the percent that one number is of another.

For example, if the first argument is 8 and the second argument is 10, the function should 
return the string "80.00%".

The function should solve the "integer division" problem by allowing you to divide an 
integer by another integer, and yet get an accurate decimal result.

Hints:

Remember that you can implicitly convert an integer to a decimal by multiplying it by 1.0.

You can format a decimal (say, 0.1) as a percent (10%) with the following code: FORMAT(0.1, 'P').

Remember that the the return value of the function should be a text string.*/

CREATE FUNCTION dbo.ufnIntegerPercent(@Numerator INT, @Denominator INT)
RETURNS VARCHAR(8)
AS   
BEGIN

	DECLARE @Decimal FLOAT  = (@Numerator * 1.0) / @Denominator

	RETURN FORMAT(@Decimal, 'P')

END


--Exercise 2
/*Store the maximum amount of vacation time for any individual employee in a variable.

Then create a query that displays all rows and the following columns from the 
AdventureWorks2019.HumanResources.Employee table:

BusinessEntityID

JobTitle

VacationHours

Then add a derived field called "PercentOfMaxVacation", which returns the percent 
an individual employees' vacation hours are of the maximum vacation hours for any employee.

For example, the record for the employee with the most vacation hours should have 
a value of 100.00%, in this column. The derived field should make use of your 
user-defined function from the previous exercise, as well as your variable that 
stored the maximum vacation hours for any employee.*/

DECLARE @MaxVacationHours INT = (SELECT MAX(VacationHours) FROM AdventureWorks2019.HumanResources.Employee)

SELECT
	BusinessEntityID,
	JobTitle,
	VacationHours,
	PercentOfMaxVacation = dbo.ufnIntegerPercent(VacationHours, @MaxVacationHours)

FROM AdventureWorks2019.HumanResources.Employee



