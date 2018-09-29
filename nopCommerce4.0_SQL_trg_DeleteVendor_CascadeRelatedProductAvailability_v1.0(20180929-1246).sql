CREATE TRIGGER [dbo].[tr_VendorDeleted_RemoveRelated Products]
ON [dbo].[Vendor]
AFTER UPDATE

AS BEGIN
    SET NOCOUNT ON;
    IF UPDATE (Deleted) 
    BEGIN

	UPDATE [dbo].[Product] 
	SET [Deleted] = 1,
	[Published] = 0
	FROM [dbo].[Product] Products
	INNER JOIN [dbo].[Vendor] Vendors
	ON Vendors.Id = Products.VendorID

	WHERE Vendors.Deleted = 1

	

	END

END