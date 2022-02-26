create or replace function trigf1() returns trigger as $$
declare
   new_seats int;
   new_doors int;
   new_shift int;
   new_boot int;
begin

select seats into new_seats
from car
where car.lno = new.lno;

select doors into new_doors
from car
where car.lno = new.lno;

select shift into new_shift
from car
where car.lno = new.lno;

select boot into new_boot
from car
where car.lno = new.lno;

if (new_seats = (select seats from request where request.cid = new.cid
				and request.rno = new.rno) and (new_doors = (select doors from request
				where request.cid = new.cid and request.rno = new.rno ) or 
				new_shift = (select shift from request where request.cid = new.cid and request.rno = new.rno)
				or new_boot = (select boot from request where request.cid = new.cid and request.rno = new.rno )))
				then return new;
else begin
 raise notice 'Error, car doesnt match a request';
 return NULL;
end;
end if;
end;
$$ language plpgsql;

create trigger T1
before insert on rent
for each row
execute procedure trigf1();
   