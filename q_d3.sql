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