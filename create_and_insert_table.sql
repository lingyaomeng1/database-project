create table airline
(
airlineid VARCHAR2(20),
airlinename VARCHAR2(20),

CONSTRAINT airlinepk
primary key (airlineid)
);

insert into airline 
values ('AA', 'America Airline');

insert into airline 
values ('DA', 'Dalta Airline');

insert into airline 
values ('UC', 'United Continental');




create table terminal
(
terminalid VARCHAR2(20),
start_use date,
gateNo varchar2(20),

CONSTRAINT terminalpk
primary key (gateNo)
);

insert into terminal 
values ('A', '12-DEC-1999', 'A01');

insert into terminal 
values ('B', '16-JAN-2001', 'B05');

insert into terminal 
values ('C', '22-DEC-2005', 'C02');



create table flight
(
flightid   varchar2(20),
airlineid  varchar2(20),
arrivaltime int,
departtime int,

constraint flightpk
primary key(flightid),

constraint flightfk
FOREIGN key (airlineid ) REFERENCES airline(airlineid)
);

insert into flight 
values ('AA282', 'AA', 1420, 1730);

insert into flight 
values ('AA011', 'AA', 0822, 1030);

insert into flight 
values ('DA333', 'DA', 0931, 2233);

insert into flight 
values ('DA222', 'DA', 1652, 1925);

insert into flight 
values ('UC876', 'UC', 1000, 2040);

insert into flight 
values ('UC167', 'UC', 1755, 2240);

create table airport_employee
(
ssn varchar2(9),
"name" VARCHAR2(20),
salary int,
address VARCHAR2(50),
union_no int,
phone_number VARCHAR2(20),
jobtype int,

CONSTRAINT employeepk
primary key (ssn)
);

insert into airport_employee
values ('12345678', 'Tom Katy',80000,'800 W Renner rd 2313',213678,'069213828',1);
insert into airport_employee
values ('22345678', 'Shery Helen',83000,'800 N Renner rd 2413',113678,'078129023',1);
insert into airport_employee
values ('32345678', 'Jack Chan',75000,'800 S Renner rd 2513',003678,'090231245',1);
insert into airport_employee
values ('42345678', 'Lucy Bee',75200,'800 E Renner rd 2713',413678,'059213828',1);

insert into airport_employee
values ('34345678', 'Alen Helen',80000,'500 W Renner rd 2513',513678,'169213828',2);
insert into airport_employee
values ('35345678', 'Helen Bruce',83000,'500 N Renner rd 2613',913678,'178129023',2);
insert into airport_employee
values ('36345678', 'Ruchard Chen',75000,'500 S Renner rd 2713',303678,'190231245',2);
insert into airport_employee
values ('39345678', 'Stanford Li',75300,'500 E Renner rd 2913',313678,'159213828',2);

insert into airport_employee
values ('90345678', 'Tom Katy',80000,'100 W Renner rd 2313',213678,'069213828',3);
insert into airport_employee
values ('91345678', 'Shery Helen',83000,'100 N Renner rd 2413',113678,'078129023',3);
insert into airport_employee
values ('92345678', 'Jack Chan',75000,'100 S Renner rd 2513',413678,'090231245',3);
insert into airport_employee
values ('93345678', 'Lucy Bee',75200,'100 E Renner rd 2713',413678,'059213828',3);

insert into airport_employee
values ('12332678', 'Li Zhang',85000,'700 W Renner rd 2312',213633,'369213828',4);
insert into airport_employee
values ('22333678', 'Lei Zhang',89000,'700 N Renner rd 2412',113633,'378129023',4);
insert into airport_employee
values ('32334678', 'Yufeng Luo',75000,'700 S Renner rd 2512',413633,'390231245',4);
insert into airport_employee
values ('42335678', 'Jinping Xi',95200,'700 E Renner rd 2712',413633,'359213828',4);



