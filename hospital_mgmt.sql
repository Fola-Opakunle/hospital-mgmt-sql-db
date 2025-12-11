-- SQL script to create a hospital management database 

/* Create the database */
CREATE DATABASE  IF NOT EXISTS hospital_mgmt;

/* Switch to the  database */
USE hospital_mgmt;

/* Drop existing tables  */
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS diagnosis;
DROP TABLE IF EXISTS medical_history;
DROP TABLE IF EXISTS medications;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS shifts;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS prescriptions;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS billing;
DROP TABLE IF EXISTS admissions;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS visits;

/* Create tables  */
-- 1: departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(100)
);

-- 2: Patients table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    addressLine VARCHAR(100) NOT NULL,
    postalCode VARCHAR(15) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- 3: diagnosis table
CREATE TABLE diagnosis (
    diagnosis_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- 4: Medications Table
CREATE TABLE medications (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50) NOT NULL
);

-- 5: Shifts Table
CREATE TABLE shifts (
    shift_id INT PRIMARY KEY AUTO_INCREMENT,
    shift_date DATE,
    start_time TIME,
    end_time TIME,
    shift_type VARCHAR(50) 
);

-- 6: Medical History Table
CREATE TABLE medical_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    current_medication VARCHAR(50),
    previous_surgery VARCHAR(50),
    high_blood_pressure VARCHAR(50),
    allergies VARCHAR(50),
    diabetes VARCHAR(15),
    other_critical_desease VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

--  7: Staff Table
CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    role CHAR(30)  NOT NULL,
    department_id INT,
    email VARCHAR(100),
    employment_category VARCHAR(45) NOT NULL,
    shift INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (shift) REFERENCES shifts(shift_id)
);
-- 8: Appointments table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME,
    appointment_status CHAR(20) NOT NULL,
    type CHAR(15) NOT NULL,
    reason TEXT, 
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES staff(staff_id)
);

--  9: Prescriptions Table
CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    date DATE NOT NULL,
    diagnosis INT,
    lab_test VARCHAR(100),
    medications INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES staff(staff_id),
    FOREIGN KEY (diagnosis) REFERENCES diagnosis(diagnosis_id),
    FOREIGN KEY (medications) REFERENCES medications(medication_id)
);

-- 10: Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT,
    username VARCHAR(50) UNIQUE,
    password_hash TEXT,
    role VARCHAR(50),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

-- 11: Billing Table
CREATE TABLE billing (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    date_issued DATETIME,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- 12: Rooms Table
CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) NOT NULL,
    capacity INT,
    occupancy VARCHAR(50) NOT NULL,
    availability VARCHAR(15) 
);

