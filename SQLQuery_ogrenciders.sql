select * from ��renciDers
select * from Ders

select o.��renciId, d.DersId
from ��renci o
INNER JOIN Ders d ON d.B�l�mId = o.B�l�mId

declare @OId int = 0, @B�l�mId int = 0
while exists(select 1 from ��renci where ��renciId>@OId)
begin
	select @OId = MIN(��renciId) from ��renci where ��renciId>@OId
	select @B�l�mId = B�l�mId from ��renci where ��renciId=@OId
	--print @OId

	insert into ��renciDers (��renciId, DersId)
	select top 2 @OId, DersId from Ders where B�l�mId = @B�l�mId order by NEWID()

end
select * from ��renciDers
select DersId, count(*) from ��renciDers group by DersId
