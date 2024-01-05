USE [Invoices]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reard Gjoni
-- Create date: 04.01.2024
-- Description:	This procedure creates a new invoice based on input and already
--				present 'Order' data.
-- =============================================
CREATE PROCEDURE Create_Invoice
	@Invoice_Number int,
	@Business_Id int,
	@Client_Id int,
	@Client_Number int,
	@Payment_Deadline tinyint,
	@Tax_Id int,
	@Tax_Amount decimal(3,2),
	@Total_Price money,
	@Status_Id int,
	@Payment_Target int
AS
BEGIN
	SET NOCOUNT ON;

	IF (@Invoice_Number IS NULL)
		BEGIN
			RAISERROR('Please enter an Invoice Number.',16,1)
			RETURN;
		END
	IF (@Business_Id <= 0)
		BEGIN
			RAISERROR('Please provide a valid Business ID, 0 is not valid.',16,1)
			RETURN;
		END
	IF (@Client_Id <= 0)
		BEGIN
			RAISERROR('Please provide a valid Client ID, 0 is not valid.',16,1)
			RETURN;
		END
	IF (@Client_Number < 10000)
		BEGIN
			RAISERROR('Please provide a valid Client Number, Client Numbers start at
						10000.',16,1)
			RETURN;
		END
	IF (@Payment_Deadline < 14)
		BEGIN
			RAISERROR('Please provide a valid Payment Deadline. The minimum is 14 days.',16,1)
			RETURN;
		END

    INSERT INTO [dbo].[Invoice]
           ([Invoice_Number]
           ,[Business_Id]
           ,[Client_Id]
           ,[Client_Number]
           ,[Payment_Deadline]
           ,[Tax_Id]
           ,[Tax_Amount]
		   ,[Total_Price]
           ,[Status_Id]
           ,[Payment_Target])
     VALUES (@Invoice_Number,
			@Business_Id,
			@Client_Id,
			@Client_Number,
			@Payment_Deadline,
			@Tax_Id,
			@Tax_Amount,
			@Total_Price,
			@Status_Id,
			@Payment_Target)
END
GO

