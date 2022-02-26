select distinct cname
from request,rent,client,car
where request.cid=rent.cid
      and request.rno = rent.rno
	  and rent.lno=car.lno
	  and client.cid = request.cid
	  and client.cid = rent.cid
	  and request.shift <> car.shift and cname not in( select cname
											     from request,rent,client,car
												 where request.cid=rent.cid
                                                 and request.rno = rent.rno
	                                             and rent.lno=car.lno
	                                             and client.cid = request.cid
	                                             and client.cid = rent.cid
	                                             and request.shift = car.shift
											   )