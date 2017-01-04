--after update flight information, display old flight arrival/depart time and new flight arrival/depart time
create or replace trigger after_update_flight
after update
on flight
for each row

begin
DBMS_OUTPUT.PUT_LINE('old arrival time: ' || :old.arrivaltime);
DBMS_OUTPUT.PUT_LINE('new arrival time: ' || :new.arrivaltime);
DBMS_OUTPUT.PUT_LINE('old depart time: ' || :old.departtime);
DBMS_OUTPUT.PUT_LINE('new depart time: ' || :new.departtime);
end;
/

--after insert new model, display the new model information
create or replace trigger after_insert_model
after insert
on "model"
for each row

begin
DBMS_OUTPUT.PUT_LINE('new model No: ' || :new.model_no);
DBMS_OUTPUT.PUT_LINE('new model capacity: ' || :new."capacity");
DBMS_OUTPUT.PUT_LINE('new model weight: ' || :new.weight);
end;
/



CREATE OR REPLACE TRIGGER SAL_EMP
  BEFORE UPDATE ON AIRPORT_EMPLOYEE
  FOR EACH ROW
BEGIN
  IF :OLD.SALARY > :NEW.SALARY THEN
    DBMS_OUTPUT.PUT_LINE('salary decreased');
  ELSIF :OLD.SALARY < :NEW.SALARY THEN
    DBMS_OUTPUT.PUT_LINE('salary increased');
  ELSE
    DBMS_OUTPUT.PUT_LINE('salary not changed');
  END IF;
  DBMS_OUTPUT.PUT_LINE('old salary ：' || :OLD.SALary);
  DBMS_OUTPUT.PUT_LINE('new salary ：' || :NEW.SALary);
END;
/


UPDATE AIRPORT_EMPLOYEE SET salary = 3000 WHERE SSN= '12345678';