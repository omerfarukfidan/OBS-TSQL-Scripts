select char(65+ convert(int, RAND()*5))
/*
delete from CevapAnahtar�
DBCC CHECKIDENT (CevapAnahtar�, RESEED, 0)--idleri 1 den ba�latan komut
select * from CevapAnahtar�
*/
--select * from S�nav

select * from CevapAnahtar�

select * from S�nav

select ROW_NUMBER() OVER(ORDER BY c1.ORDINAL_POSITION)RN 
into #x
from INFORMATION_SCHEMA.COLUMNS c1
CROSS JOIN INFORMATION_SCHEMA.COLUMNS c2
--CROSS JOIN INFORMATION_SCHEMA.COLUMNS c3


select * from S�nav

insert into S�nav (DersId, S�navTipi, SoruSay�s�)
select DersId, case RN when 1 then 'vize1' when 2 then 'vize2' else 'final' end S�navTipi,
convert(int, FLOOR(RAND(CHECKSUM(NEWID()))*3+3) *10) SoruSay�s�
from ders
CROSS JOIN (select * from #x where RN <=3)x

delete from CevapAnahtar�

insert into CevapAnahtar� (S�navId, SoruNo, Do�ruCevap)
select S�navId, RN, CHAR(FLOOR(RAND(CHECKSUM(NEWID()))*5+65)) 
from S�nav s
INNER JOIN #x x ON x.RN<=s.SoruSay�s�

