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
('Alice', 'Smith', 'Doctor', 1, 'alice.smith@hospital.org', 'full-time', 19),
('Ali', 'Samsung', 'Doctor', 5, 'ali.samsung@hospital.org', 'part-time', 19),
('Sarah', 'Kelly', 'Accountant', 4, 'sarah.kelly@hospital.org', 'full-time', 20),
('Michel', 'Tsar', 'Lab Technician', 3, 'michel.tsar@hospital.org', 'full-time', 21),
('Lauren', 'Abbott', 'Receptionist', 4, 'lauren.abbott@hospital.org', 'full-time', 21),
('Dena', 'Braun', 'Receptionist', 4, 'dena.braun@hospital.org', 'full-time', 22),
('Casey', 'Carrillo', 'Nurse', 9, 'casey.carrillo@hospital.org', 'full-time', 22),
('Bob', 'Jones', 'Nurse', 9, 'bob.jones@hospital.org', 'full-time', 24);

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
(1, 42, '2025-08-25 10:00:00', 'Confirmed', 'Follow-up', ''),
(3, 43, '2025-08-28 14:30:00', 'Confirmed', 'Follow-up', ''),
(4, 43, '2025-07-28 09:30:00', 'Attended', 'Consultation', 'Looking for a family doctor'),
(2, 43, '2025-09-28 14:30:00', 'Cancelled', 'Follow-up', ''),
(3, 42, '2025-07-25 14:30:00', 'Missed', 'Follow-up', ''),
(2, 43, '2025-08-28 11:30:00', 'Confirmed', 'Consultation', '');

INSERT INTO diagnosis (name) VALUES
('Fever'),
('Cough'),
('Congestive heart failure'),
('Measle'),
('Migraine'),
('Cancer');

INSERT INTO users (staff_id, username, password_hash, role) VALUES
(42, 'asmith', 'pass@042','doctor' ),
(42, 'asmith-admin', 'pass@042','basic-admin' ),
(43, 'asamsung', 'pass@043','doctor' ),
(44, 'skelly', 'pass@044','accounting' ),
(45, 'mtsar', 'pass@045','lab-technician' ),
(46, 'labbott', 'pass@046','reception' ),
(46, 'labbott-bl', 'pass@046','billing' ),
(47, 'dbraun', 'pass@047','reception' ),
(48, 'ccarrillo', 'pass@048','nurse' );

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
(2, 43, '2025-04-02', 11, '-', 6),
(4, 42, '2025-05-20', 7, '-', 1),
(4, 42, '2025-05-20', 8, '-', 6),
(3, 43, '2025-07-12', 7, '-', 2);





