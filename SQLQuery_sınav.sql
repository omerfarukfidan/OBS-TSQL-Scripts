/*
delete from  Sýnav
DBCC CHECKIDENT (Sýnav, RESEED, 0)--idleri 1 den baþlatan komut
select * from Sýnav
*/
--select * from Ders


declare @i int = 0, @p int = 1, @t int = 0


while @p <=7
begin
	set @i = 0
	while @i < 1
	begin
		set @i = @i + 1
		set @t = @t + 1
		Insert Into [dbo].[Sýnav] ([DersId],[SýnavTipi],[SoruSayýsý]) values( @p, 'final', FLOOR(RAND()*(5-3+1)+3)*10  )
	end
	
	set @p = @p + 1	
	
end

select * from Sýnav