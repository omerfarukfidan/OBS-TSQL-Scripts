/*
delete from  Öðrenci
DBCC CHECKIDENT (Öðrenci, RESEED, 0)--idleri 1 den baþlatan komut
select * from Öðrenci
*/
--select * from Bölüm


declare @i int = 0, @p int = 1, @t int = 0


while @p <=7
begin
	set @i = 0
	while @i < 80
	begin
		set @i = @i + 1
		set @t = @t + 1
		Insert Into [dbo].[Öðrenci] ([ÖgrAdý],[BölümId],[ÖgrMail],[ÖgrParola]) values( 'Öðrenci' + convert(varchar, @t ), @p , 'ogrenci' + convert(varchar, @t) + '@std.uni.edu.tr','Parola' + convert(varchar, @t) )
	end
	
	set @p = @p + 1
	
end

select * from Öðrenci

/*
select top 80 ROW_NUMBER() OVER(order by object_id)RN into #lst from sys.objects
select *, (BölümId-1)*80+RN from Bölüm
CROSS JOIN #lst
*/
