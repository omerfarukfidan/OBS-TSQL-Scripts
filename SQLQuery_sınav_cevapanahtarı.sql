select char(65+ convert(int, RAND()*5))
/*
delete from CevapAnahtarý
DBCC CHECKIDENT (CevapAnahtarý, RESEED, 0)--idleri 1 den baþlatan komut
select * from CevapAnahtarý
*/
--select * from Sýnav


declare @i int = 0, @p int = 1, @t int = 0


while @p <=7
begin
	set @i = 0
	while @i < 1
	begin
		set @i = @i + 1
		set @t = @t + 1
		Insert Into [dbo].[Sýnav] ([DersId],[SýnavTipi],[SoruSayýsý]) values( @p, 'final', FLOOR(RAND()*3+3)*10  )



	end
	
	set @p = @p + 1	
	
end

select * from Sýnav

select ROW_NUMBER() OVER(ORDER BY c1.ORDINAL_POSITION)RN 
into #x
from INFORMATION_SCHEMA.COLUMNS c1
CROSS JOIN INFORMATION_SCHEMA.COLUMNS c2
--CROSS JOIN INFORMATION_SCHEMA.COLUMNS c3


select * from Sýnav

insert into Sýnav (DersId, SýnavTipi, SoruSayýsý)
select DersId, case RN when 1 then 'vize1' when 2 then 'vize2' else 'final' end SýnavTipi,
convert(int, FLOOR(RAND(CHECKSUM(NEWID()))*3+3) *10) SoruSayýsý
from ders
CROSS JOIN (select * from #x where RN <=3)x

delete from CevapAnahtarý

insert into CevapAnahtarý (SýnavId, SoruNo, DoðruCevap)
select SýnavId, RN, CHAR(FLOOR(RAND(CHECKSUM(NEWID()))*5+65)) 
from Sýnav s
INNER JOIN #x x ON x.RN<=s.SoruSayýsý

