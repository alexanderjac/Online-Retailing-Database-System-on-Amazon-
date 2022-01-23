Create or alter Function fun_totalPrice(@ProdId int)Returns Decimal(10,2)
As BEGIN
Declare @amount Decimal(10,2)
select @amount = (p.MapPrice * por.productQuantity)from Product p join ProductOrderRecord por
on p.ProductID = por.productID where p.productID = @ProdId
Return @amount
End

Alter Table Product add TotalPrice as (dbo.fun_totalPrice(ProductID))