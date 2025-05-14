-- Assign and Release Parking Slot
BEGIN
    ParkingOps.AssignSlot(1, 1);
    ParkingOps.ReleaseSlot(1);
END;
/

-- Record a transaction
BEGIN
    RecordTransaction(1, SYSTIMESTAMP - INTERVAL '2' HOUR, SYSTIMESTAMP, 'Paid');
END;
/

-- Test function
SELECT GetTotalParkingTime(1) AS Hours_Parked FROM DUAL;