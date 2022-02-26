select wid
from rent
where wid not in(select wid
				from request)
group by wid
having count(*) >= all
          (select count(*)
		  from rent
		  where wid not in(select wid
						  from request)
		  group by wid)