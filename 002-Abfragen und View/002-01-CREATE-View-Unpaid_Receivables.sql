USE [Invoices]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object: View [dbo].[Unpaid_Receivables] ******/

CREATE VIEW [dbo].[Unpaid_Receivables]
AS
SELECT Business_Id, Has_Unpaid_Receivables
  FROM [dbo].[Business_Client]
  WHERE (Has_Unpaid_Receivables = 1);
GO
