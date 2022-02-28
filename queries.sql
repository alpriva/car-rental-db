/*query_1:  displays client id and request number for requests
that were treated by "dan cohen" in "ramat gan"*/
select cid,rno
from request, branch, worker
where request.wid = worker.wid
      and branch.bno = worker.bno and
	  baddress LIKE'%ramat gan%' and
	  wname = 'dan cohen'

/*query_2 displays request number and client id for request
with largest sum*/
select cid, rno
from rent
group by cid, rno
having sum(amount)>= all
                 (select sum(amount)
				 from rent
				 group by cid,rno)

/* query_3 displays the name of the customer who paid the highest amount for all his rentals, for rentals
  whose return date was 2020 */
select cname
from rent,client
where rent.cid = client.cid and
      date_part('year',tdate)='2020'
group by cname
having sum(amount)>=all
                    (select sum (amount)
					from rent,client
					where rent.cid=client.cid
					and date_part('year',tdate)='2020'
					group by cname)

/* query_4 finds branch that have at least 3 different workers that handled
requests for large cars (more than 5 seats) */
select distinct bno
from request,worker
where request.wid = worker.wid and
                seats > 5
group by bno
having count(distinct request.wid) >= 3

/*query_5 finds customer names that have never received the type of gear they requested (automatic or gearbox).*/
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

/*query_6 finds the employee who rented the highest number of vehicles from
the workers who actually rented vehicles, and never handled a rental application*/
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

/*query_7 finds a request that has rented vehicles from all the companies*/
select cid,rno
from (select cid,rno,count(distinct comp) as comp
      from rent,car
      where rent.lno = car.lno
	  group by cid,rno) as temp
where temp.comp = all(select count(distinct comp)
					 from car)