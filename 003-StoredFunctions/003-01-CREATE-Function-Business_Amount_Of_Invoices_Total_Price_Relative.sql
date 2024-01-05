SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reard Gjoni
-- Create date: 05.01.2024
-- Description:	Returns all Businesses that have Invoices with a specific amount of total price.
-- =============================================
CREATE FUNCTION Business_Amount_Of_Invoices_Total_Price_Relative
(
	@Total_Price_Amount money
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT COUNT([dbo].[Invoice].[Invoice_Number]) AS 'Amount of Invoices',
		[dbo].[Financial_Entity].[Name] AS 'Business Name'
		FROM [dbo].[Invoice]
		INNER JOIN [dbo].[Business] ON [dbo].[Invoice].[Business_Id] = [dbo].[Business].[Id]
		INNER JOIN [dbo].[Financial_Entity] ON [dbo].[Invoice].[Business_Id] = [dbo].[Financial_Entity].[Id]
		WHERE [dbo].[Invoice].[Total_Price] >= @Total_Price_Amount
		GROUP BY [dbo].[Financial_Entity].[Name]
)
GO