--  13: Admissions Table
CREATE TABLE admissions (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    room_id INT NOT NULL,
    admit_date DATETIME NOT NULL, 
    discharge_date DATETIME,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- 14: Visits Table
CREATE TABLE visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    date DATETIME NOT NULL,
    visitor_idcard VARCHAR(15) NOT NULL,
    visitor_name VARCHAR(50) NOT NULL,
    entry_time DATETIME,
    leave_time DATETIME,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

/* Create sample data */
USE hospital_mgmt;

INSERT INTO departments (name, location) VALUES
('Cardiology', '2nd Floor'), ('Neurology', '3rd Floor'),('Laboratory', '1rst Floor'), ('Administration', '3rd Floor'),
('Pediatric', '2nd Floor'), ('Gynecology', '3rd Floor'),('Neurology', '2nd Floor'), ('Imagery', '3rd Floor'),
('Emergency', '1rst Floor'), ('Labor', '3rd Floor');

INSERT INTO patients (first_name, last_name, DOB, gender, phone, addressLine, postalCode, city, country) VALUES
('John', 'Doe', '1990-04-15', 'M', '613-663-5523', '123 Main St', 'H1N 2G2', 'Sudbury', 'Canada'),
('Jane', 'Roe', '1985-09-30', 'F', '613-663-5053', '456 Oak St', 'Q1N 2J3', 'Sudbury', 'Canada'),
('Patrice', 'Gilmore', '1990-04-15', 'M', '434-603-5123', '235 Patrol Rd', 'P1M 6G8', 'Sudbury', 'Canada'),
('Tamika', 'Haley', '2020-09-30', 'M', '', '123 Rich St', 'K2N 2K4', 'Ottawa', 'Canada');

INSERT INTO rooms (room_number, capacity, occupancy, availability) VALUES
('201', 1, 'occupied', 'no'),
('200', 5, 'occupied', 'no'),
('R01', 0, 'occupied', 'no'),
('310', 1, 'free', 'yes'),
('305', 2, 'free', 'yes');

INSERT INTO shifts (shift_date, start_time, end_time, shift_type) VALUES
('2025-09-15', '05:00:00', '13:00:00', 'Morning'),
('2025-09-15', '13:00:00', '21:00:00', 'Afternoon'),
('2025-09-15', '21:00:00', '05:00:00', 'Night'),
('2025-09-16', '05:00:00', '13:00:00', 'Morning'),
('2025-09-16', '13:00:00', '21:00:00', 'Afternoon'),
('2025-09-16', '21:00:00', '05:00:00', 'Night');

INSERT INTO staff (first_name, last_name, role, department_id, email, employment_category, shift) VALUES
('Alice', 'Smith', 'Doctor', 1, 'alice.smith@hospital.org', 'full-time', 1),
('Ali', 'Samsung', 'Doctor', 5, 'ali.samsung@hospital.org', 'part-time', 1),
('Sarah', 'Kelly', 'Accountant', 4, 'sarah.kelly@hospital.org', 'full-time', 2),
('Michel', 'Tsar', 'Lab Technician', 3, 'michel.tsar@hospital.org', 'full-time', 3),
('Lauren', 'Abbott', 'Receptionist', 4, 'lauren.abbott@hospital.org', 'full-time', 3),
('Dena', 'Braun', 'Receptionist', 4, 'dena.braun@hospital.org', 'full-time', 4),
('Casey', 'Carrillo', 'Nurse', 9, 'casey.carrillo@hospital.org', 'full-time', 4),
('Bob', 'Jones', 'Nurse', 9, 'bob.jones@hospital.org', 'full-time', 5);

INSERT INTO admissions (patient_id, room_id, admit_date, discharge_date) VALUES
(1, 1,  '2025-08-10 10:00:00', '2025-08-13 09:00:00'),
(2, 1,  '2025-08-15 12:00:00', '2025-08-17 18:00:00'),
(4, 4,  '2025-09-01 10:00:00', '2025-09-04 09:00:00'),
(3, 2,  '2025-05-10 08:00:00', '2025-05-15 09:00:00');

INSERT INTO medical_history (patient_id, current_medication, previous_surgery, high_blood_pressure, allergies, diabetes,other_critical_desease) VALUES
(1, '', 'no','no', 'Sea food', 'no','Hypertension'),
(2, '', 'no','no', 'Peanut', 'no', 'Migraine'),
(3, 'Insulin', 'no','no', 'yes', 'yes', 'Migraine'),
(4, '', 'no','no', 'no', 'no', 'no');

INSERT INTO medications (name, dosage) VALUES
('Amoxicillin', '500mg x 3'),
('Ibuprofen', '200mg every 6 hours'),
('Metformin', '500mg x 3'),
('Thiazolidinediones', '200mg every 6 hours'),
('Phenylephrine (Sudafed PE)', '1 spray x 3'),
('Tylenol', '500mg x 3');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_status, type, reason) VALUES
(1, 1, '2025-08-25 10:00:00', 'Confirmed', 'Follow-up', ''),
(3, 2, '2025-08-28 14:30:00', 'Confirmed', 'Follow-up', ''),
(4, 2, '2025-07-28 09:30:00', 'Attended', 'Consultation', 'Looking for a family doctor'),
(2, 2, '2025-09-28 14:30:00', 'Cancelled', 'Follow-up', ''),
(3, 1, '2025-07-25 14:30:00', 'Missed', 'Follow-up', ''),
(2, 2, '2025-08-28 11:30:00', 'Confirmed', 'Consultation', '');

INSERT INTO diagnosis (name) VALUES
('Fever'),
('Cough'),
('Congestive heart failure'),
('Measle'),
('Migraine'),
('Cancer');

INSERT INTO users (staff_id, username, password_hash, role) VALUES
(1, 'asmith', 'pass@042','doctor' ),
(1, 'asmith-admin', 'pass@042','basic-admin' ),
(2, 'asamsung', 'pass@043','doctor' ),
(3, 'skelly', 'pass@044','accounting' ),
(4, 'mtsar', 'pass@045','lab-technician' ),
(5, 'labbott', 'pass@046','reception' ),
(6, 'labbott-bl', 'pass@046','billing' ),
(7, 'dbraun', 'pass@047','reception' ),
(8, 'ccarrillo', 'pass@048','nurse' );

INSERT INTO billing (patient_id, total_amount, status, date_issued) VALUES
(1, 200.00, 'Paid', '2025-04-02 10:45:10'),
(1, 50.65, 'Paid', '2025-05-25 09:40:00'),
(2, 355.05, 'Paid', '2025-06-02 15:04:44'),
(4, 250.00, 'Pending', '2025-07-01 15:18:40'),
(3, 145.70, 'Draft', '2025-08-02 11:00:00'),
(2, 45.90, 'Issued', '2025-08-04 10:00:00');

INSERT INTO visits (patient_id, date, visitor_idcard, visitor_name, entry_time, leave_time) VALUES
(1, '2025-08-01', 'CND03925432', 'Ben Graig', '2025-08-01 11:00:00', ' 2025-08-01 11:30:00'),
(3, '2025-07-01', 'CND06729843', 'Alicia Blaj', '2025-07-01 15:36:00', '2025-07-01 16:07:00'),
(3, '2025-07-01', 'CND78544423', 'Jim Scott', '2025-07-01 16:36:00', '2025-07-01 17:01:00');

INSERT INTO prescriptions (patient_id, doctor_id, date, diagnosis, lab_test, medications) VALUES
(2, 2, '2025-04-02', 5, '-', 6),
(4, 1, '2025-05-20', 3, '-', 1),
(4, 1, '2025-05-20', 5, '-', 6),
(3, 2, '2025-07-12', 1, '-', 2);





