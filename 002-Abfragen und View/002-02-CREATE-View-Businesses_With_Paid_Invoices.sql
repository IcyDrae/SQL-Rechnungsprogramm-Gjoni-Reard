USE [Invoices]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object: View [dbo].[Businesses_With_Paid_Invoices] ******/

CREATE VIEW [dbo].[Businesses_With_Paid_Invoices]
AS
SELECT  [dbo].[Invoice].[Business_Id] AS 'Business ID',
		[dbo].[Financial_Entity].[Name] AS 'Business Name',
		[dbo].[Invoice].[Invoice_Number] AS 'Invoice Number',
		[dbo].[Invoice].[Total_Price],
		'Paid' AS 'Status'
  FROM [dbo].[Invoice]
  INNER JOIN [dbo].[Business] ON [dbo].[Invoice].[Business_Id] = [dbo].[Business].[Id]
  INNER JOIN [dbo].[Financial_Entity] ON [dbo].[Financial_Entity].[Id] = [dbo].[Business].[Id]
  INNER JOIN [dbo].[Invoice_Status] ON [dbo].[Invoice].[Status_Id] = [dbo].[Invoice_Status].[Id]
	AND ([dbo].[Invoice_Status].[Label] = 'Paid');
GO
