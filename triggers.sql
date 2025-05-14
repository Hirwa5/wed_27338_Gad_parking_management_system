CREATE OR REPLACE TRIGGER trg_block_weekdays_holidays
BEFORE INSERT OR UPDATE OR DELETE ON Transactions
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') IN ('MON', 'TUE', 'WED', 'THU', 'FRI') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Modifications are not allowed during weekdays.');
    END IF;

    SELECT COUNT(*) INTO v_count
    FROM Public_Holidays
    WHERE Holiday_Date = TRUNC(SYSDATE);

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Modifications are not allowed on public holidays.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_audit_transactions
AFTER INSERT OR UPDATE OR DELETE ON Transactions
FOR EACH ROW
DECLARE
    v_old_value CLOB;
    v_new_value CLOB;
BEGIN
    IF INSERTING THEN
        v_new_value := 'Vehicle_ID: ' || :NEW.Vehicle_ID || ', Entry: ' || :NEW.Entry_Time || ', Exit: ' || :NEW.Exit_Time;
        INSERT INTO audit_log (Table_Name, Operation, Changed_By, New_Value)
        VALUES ('Transactions', 'INSERT', USER, v_new_value);
    ELSIF UPDATING THEN
        v_old_value := 'Vehicle_ID: ' || :OLD.Vehicle_ID || ', Entry: ' || :OLD.Entry_Time || ', Exit: ' || :OLD.Exit_Time;
        v_new_value := 'Vehicle_ID: ' || :NEW.Vehicle_ID || ', Entry: ' || :NEW.Entry_Time || ', Exit: ' || :NEW.Exit_Time;
        INSERT INTO audit_log (Table_Name, Operation, Changed_By, Old_Value, New_Value)
        VALUES ('Transactions', 'UPDATE', USER, v_old_value, v_new_value);
    ELSIF DELETING THEN
        v_old_value := 'Vehicle_ID: ' || :OLD.Vehicle_ID || ', Entry: ' || :OLD.Entry_Time || ', Exit: ' || :OLD.Exit_Time;
        INSERT INTO audit_log (Table_Name, Operation, Changed_By, Old_Value)
        VALUES ('Transactions', 'DELETE', USER, v_old_value);
    END IF;
END;
/