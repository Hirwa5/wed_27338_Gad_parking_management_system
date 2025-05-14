# 🚗 Parking Management System

## 📅 Project Details

**Student Name:** [Your Name]
**Student ID:** [Your ID]
**Lecturer:** Eric Maniraguha
**Course Code & Name:** INSY 8311 - Database Development with PL/SQL
**Academic Year:** 2024-2025

## 🌐 Introduction

The Parking Management System is a PL/SQL-based Oracle database designed to streamline and automate the parking operations of a facility. It keeps track of vehicles, users, attendants, parking slot statuses, and transaction history with built-in security and auditing mechanisms.

## 💪 Problem Statement

Modern parking areas face challenges such as:

* Inefficient manual records of vehicles and users
* Difficulty assigning and tracking parking slots
* Lack of accountability in entry/exit time recording
* Limited auditing and access controls

This system addresses these issues by offering automation, traceability, and data integrity.

## 🛍️ Target Users

* Parking Lot Managers
* Attendants
* Vehicle Owners
* Administrators

## 🚀 Project Goals

* Automate vehicle registration and parking assignment
* Track parking slot availability in real-time
* Record entry/exit logs and compute payments
* Prevent unauthorized changes during specific days
* Enable detailed auditing and traceability

## 📊 Entity-Relationship Diagram (ERD)

*(The ERD was created using Lucidchart and can be found in the project documentation on GitHub.)*

**Entities:**

* **Users** (User\_ID, Name, Contact\_Info, Role)
* **Vehicles** (Vehicle\_ID, Owner\_ID (FK), License\_Plate, Type)
* **Parking Slots** (Slot\_ID, Status, Vehicle\_Assigned)
* **Transactions** (Transaction\_ID, Vehicle\_ID (FK), Entry\_Time, Exit\_Time, Payment\_Status)
* **Attendants** (Employee\_ID, Name, Shift, Assigned\_Area)

**Relationships:**

* Users ↔ Vehicles: One-to-Many
* Vehicles ↔ Parking Slots: One-to-One
* Vehicles ↔ Transactions: One-to-Many
* Attendants ↔ Parking Slots: One-to-Many

## 🔧 Database Structure

### 🔢 Tables

```sql
-- USERS Table
CREATE TABLE USERS (
    User_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Contact_Info VARCHAR2(100),
    Role VARCHAR2(20) NOT NULL CHECK (Role IN ('Admin', 'Owner'))
);

-- VEHICLES Table
CREATE TABLE VEHICLES (
    Vehicle_ID NUMBER PRIMARY KEY,
    Owner_ID NUMBER NOT NULL,
    License_Plate VARCHAR2(20) UNIQUE NOT NULL,
    Type VARCHAR2(20),
    FOREIGN KEY (Owner_ID) REFERENCES USERS(User_ID)
);

-- PARKING_SLOTS Table
CREATE TABLE PARKING_SLOTS (
    Slot_ID NUMBER PRIMARY KEY,
    Status VARCHAR2(10) DEFAULT 'Available' NOT NULL CHECK (Status IN ('Available', 'Occupied')),
    Vehicle_Assigned NUMBER UNIQUE,
    FOREIGN KEY (Vehicle_Assigned) REFERENCES VEHICLES(Vehicle_ID)
);

-- TRANSACTIONS Table
CREATE TABLE TRANSACTIONS (
    Transaction_ID NUMBER PRIMARY KEY,
    Vehicle_ID NUMBER NOT NULL,
    Entry_Time TIMESTAMP NOT NULL,
    Exit_Time TIMESTAMP,
    Payment_Status VARCHAR2(20) DEFAULT 'Pending' CHECK (Payment_Status IN ('Pending', 'Paid')),
    FOREIGN KEY (Vehicle_ID) REFERENCES VEHICLES(Vehicle_ID)
);

-- ATTENDANTS Table
CREATE TABLE ATTENDANTS (
    Employee_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Shift VARCHAR2(20),
    Assigned_Area VARCHAR2(50)
);

-- PUBLIC_HOLIDAYS Table
CREATE TABLE PUBLIC_HOLIDAYS (
    Holiday_Date DATE PRIMARY KEY,
    Description VARCHAR2(100)
);

-- AUDIT_LOG Table
CREATE TABLE AUDIT_LOG (
    Log_ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Timestamp TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    User_Name VARCHAR2(100),
    Action VARCHAR2(100) NOT NULL,
    Details CLOB
);
