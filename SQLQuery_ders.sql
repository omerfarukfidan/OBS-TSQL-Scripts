/*
delete from  Ders
DBCC CHECKIDENT (Ders, RESEED, 0)--idleri 1 den baþlatan komut
select * from Ders
*/
--select * from Bölüm
--select * from Akademisyen


declare @i int = 0, @id int, @p int = 1, @t int = 0


while @p <=7
begin
	set @i = 0
	while @i < 3
	begin
		set @i = @i + 1
		set @t = @t + 1
		Insert Into [dbo].Ders ([AkdId],[DersAdi],[DersKredisi],[BölümId]) values(  @p , 'Ders' + convert(varchar, @t), FLOOR(RAND()*(6-2+1)+2), @p )
		
	end
	
	set @p = @p + 1
	
end


select * from Ders