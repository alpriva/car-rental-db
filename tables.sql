/*building tables*/
create table branch
(bno int,
 baddress varchar(50),
 mid int,
 primary key (bno));
 
 create table worker
 (wid int,
 wname varchar(20),
 waddress varchar(50),
 bno int,
 primary key(wid),
 foreign key (bno) references branch);
 
 create table car
 (lno numeric(8,0),
 myear numeric(4,0),
 comp varchar(20),
 doors int,
 shift int,
 boot int,
 seats int,
 primary key (lno),
 check (shift = 0 or shift = 1));
 
 create table client
 (cid int,
  cname varchar(20),
  address varchar(50),
  credit numeric(4,0),
  byear numeric(4,0),
  primary key(cid));

create table request
(cid int,
 rno int,
 days int,
 doors int,
 shift int,
 boot int,
 seats int,
 wid int,
 primary key(cid,rno),
 foreign key(cid) references client,
 foreign key (wid) references worker,
 check (shift = 0 or shift = 1));
 

 create table rent
 (cid int,
  rno int,
  lno numeric(8,0),
  fdate date,
  tdate date,
  wid int,
  amount float,
  primary key(cid,rno,lno),
  foreign key(cid,rno) references request,
  foreign key(lno) references car,
  foreign key(wid) references worker);
	 
 