USE [Invoices]
GO

/****** Object: Foreign Key [FK_Business_Financial_Entity] ******/

ALTER TABLE [dbo].[Business]  WITH CHECK ADD  CONSTRAINT [FK_Business_Financial_Entity] FOREIGN KEY([Financial_Entity_Id])
REFERENCES [dbo].[Financial_Entity] ([Id])
GO

ALTER TABLE [dbo].[Business] CHECK CONSTRAINT [FK_Business_Financial_Entity]
GO

/****** Object: Foreign Key [FK_Business_Client_Financial_Entity] ******/

ALTER TABLE [dbo].[Business_Client]  WITH CHECK ADD  CONSTRAINT [FK_Business_Client_Financial_Entity] FOREIGN KEY([Financial_Entity_Id])
REFERENCES [dbo].[Financial_Entity] ([Id])
GO

ALTER TABLE [dbo].[Business_Client] CHECK CONSTRAINT [FK_Business_Client_Financial_Entity]
GO

ALTER TABLE [dbo].[Business_Client]  WITH CHECK ADD  CONSTRAINT [FK_Business_Client_Business] FOREIGN KEY([Business_Id])
REFERENCES [dbo].[Business] ([Id])
GO

ALTER TABLE [dbo].[Business_Client] CHECK CONSTRAINT [FK_Business_Client_Business]
GO

/****** Object: Foreign Key [FK_Business_Service_Junction_Business] ******/

ALTER TABLE [dbo].[Business_Service_Junction]  WITH CHECK ADD  CONSTRAINT [FK_Business_Service_Junction_Business] FOREIGN KEY([Business_Id])
REFERENCES [dbo].[Business] ([Id])
GO

ALTER TABLE [dbo].[Business_Service_Junction] CHECK CONSTRAINT [FK_Business_Service_Junction_Business]
GO

/****** Object: Foreign Key [FK_Business_Service_Junction_Service] ******/

ALTER TABLE [dbo].[Business_Service_Junction]  WITH CHECK ADD  CONSTRAINT [FK_Business_Service_Junction_Service] FOREIGN KEY([Service_Id])
REFERENCES [dbo].[Service] ([Id])
GO

ALTER TABLE [dbo].[Business_Service_Junction] CHECK CONSTRAINT [FK_Business_Service_Junction_Service]
GO

/****** Object: Foreign Key [FK_Employee_Department] ******/

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO

/****** Object: Foreign Key [FK_Employee_Person] ******/

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Person] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[Person] ([Id])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Person]
GO

/****** Object: Foreign Key [FK_Financial_Entity_Address] ******/

ALTER TABLE [dbo].[Financial_Entity]  WITH CHECK ADD  CONSTRAINT [FK_Financial_Entity_Address] FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Address] ([Id])
GO

ALTER TABLE [dbo].[Financial_Entity] CHECK CONSTRAINT [FK_Financial_Entity_Address]
GO

/****** Object: Foreign Key [FK_Financial_Entity_Financial_Entity_Structure] ******/

ALTER TABLE [dbo].[Financial_Entity]  WITH CHECK ADD  CONSTRAINT [FK_Financial_Entity_Financial_Entity_Structure] FOREIGN KEY([Structure_Id])
REFERENCES [dbo].[Financial_Entity_Structure] ([Id])
GO

ALTER TABLE [dbo].[Financial_Entity] CHECK CONSTRAINT [FK_Financial_Entity_Financial_Entity_Structure]
GO

/****** Object: Foreign Key [FK_Person_Address] ******/

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Address] FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Address] ([Id])
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Address]
GO

/****** Object: Foreign Key [FK_Order_Business_Service_Junction] ******/

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Business_Service_Junction] FOREIGN KEY([Business_Service_Junction_Id])
REFERENCES [dbo].[Business_Service_Junction] ([Id])
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Business_Service_Junction]
GO

/****** Object: Foreign Key [FK_Order_Invoice] ******/

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Invoice] FOREIGN KEY([Invoice_Number])
REFERENCES [dbo].[Invoice] ([Invoice_Number])
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Invoice]
GO

/****** Object: Foreign Key [FK_Invoice_Business] ******/

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Business] FOREIGN KEY([Business_Id])
REFERENCES [dbo].[Business] ([Id])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Business]
GO

/****** Object: Foreign Key [FK_Invoice_Business_Bank_Account] ******/

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Business_Bank_Account] FOREIGN KEY([Payment_Target])
REFERENCES [dbo].[Business_Bank_Account] ([Id])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Business_Bank_Account]
GO

/****** Object: Foreign Key [FK_Invoice_Business_Client] ******/

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Business_Client] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Business_Client] ([Id])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Business_Client]
GO

/****** Object: Foreign Key [FK_Invoice_Invoice_Status] ******/

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Invoice_Status] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Invoice_Status] ([Id])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Invoice_Status]
GO

/****** Object: Foreign Key [FK_Invoice_Tax] ******/

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Tax] FOREIGN KEY([Tax_Id])
REFERENCES [dbo].[Tax] ([Id])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Tax]
GO
