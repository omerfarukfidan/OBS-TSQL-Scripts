/*
delete from  Akademisyen
DBCC CHECKIDENT (Akademisyen, RESEED, 0)--idleri 1 den baþlatan komut
select * from Akademisyen
*/
--select * from Bölüm


declare @i int = 0, @p int = 1, @t int = 0


while @p <=7
begin
	set @i = 0
	while @i < 10
	begin
		set @i = @i + 1
		set @t = @t + 1
		Insert Into [dbo].[Akademisyen] ([AkdAdý],[BölümId],[AkdMail],[AkdParola]) values( 'Akademisyen' + convert(varchar, @t ), @p , 'akademisyen' + convert(varchar, @t) + '@acd.uni.edu.tr','Parola' + convert(varchar, @t) )
	end
	
	set @p = @p + 1	
	
end

select * from Akademisyen