CREATE TABLE "TEST"
(
FAA_testNo        VARCHAR2(20)    NOT NULL,
"name"         VARCHAR2(20)    NOT NULL,
max_score    int    NOT NULL,

CONSTRAINT TestPK
    PRIMARY KEY(FAA_testNo)
      
);

insert into "TEST" 
values ('HAHA123', 'HAHA', 95);

insert into "TEST" 
values ('GAGA321', 'GAGA', 92);

insert into "TEST" 
values ('DUDU888', 'DUDU', 99);


create table hangar_manager
(
ssn varchar2(9),
start_date date,

CONSTRAINT hangar_managerpk
primary key (ssn),

CONSTRAINT hangar_managerfk
FOREIGN key (ssn) REFERENCES airport_employee(ssn)
);

insert into hangar_manager
values ('12345678', '13-JAN-2011');

insert into hangar_manager
values ('22345678', '22-FEB-2014');

insert into hangar_manager
values ('32345678', '13-MAR-2015');

create table baggage_handler
(
ssn varchar2(9),
hearing_test_date date,

CONSTRAINT baggage_handlerpk
primary key (ssn),

CONSTRAINT baggage_handlerfk
FOREIGN key (ssn) REFERENCES airport_employee(ssn)
);

insert into baggage_handler
values ('34345678', '13-JAN-2011');

insert into baggage_handler
values ('35345678', '22-FEB-2014');

insert into baggage_handler
values ('36345678', '13-MAR-2015');



create table technician
(
ssn varchar2(9),
tgrade int,

CONSTRAINT technicianpk
primary key (ssn),

CONSTRAINT technicianfk
FOREIGN key (ssn) REFERENCES airport_employee(ssn)
);

insert into technician
values ('90345678', 2);

insert into technician
values ('91345678', 3);

insert into technician
values ('92345678', 1);

create table hangar
(
hangarno VARCHAR2(20),
"name" VARCHAR2(20),
address VARCHAR2(50),
airlineid VARCHAR2(10),
hm_ssn varchar2(9),

CONSTRAINT hangarpk
primary key (hangarno),

constraint hangarfk
FOREIGN key (hm_ssn) REFERENCES hangar_manager(ssn)
);

insert into hangar
values ('ABC001', 'QQ', '1E street', 'AA', '12345678');

insert into hangar
values ('ABC002', 'EE', '2E street', 'UC', '22345678');

insert into hangar
values ('ABC003', 'WW', '3E street', 'AA', '32345678');

create table "model"
(
model_no VARCHAR2(20),
"capacity" int,
weight int,

CONSTRAINT modelpk
primary key(model_no)
);

insert into "model"
values ('B788', 268, 10);

insert into "model"
values ('B747', 230, 9);

insert into "model"
values ('A380', 380, 15);


create table aircraft
(
registrationNo VARCHAR2(20),
hangarno VARCHAR2(20),
airlineid VARCHAR2(20),
model_no VARCHAR2(20),

CONSTRAINT aircraftpk
primary key (registrationNo),

CONSTRAINT aircraftfk1
FOREIGN key (hangarno) REFERENCES hangar(hangarno),

CONSTRAINT aircraftfk2
FOREIGN key (airlineid) REFERENCES airline(airlineid),

CONSTRAINT aircraftfk3
FOREIGN key (model_no) REFERENCES "model"(model_no)
);

insert into aircraft
values ('NN122331125', 'ABC001', 'AA', 'B788');

insert into aircraft
values ('LK354652263', 'ABC002', 'AA', 'B747');

insert into aircraft
values ('JF325698552', 'ABC003', 'UC', 'A380');


CREATE TABLE Test_event
(
test_No       VARCHAR2(20)    NOT NULL,
registrationNo        VARCHAR2(20)    NOT NULL,
tech_SSN                        varchar2(9)       NOT NULL,
"date"  date  not null,
hours FLOAT not null,
score int not null,

CONSTRAINT TEST_eventPK
    PRIMARY KEY(test_No, registrationNo, tech_SSN),

CONSTRAINT TEST_eventfk1
FOREIGN key (test_No) REFERENCES "TEST"(FAA_testNo),

CONSTRAINT TEST_eventfk2
FOREIGN key (tech_SSN) REFERENCES airport_employee(ssn),


CONSTRAINT TEST_eventfk3
FOREIGN key (registrationNo) REFERENCES aircraft(registrationNo)      
);

