select * from ÖðrenciDers
select * from Ders

select o.ÖðrenciId, d.DersId
from Öðrenci o
INNER JOIN Ders d ON d.BölümId = o.BölümId

declare @OId int = 0, @BölümId int = 0
while exists(select 1 from Öðrenci where ÖðrenciId>@OId)
begin
	select @OId = MIN(ÖðrenciId) from Öðrenci where ÖðrenciId>@OId
	select @BölümId = BölümId from Öðrenci where ÖðrenciId=@OId
	--print @OId

	insert into ÖðrenciDers (ÖðrenciId, DersId)
	select top 2 @OId, DersId from Ders where BölümId = @BölümId order by NEWID()

end
select * from ÖðrenciDers
select DersId, count(*) from ÖðrenciDers group by DersId
