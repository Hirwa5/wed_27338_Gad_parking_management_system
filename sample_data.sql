-- Sample Users
INSERT INTO Users VALUES (1, 'Niyonzima Claude', '0789123456', 'Driver');
INSERT INTO Users VALUES (2, 'Uwase Sandrine', '0789234567', 'Driver');

-- Vehicles
INSERT INTO Vehicles VALUES (1, 1, 'RAA123Z', 'Car');
INSERT INTO Vehicles VALUES (2, 2, 'RAB456Y', 'Motorbike');

-- Parking Slots
INSERT INTO Parking_Slots VALUES (1, 'Available', NULL);
INSERT INTO Parking_Slots VALUES (2, 'Available', NULL);

-- Attendants
INSERT INTO Attendants VALUES (1, 'Kabera Alice', 'Morning', 'Zone A');
INSERT INTO Attendants VALUES (2, 'Nshimiyimana Jean', 'Evening', 'Zone B');

-- Public Holidays
INSERT INTO Public_Holidays VALUES (TO_DATE('2025-06-01', 'YYYY-MM-DD'));