insert into Test_event
values ('HAHA123', 'NN122331125', '90345678', '17-APR-2016', 3.2, 88);

insert into Test_event
values ('GAGA321', 'NN122331125', '90345678', '18-APR-2016', 2.6, 98);

insert into Test_event
values ('DUDU888', 'LK354652263', '91345678', '22-APR-2016', 5.1, 90);



CREATE TABLE Rent
(

gateNo        VARCHAR2(20)    NOT NULL,
airlineID       varchar2(20)       NOT NULL,
contr_start  date  not null,
contr_end date not null,

CONSTRAINT RentPK
    PRIMARY KEY( gateNo, airlineID),

constraint rentfk1
foreign key (gateNo) REFERENCES terminal(GateNo),


CONSTRAINT Rentfk2
FOREIGN key (airlineID) REFERENCES airline(airlineID)  
      
);

insert into Rent
values ('A01', 'AA', '17-APR-2000', '17-APR-2050');

insert into Rent
values ('B05', 'AA', '18-APR-2000', '18-APR-2050');

insert into Rent
values ('C02', 'DA', '22-APR-2000', '22-APR-2050');



create table runway
(
runway_id varchar2(20),
"name" VARCHAR2(20),
year_open int,
"length" int,

CONSTRAINT runwaypk
primary key (runway_id)
);

insert into runway
values ('DFW001', 'Sky', 1988, 3000);

insert into runway
values ('DFW002', 'Wind', 1988, 5000);

insert into runway
values ('DFW003', 'Rain', 2000, 7000);



create table traffic_controller
(
ssn varchar2(9),
medical_exam_date date,

CONSTRAINT traffic_controllerpk
primary key (ssn),

CONSTRAINT traffic_controllerfk
FOREIGN key (ssn) REFERENCES airport_employee(ssn)
);

insert into  traffic_controller
values ('42335678', '23-APR-2015');

insert into  traffic_controller
values ('32334678', '17-JUN-2015');

insert into  traffic_controller
values ('22333678', '17-JUN-2015');




CREATE TABLE Controls_and_coordinates
(
runwayID       VARCHAR2(20)    NOT NULL,
tc_SSN                        varchar2(9)       NOT NULL,


CONSTRAINT Controls_and_coordinatesPK
    PRIMARY KEY(runwayID),
      
CONSTRAINT Controls_and_coordinatesfk1
FOREIGN key (runwayID) REFERENCES runway(runway_id),

CONSTRAINT Controls_and_coordinatesfk2
FOREIGN key (tc_ssn) REFERENCES traffic_controller(ssn)
);

insert into  Controls_and_coordinates
values ('DFW001', '42335678');

insert into  Controls_and_coordinates
values ('DFW002', '32334678');

insert into  Controls_and_coordinates
values ('DFW003', '22333678');







CREATE TABLE Direct
(
registrationNo        VARCHAR2(20)    NOT NULL,
tc_SSN                        varchar2(9)       NOT NULL,


CONSTRAINT DirectPK
    PRIMARY KEY(registrationNo ),
      
CONSTRAINT Directfk1
FOREIGN key (registrationNo) REFERENCES aircraft(registrationNo),

CONSTRAINT Directfk2
FOREIGN key (tc_ssn) REFERENCES traffic_controller(ssn)
);


insert into Direct
values ('NN122331125', '42335678');

insert into  Direct
values ('LK354652263', '32334678');

insert into  Direct
values ('JF325698552', '22333678');










