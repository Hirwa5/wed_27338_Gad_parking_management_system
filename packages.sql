CREATE OR REPLACE PACKAGE ParkingOps AS
    PROCEDURE AssignSlot(p_vehicle_id NUMBER, p_slot_id NUMBER);
    PROCEDURE ReleaseSlot(p_slot_id NUMBER);
END ParkingOps;
/

CREATE OR REPLACE PACKAGE BODY ParkingOps AS
    PROCEDURE AssignSlot(p_vehicle_id NUMBER, p_slot_id NUMBER) IS
    BEGIN
        UPDATE Parking_Slots
        SET Status = 'Occupied', Vehicle_Assigned = p_vehicle_id
        WHERE Slot_ID = p_slot_id;
    END;

    PROCEDURE ReleaseSlot(p_slot_id NUMBER) IS
    BEGIN
        UPDATE Parking_Slots
        SET Status = 'Available', Vehicle_Assigned = NULL
        WHERE Slot_ID = p_slot_id;
    END;
END ParkingOps;
/