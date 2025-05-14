SET SERVEROUTPUT ON;
DECLARE
    CURSOR parked_vehicles_cursor IS
        SELECT v.License_Plate, u.Name
        FROM Vehicles v
        JOIN Users u ON v.Owner_ID = u.User_ID
        JOIN Parking_Slots ps ON v.Vehicle_ID = ps.Vehicle_Assigned
        WHERE ps.Status = 'Occupied';

    v_plate Vehicles.License_Plate%TYPE;
    v_owner Users.Name%TYPE;
BEGIN
    OPEN parked_vehicles_cursor;
    LOOP
        FETCH parked_vehicles_cursor INTO v_plate, v_owner;
        EXIT WHEN parked_vehicles_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Plate: ' || v_plate || ', Owner: ' || v_owner);
    END LOOP;
    CLOSE parked_vehicles_cursor;
END;
/