USE [Invoices]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object: View [dbo].[Business_Amount_Of_Invoices_Total_Price_Greater_5000] ******/

CREATE VIEW [dbo].[Business_Amount_Of_Invoices_Total_Price_Greater_5000]
AS
SELECT  COUNT([dbo].[Invoice].[Invoice_Number]) AS 'Amount of Invoices',
		[dbo].[Financial_Entity].[Name] AS 'Business Name'
  FROM [dbo].[Invoice]
  INNER JOIN [dbo].[Business] ON [dbo].[Invoice].[Business_Id] = [dbo].[Business].[Id]
  INNER JOIN [dbo].[Financial_Entity] ON [dbo].[Invoice].[Business_Id] = [dbo].[Financial_Entity].[Id]
  WHERE [dbo].[Invoice].[Total_Price] >= 5000
  GROUP BY [dbo].[Financial_Entity].[Name];
GO