CREATE TABLE Service
(
flightID       VARCHAR2(20)    NOT NULL,
bh_SSN        varchar2(9)    NOT NULL,
"date"            date     NOT NULL,   

CONSTRAINT ServicePK
    PRIMARY KEY(flightID, bh_SSN),
      
CONSTRAINT Servicefk1
FOREIGN key (flightID) REFERENCES flight(flightID),

CONSTRAINT Servicefk2
FOREIGN key (bh_SSN) REFERENCES baggage_handler(ssn)
);

insert into Service
values ('AA282', '35345678','17-JUN-2015');

insert into Service
values ('AA011', '36345678','10-JUN-2015');

insert into  Service
values ('DA333', '34345678','12-JUN-2015');




CREATE TABLE Expert
(
model_No       VARCHAR2(20)    NOT NULL,
Tech_SSN        varchar2(9)    NOT NULL,
CONSTRAINT ExpertPK
    PRIMARY KEY(model_No, Tech_SSN),

CONSTRAINT Expertfk1
FOREIGN key (model_No) REFERENCES "model"(model_No),

CONSTRAINT Expertfk2
FOREIGN key (Tech_SSN) REFERENCES technician(ssn)
);

insert into Expert
values ('B788', '90345678');

insert into Expert
values ('B747', '91345678');

insert into Expert
values ('A380', '92345678');









CREATE TABLE Fly
(
registrationNo      VARCHAR2(20)    NOT NULL,
flightID                       VARCHAR2(20)    NOT NULL,


CONSTRAINT FlyPK
    PRIMARY KEY(registrationNo, flightID),
      
CONSTRAINT Flyfk1
FOREIGN key (registrationNo) REFERENCES aircraft(registrationNo),

CONSTRAINT Flyfk2
FOREIGN key (flightID) REFERENCES flight(flightID)
);


insert into Fly
values ('LK354652263', 'DA222');

insert into Fly
values ('NN122331125', 'UC876');

insert into Fly
values ('JF325698552', 'UC167');












create table baggage_carousel
(
baggagecarouselid VARCHAR2(20),
"availability" int,

CONSTRAINT baggagecarouselpk
primary key (baggagecarouselid)
);

insert into  baggage_carousel
values ('13479137', 1);

insert into  baggage_carousel
values ('15802368', 0);

insert into  baggage_carousel
values ('76933853', 1);






CREATE TABLE Depart_arrival
(
flightID   VARCHAR2(20)    NOT NULL,
gateNO        VARCHAR2(20)    NOT NULL,
use_date           date     NOT NULL,  
start_use_time       int      NOT NULL,  
end_use_time         int     NOT NULL,  

CONSTRAINT Depart_arrivalPk
    PRIMARY KEY(flightID, use_date),

CONSTRAINT Depart_arrivalfk1
FOREIGN key (flightID) REFERENCES flight(flightID),

CONSTRAINT Depart_arrivalfk2
FOREIGN key (gateNO) REFERENCES terminal(gateNO)
      
);
insert into   Depart_arrival
values ('UC876', 'B05','14-JUN-2016',2320,1423);

insert into  Depart_arrival
values ('DA222','A01','13-JUN-2016',1232,1612);

insert into  Depart_arrival
values ('UC167','C02','12-JUN-2016',1513,1912);






CREATE TABLE "User"
(
flightID       VARCHAR2(20)    NOT NULL,
BaggageCarouselID      VARCHAR2(20)    NOT NULL,
use_date           date     NOT NULL,  
start_use_time        int     NOT NULL,
end_use_time         int      NOT NULL,

CONSTRAINT UserPK
    PRIMARY KEY(flightID, BaggageCarouselID, use_date),

CONSTRAINT Userfk1
FOREIGN key (flightID) REFERENCES flight(flightID),

CONSTRAINT Userfk2
FOREIGN key (BaggageCarouselID) REFERENCES baggage_carousel(BaggageCarouselID)  
);

insert into   "User"
values ('UC876', '15802368','14-JUN-2016',1720,2223);

insert into "User"
values ('DA222','13479137','13-JUN-2016',1132,1612);

insert into "User"
values ('UC167','76933853','12-JUN-2016',1413,2012);