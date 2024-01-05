USE [Invoices]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object: Table [dbo].[Address] ******/

ALTER TABLE [dbo].[Address] ADD CONSTRAINT [DF_Address_Postal_Code]  DEFAULT ((4861)) FOR [Postal_Code]
GO

/****** Object: Table [dbo].[Order] ******/

ALTER TABLE [dbo].[Order]  WITH CHECK ADD CONSTRAINT [CK_Order] CHECK (([Date]<=getdate()))
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [CK_Order]
GO

/****** Object: Table [dbo].[Financial_Entity] ******/

ALTER TABLE [dbo].[Financial_Entity]  WITH CHECK ADD  CONSTRAINT [CK_Financial_Entity] CHECK  (([Employee_Amount]>=(1)))
GO

ALTER TABLE [dbo].[Financial_Entity] CHECK CONSTRAINT [CK_Financial_Entity]
GO

/****** Object: Table [dbo].[Business_Client] ******/

ALTER TABLE [dbo].[Business_Client]  WITH CHECK ADD  CONSTRAINT [CK_Business_Client] CHECK  (([Client_Number]>=(10000)))
GO

ALTER TABLE [dbo].[Business_Client] CHECK CONSTRAINT [CK_Business_Client]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Die Kundennummer fängt bei 10000(Zehntausend) an. Das bedeutet, dass der erste Kunde jedes Geschäfts die Nummer Zehntausend hat.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Client', @level2type=N'CONSTRAINT',@level2name=N'CK_Business_Client'
GO

/****** Object: Table [dbo].[Invoice] ******/

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [CK_Invoice] CHECK  (([Client_Number]>=(10000)))
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [CK_Invoice]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Die Kundennummer fängt bei 10000(Zehntausend) an. Das bedeutet, dass der erste Kunde jedes Geschäfts die Nummer Zehntausend hat.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoice', @level2type=N'CONSTRAINT',@level2name=N'CK_Invoice'
GO

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [CK_Invoice_Tax_Amount] CHECK  (([Tax_Amount]>=(0.01)))
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [CK_Invoice_Tax_Amount]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0.01 ist 1%, 0.1 ist 10%, 1 ist 100%.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoice', @level2type=N'CONSTRAINT',@level2name=N'CK_Invoice_Tax_Amount'
GO
