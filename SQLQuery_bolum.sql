delete from  B�l�m
DBCC CHECKIDENT (B�l�m, RESEED, 0)--idleri 1 den ba�latan komut

declare @i int = 1

while @i <= 7 
begin
Insert Into B�l�m (B�l�mAd�) values('B�l�m' + convert(varchar, @i))
set @i = @i + 1
end



select * from B�l�m

--truncate table B�l�m //relaitondan dolay� izin vermiyor