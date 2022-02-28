/*adding data to tables*/
insert into branch values (1 ,'hanasi 1 ramat gan',99),
(2,'kalanit 12 naharya',88),
(3,'hatamar 13 eilat',97);

insert into worker values (99,'dana kama','tel aviv',1),
(88,'aviv lev','Karmiel',2),
(98,'dan cohen','ramat gan',1),
(97,'lital levi','Nahariya',2);

insert into car values (12345678, 2020,'Ford', 4, 0, 500 ,5),
(23456789, 2019, 'renault', 5, 0, 1000, 7),
(98765432, 2018, 'Ford', 5 , 1, 500, 5);

insert into client values (55,'ben dor','tel aviv', 4321, 1990),
(54,'elad aviv','petach tiqva', 4454, 1983),
(53,'oriyan adam', 'Eilat', 5545, 2001),
(52,'mika bar','beer sheva', 6666, 1983),
(51, 'eitan kol','Haifa', 1234, 2000);

insert into request values (55, 1, 10, 4, 0, 500, 5, 98),
(54, 1, 3, 4, 1, 1000, 7, 99),
(54, 2, 5, 5, 1, 500, 7, 99);

insert into rent values (55, 1, 12345678, '2/4/2020', '11/4/2020', 99, 3750),
(55, 1, 98765432,'2/4/2020', '11/4/2020', 98, 4200),
(54, 1, 23456789, '15/10/2020', '17/10/2020', 97, 1200);
