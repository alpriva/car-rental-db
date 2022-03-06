# car-rental-db
 
This project represents database for a car rental company

Database is defined by the relations below:

 branch (bno, baddress, mid)
 worker (wid, wname, waddress, bno)
 car (lno, myear, comp, doors, shift, boot, seats)
 client (cid,cname, address, credit, byear)
 request (cid, rno, days, doors, shift, boot, seats, wid)
 rent (cid, rno, lno, fdate,tdate,wid, amount)

Table branch contains information about branches of the car rental company.
Table worker contains data about workers in the company.
Table car contains data about cars for rent.
Table client contains information about clients.
Table request contains data about requests for car rental reservations.
Table rent contains data about actual car rental.

There is trigger that acts while adding an actual rental, checks that the selected vehicle 
meets the requirement of the number of seats in the vehicle in the request and at least one other request.

There are 7 different queries in file queries.sql
