select cid, rno
from rent
group by cid, rno
having sum(amount)>= all
                 (select sum(amount)
				 from rent
				 group by cid,rno)