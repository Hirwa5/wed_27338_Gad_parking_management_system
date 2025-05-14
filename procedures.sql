CREATE OR REPLACE PROCEDURE RecordTransaction(
    p_vehicle_id IN NUMBER,
    p_entry_time IN TIMESTAMP,
    p_exit_time IN TIMESTAMP,
    p_payment_status IN VARCHAR2
)
IS
BEGIN
    INSERT INTO Transactions (Transaction_ID, Vehicle_ID, Entry_Time, Exit_Time, Payment_Status)
    VALUES (Transactions_SEQ.NEXTVAL, p_vehicle_id, p_entry_time, p_exit_time, p_payment_status);
END;
/