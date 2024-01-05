USE [Invoices]
GO

EXECUTE [dbo].[Create_Invoice]
	@Invoice_Number = '202301054',
	@Business_Id = 3,
	@Client_Id = 14,
	@Client_Number = 10007,
	@Payment_Deadline = 2,
	@Tax_Id = 2,
	@Tax_Amount = 0.16,
	@Total_Price = 6000.00,
	@Status_Id = 2,
	@Payment_Target = 61
