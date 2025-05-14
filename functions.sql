CREATE OR REPLACE FUNCTION GetTotalParkingTime(p_transaction_id IN NUMBER)
RETURN NUMBER
IS
    v_duration NUMBER;
BEGIN
    SELECT (Exit_Time - Entry_Time) * 24 INTO v_duration
    FROM Transactions
    WHERE Transaction_ID = p_transaction_id;

    RETURN v_duration;
END;
/