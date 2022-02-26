select distinct bno
from request,worker
where request.wid = worker.wid and
                seats > 5
group by bno
having count(distinct request.wid) >= 3