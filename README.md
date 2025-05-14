# 🚗 Parking Management System

## 📅 Project Details

- **Student Name**: Gad HIRWA
- **Student ID**: 27338
- **Lecturer**: Eric Maniraguha
- **Course Code & Name**: INSY 8311 - Database Development with PL/SQL
- **Academic Year**: 2024-2025

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

* `USERS`
* `VEHICLES`
* `PARKING_SLOTS`
* `TRANSACTIONS`
* `ATTENDANTS`
* `PUBLIC_HOLIDAYS`
* `AUDIT_LOG`

### 💡 Constraints

* **Primary/Foreign Keys:** Implemented to ensure data integrity and relationships between tables.
* **NOT NULL:** Applied to mandatory attributes to prevent missing data.
* **UNIQUE:** Used for attributes like `User_ID`, `Vehicle_ID`, `License_Plate`, and `Slot_ID`.
* **CHECK constraints:** Enforced for attributes such as `Role` (e.g., 'Admin', 'Manager', 'Owner', 'Attendant'), `Status` in `PARKING_SLOTS` (e.g., 'Available', 'Occupied'), and `Payment_Status` in `TRANSACTIONS` (e.g., 'Pending', 'Paid').

### 🔢 SQL Components

#### 🛠️ Procedures

* `AssignParkingSlot(vehicle_id, slot_id)`: Assigns a specific parking slot to a vehicle.
* `ReleaseParkingSlot(slot_id)`: Marks a parking slot as available when a vehicle leaves.

#### 💡 Functions

* `GetTotalParkingTime(transaction_id)`: Calculates the total parking duration for a given transaction.

#### 👀 Cursors

* Cursor to list all vehicles currently parked, providing details like license plate and assigned slot.

#### 📦 Packages

* `ParkingOps`: Contains procedures and functions related to parking slot assignments and transaction management.

#### 🚧 Triggers

* Trigger to prevent Data Manipulation Language (DML) operations (INSERT, UPDATE, DELETE) on critical tables during weekdays and public holidays to maintain data consistency during operational hours.
* Trigger to log all sensitive changes (e.g., updates to user roles, parking slot assignments, transaction payments) to the `AUDIT_LOG` table for security and traceability.

### 🧪 Sample Data

**(Rwandan Names Used)**

* **Users:** Niyonzima Claude, Uwase Sandrine, Habimana Patrick
* **Attendants:** Kabera Alice, Nshimiyimana Jean

## 💼 Tools Used

* Oracle 21c
* SQL Developer
* Lucidchart for ERD
* GitHub for documentation

## 📅 Timeline

* **Phase I:** Problem Statement ✔️
* **Phase II:** Business Process Modeling ✔️
* **Phase III:** Logical Design ✔️
* <img width="960" alt="ERD1" src="https://github.com/user-attachments/assets/290df1bd-d76a-4479-958d-92bd6d5741a0" />

* **Phase IV:** Database Creation ✔️
* **Phase V:** Table Implementation & Data Insertion ✔️
* <img width="960" alt="CREATING ALL TABKLES" src="https://github.com/user-attachments/assets/dfe449a7-3b05-4e54-825c-b4978e313d38" />

* **Phase VI:** Procedures, Functions, Cursors ✔️
* **Phase VII:** Triggers, Packages, Auditing ✔️
* **Phase VIII:** Final Presentation & GitHub Report ✔️

## 📄 License

Submitted as Capstone Project for Database Development with PL/SQL (2024-2025) at AUCA.

> “Work at it with all your heart, as working for the Lord…” — Colossians 3:23
