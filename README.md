# Northwind Stored Procedure
## Northwind Database Setup
Open the **instnwnd.sql** file with SQL Server Management Studio and run the script.

After running the script successfully, refresh *Databases* and you should see a **Northwind** database instance appear.

## Stored Procedure Creation
- Create a new query in context of the Northwind database.
- Paste content from the **pr_GetOrderSummary.sql** file and run.

## Testing
Here is the provided test stored procedure executions for convenience:

`
  exec pr_GetOrderSummary @StartDate='1 Jan 1996', @EndDate='31 Aug 1996', @EmployeeID=NULL , @CustomerID=NULL
`

`
  exec pr_GetOrderSummary @StartDate='1 Jan 1996', @EndDate='31 Aug 1996', @EmployeeID=5 , @CustomerID=NULL
`

`
  exec pr_GetOrderSummary @StartDate='1 Jan 1996', @EndDate='31 Aug 1996', @EmployeeID=NULL , @CustomerID='VINET'
`


`
  exec pr_GetOrderSummary @StartDate='1 Jan 1996', @EndDate='31 Aug 1996', @EmployeeID=5 , @CustomerID='VINET'
`
