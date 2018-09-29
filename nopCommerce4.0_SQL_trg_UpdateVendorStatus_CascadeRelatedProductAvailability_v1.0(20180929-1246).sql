USE [db_a3b45d_kbsa02_1]
GO

/****** Object:  Trigger [dbo].[tr_VendorStatusUpdate_Related Products]    Script Date: 2018-09-29 12:08:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_VendorStatusUpdate_Related Products]
ON [dbo].[Vendor]
AFTER UPDATE

AS BEGIN
    SET NOCOUNT ON;
    IF UPDATE (Active) 
    BEGIN

	UPDATE [dbo].[Product] 
	SET [Published] = 0
	FROM [dbo].[Product] Products
	INNER JOIN [dbo].[Vendor] Vendors
	ON Vendors.Id = Products.VendorID

	WHERE Vendors.Active = 0

	UPDATE [dbo].[Product] 
	SET [Published] = 1
	FROM [dbo].[Product]	Products
	INNER JOIN [dbo].[Vendor] Vendors
	ON Vendors.Id = Products.VendorID

	WHERE Vendors.Active = 1

	END

END
GO


