delete from  Bölüm
DBCC CHECKIDENT (Bölüm, RESEED, 0)--idleri 1 den baþlatan komut

declare @i int = 1

while @i <= 7 
begin
Insert Into Bölüm (BölümAdý) values('Bölüm' + convert(varchar, @i))
set @i = @i + 1
end



select * from Bölüm

--truncate table Bölüm //relaitondan dolayý izin vermiyor