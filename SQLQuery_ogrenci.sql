/*
delete from  ��renci
DBCC CHECKIDENT (��renci, RESEED, 0)--idleri 1 den ba�latan komut
select * from ��renci
*/
--select * from B�l�m


declare @i int = 0, @p int = 1, @t int = 0


while @p <=7
begin
	set @i = 0
	while @i < 80
	begin
		set @i = @i + 1
		set @t = @t + 1
		Insert Into [dbo].[��renci] ([�grAd�],[B�l�mId],[�grMail],[�grParola]) values( '��renci' + convert(varchar, @t ), @p , 'ogrenci' + convert(varchar, @t) + '@std.uni.edu.tr','Parola' + convert(varchar, @t) )
	end
	
	set @p = @p + 1
	
end

select * from ��renci

/*
select top 80 ROW_NUMBER() OVER(order by object_id)RN into #lst from sys.objects
select *, (B�l�mId-1)*80+RN from B�l�m
CROSS JOIN #lst
*/
