
--//retrieve failed test(test score < 90)
create or replace procedure failed_test as
cursor failed is 
select test_no, registrationno, score, "date", "name"
from test_event, airport_employee
where score < 90 and tech_ssn = ssn;

begin
for this in failed
loop
DBMS_OUTPUT.PUT_LINE(this.test_no || ' ' || this.registrationno || ' ' || this.score|| ' ' || this."date"|| ' ' || this."name");
end loop;
end;


--//retrieve runways that opened before 2000
create or replace procedure runway_2000 as
cursor runway is 
select runway_id, "name", year_open
from runway
where year_open < 2000;

begin
for this in runway
loop
DBMS_OUTPUT.PUT_LINE(this.runway_id || ' ' || this."name" || ' ' || this.year_open);
end loop;
end;


--retrieve flights information that depart between 7pm and 7am
create or replace procedure night_flight as
cursor flight is
select flight.flightid, airlineid, departtime, gateno
from flight, depart_arrival
where flight.flightid = depart_arrival.flightid and departtime > 1900 or departtime < 0700;

begin
for this in flight
loop
DBMS_OUTPUT.PUT_LINE(this.flightid || ' ' || this.airlineid || ' ' || this.departtime|| ' ' || this.gateno);
end loop;
end;


--retrieve technician who Tgrade is 3 and salary is below 85000
create or replace procedure tech as
cursor poor_guy is
select "name", salary
from airport_employee, technician
where airport_employee.ssn = technician.ssn and tgrade = 3 and salary < 85000;

begin
for this in poor_guy
loop
DBMS_OUTPUT.PUT_LINE(this."name" || ' ' || this.salary);
end loop;
end;

set serveroutput on
begin
tech;
end;


--retrieve flights information that depart between 7pm and 7am
create or replace procedure night_flight(airline_name in VARCHAR2,registration_NO out varchar2) as
cursor c2 is
select FLIGHTID
from flight
where airlineID = (select airlineID from airline where airlineName = airline_name)  and departtime > 1900 or  arrivaltime < 0700;
BEGIN
dbms_output.enable();
FOR a1 IN c2
  LOOP
     BEGIN
     SELECT registrationNO INTO registration_NO FROM FLY WHERE flightid = a1.flightid;     
     dbms_output.put_line(' The registration NO of night flights : ' ||registration_NO);
     END;
  END LOOP;
END;

set serveroutput on
DECLARE
a VARCHAR2(20);
b VARCHAR2(20);
BEGIN
   a := 'United Continental';
   night_flight(a,b);
END;




set serveroutput on
begin 
night_flight;
end;

set serveroutput on
begin 
runway_2000;
end;

set serveroutput on
begin 
failed_test;
end;