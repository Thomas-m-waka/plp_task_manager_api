-- Clinic Booking System Database

-- Drop tables if they already exist (to reset)
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Departments;

-- =============================
-- Table: Departments
-- =============================
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- =============================
-- Table: Doctors
-- =============================
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
        ON DELETE CASCADE
);

-- =============================
-- Table: Patients
-- =============================
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) NOT NULL
);

-- =============================
-- Table: Appointments
-- =============================
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
        ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
        ON DELETE CASCADE
);

-- =============================
-- Table: Payments
-- =============================
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method ENUM('Cash', 'Card', 'M-Pesa') NOT NULL,
    payment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
        ON DELETE CASCADE
);

-- =============================
-- Insert Sample Data
-- =============================

-- Departments
INSERT INTO Departments (name, description) VALUES
('General Medicine', 'General healthcare and diagnosis'),
('Pediatrics', 'Healthcare for children'),
('Cardiology', 'Heart and blood vessel care');

-- Doctors
INSERT INTO Doctors (full_name, email, phone, department_id) VALUES
('Dr. Alice Karemi', 'alice.karemi@clinic.com', '0712345678', 1),
('Dr. Brian Otieno', 'brian.otieno@clinic.com', '0723456789', 2),
('Dr. Carol Wanjiku', 'carol.wanjiku@clinic.com', '0734567890', 3);

-- Patients
INSERT INTO Patients (full_name, date_of_birth, email, phone) VALUES
('James Mwangi', '1990-05-21', 'james.mwangi@example.com', '0700000001'),
('Faith Muthoni', '2001-09-12', 'faith.muthoni@example.com', '0700000002');

-- Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, notes) VALUES
(1, 1, '2025-05-01 10:00:00', 'Scheduled', 'General checkup'),
(2, 2, '2025-05-02 11:30:00', 'Completed', 'Routine vaccination');

-- Payments
INSERT INTO Payments (appointment_id, amount, payment_method) VALUES
(2, 1500.00, 'M-Pesa');
