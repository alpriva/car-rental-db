select cid,rno
from (select cid,rno,count(distinct comp) as comp
      from rent,car
      where rent.lno = car.lno
	  group by cid,rno) as temp
where temp.comp = all(select count(distinct comp)
					 from car)	 