CREATE PROCEDURE pr_GetOrderSummary
	@StartDate datetime,
	@EndDate datetime,
	@EmployeeID int = null,
	@CustomerID nchar(5) = null
AS
	SELECT 
		CONCAT(e.TitleOfCourtesy, ' ', e.FirstName, ' ', e.LastName) as EmployeeFullName,
		s.CompanyName as [Shipper CompanyName],
		c.CompanyName as [Customer CompanyName],
		COUNT(o.OrderId) as NumberOfOrders,
		o.OrderDate,
		SUM(o.Freight) as TotalFreightCost,
		SUM(od.UnitPrice * od.Quantity * od.Discount) as TotalOrderValue
	FROM Orders o
	INNER JOIN [Order Details] od on o.OrderID=od.OrderID
	INNER JOIN Products p on od.ProductID=p.ProductID
	INNER JOIN Employees e on o.EmployeeID=e.EmployeeID
	INNER JOIN Customers c on o.CustomerID=c.CustomerID
	INNER JOIN Shippers s on o.EmployeeID=e.EmployeeID
	WHERE 
		o.OrderDate > @StartDate and 
		o.OrderDate < @EndDate and
		(e.EmployeeID = @EmployeeID or @EmployeeID is null) and
		(c.CustomerID = @CustomerID or @CustomerID is null)
	GROUP BY 
		o.OrderDate,
		e.LastName,
		e.FirstName,
		e.TitleOfCourtesy,
		c.CompanyName,
		s.CompanyName
GO






