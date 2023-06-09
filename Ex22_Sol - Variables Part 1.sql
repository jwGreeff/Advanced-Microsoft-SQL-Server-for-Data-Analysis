/*Refactor the provided code (see the "Variables Part 1 - Exercise Starter Code.sql" in the Resources for this section) 
to utilize variables instead of embedded scalar subqueries.*/
--Scalar subquery code:

SELECT
	   BusinessEntityID
      ,JobTitle
      ,VacationHours
	  ,MaxVacationHours = (SELECT MAX(VacationHours) FROM AdventureWorks2019.HumanResources.Employee)
	  ,PercentOfMaxVacationHours = (VacationHours * 1.0) / (SELECT MAX(VacationHours) FROM AdventureWorks2019.HumanResources.Employee)

FROM AdventureWorks2019.HumanResources.Employee

WHERE (VacationHours * 1.0) / (SELECT MAX(VacationHours) FROM AdventureWorks2019.HumanResources.Employee) >= 0.8



--Refactored Solution

DECLARE @MaxVacation FLOAT = (SELECT MAX(VacationHours) FROM AdventureWorks2019.HumanResources.Employee)

SELECT
	   [BusinessEntityID]
      ,[JobTitle]
      ,[VacationHours]
	  ,MaxVacationHours = @MaxVacation
	  ,PercentOfMaxVacationHours = VacationHours / @MaxVacation

FROM AdventureWorks2019.HumanResources.Employee

WHERE VacationHours / @MaxVacation >= 0.8

