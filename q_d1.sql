select cid,rno
from request, branch, worker
where request.wid = worker.wid
      and branch.bno = worker.bno and
	  baddress LIKE'%ramat gan%' and
	  wname = 'dan cohen'