create database banking_system;

CREATE TABLE bank_detail (
    bank_id INT PRIMARY KEY,
    bank_name VARCHAR(100),
    bank_branch VARCHAR(100),
    bank_address VARCHAR(200),
    bank_city VARCHAR(50),
    bank_state VARCHAR(50),
    bank_zipcode VARCHAR(10),
    bank_phone VARCHAR(15),
    bank_email VARCHAR(100),
    bank_manager VARCHAR(100)
);

CREATE TABLE cust_detail (
    cust_id INT PRIMARY KEY,
    bank_id INT,
    cust_name VARCHAR(100),
    cust_address VARCHAR(200),
    cust_city VARCHAR(50),
    cust_state VARCHAR(50),
    cust_zipcode VARCHAR(10),
    cust_phone VARCHAR(15),
    cust_email VARCHAR(100),
    cust_dob DATE,
    cust_ssn VARCHAR(20),
    FOREIGN KEY (bank_id) REFERENCES bank_detail(bank_id)
);



CREATE TABLE loan_detail (
    loan_id INT PRIMARY KEY,
    cust_id INT,
    loan_amount DECIMAL(15, 2),
    loan_type VARCHAR(50),
    loan_start_date DATE,
    loan_end_date DATE,
    loan_interest_rate DECIMAL(5, 2),
    loan_status VARCHAR(20),
    loan_payment_due DATE,
    loan_outstanding_amount DECIMAL(15, 2),
    FOREIGN KEY (cust_id) REFERENCES cust_detail(cust_id)
);

CREATE TABLE insurance_detail (
    insurance_id INT PRIMARY KEY,
    loan_id INT,
    cust_id INT,
    bank_id INT,
    insurance_type VARCHAR(50),
    insurance_amount DECIMAL(15, 2),
    insurance_start_date DATE,
    insurance_end_date DATE,
    insurance_premium DECIMAL(10, 2),
    insurance_status VARCHAR(20),
    FOREIGN KEY (loan_id) REFERENCES loan_detail(loan_id),
    FOREIGN KEY (cust_id) REFERENCES cust_detail(cust_id),
    FOREIGN KEY (bank_id) REFERENCES bank_detail(bank_id)
);

desc banking_system;

ALTER TABLE bank_detail
ADD CONSTRAINT unique_bank_name UNIQUE (bank_name);

ALTER TABLE cust_detail
ADD CONSTRAINT unique_cust_email UNIQUE (cust_email);

ALTER TABLE loan_detail
ADD CONSTRAINT unique_loan_type_cust UNIQUE (loan_type, cust_id);

ALTER TABLE insurance_detail
ADD CONSTRAINT unique_insurance_type_loan UNIQUE (insurance_type, loan_id);


select * from bank_detail;
select * from cust_detail;
select * from loan_detail;
select * from insurance_detail;

INSERT INTO bank_detail (bank_id, bank_name, bank_branch, bank_address, bank_city, bank_state, bank_zipcode, bank_phone, bank_email, bank_manager)
VALUES
(1, 'SBI', 'Branch 1', '123 Main St', 'CityX', 'StateY', '12345', '555-1234', 'contact@banka.com', 'Manager A'),
(2, 'AXIS', 'Branch 2', '456 Elm St', 'CityY', 'StateZ', '67890', '555-5678', 'contact@bankb.com', 'Manager B'),
(3, 'BSNL', 'Branch 3', '789 Oak St', 'CityZ', 'StateA', '54321', '555-4321', 'contact@bankc.com', 'Manager C'),
(4, 'Bank D', 'Branch 4', '321 Pine St', 'CityA', 'StateB', '98765', '555-8765', 'contact@bankd.com', 'Manager D'),
(5, 'Bank E', 'Branch 5', '654 Cedar St', 'CityB', 'StateC', '56789', '555-6789', 'contact@banke.com', 'Manager E'),
(6, 'Bank F', 'Branch 6', '987 Spruce St', 'CityC', 'StateD', '23456', '555-7890', 'contact@bankf.com', 'Manager F'),
(7, 'Bank G', 'Branch 7', '135 Maple St', 'CityD', 'StateE', '67812', '555-8901', 'contact@bankg.com', 'Manager G'),
(8, 'Bank H', 'Branch 8', '246 Birch St', 'CityE', 'StateF', '78923', '555-9012', 'contact@bankh.com', 'Manager H'),
(9, 'Bank I', 'Branch 9', '357 Ash St', 'CityF', 'StateG', '89034', '555-0123', 'contact@banki.com', 'Manager I'),
(10, 'Bank J', 'Branch 10', '468 Willow St', 'CityG', 'StateH', '90145', '555-1234', 'contact@bankj.com', 'Manager J'),
(11, 'Bank K', 'Branch 11', '579 Poplar St', 'CityH', 'StateI', '01256', '555-2345', 'contact@bankk.com', 'Manager K'),
(12, 'Bank L', 'Branch 12', '680 Palm St', 'CityI', 'StateJ', '12367', '555-3456', 'contact@bankl.com', 'Manager L'),
(13, 'Bank M', 'Branch 13', '791 Fir St', 'CityJ', 'StateK', '23478', '555-4567', 'contact@bankm.com', 'Manager M'),
(14, 'Bank N', 'Branch 14', '902 Cedar St', 'CityK', 'StateL', '34589', '555-5678', 'contact@bankn.com', 'Manager N'),
(15, 'Bank O', 'Branch 15', '013 Elm St', 'CityL', 'StateM', '45690', '555-6789', 'contact@banko.com', 'Manager O');
select * from bank_detail;

INSERT INTO cust_detail (cust_id, bank_id, cust_name, cust_address, cust_city, cust_state, cust_zipcode, cust_phone, cust_email, cust_dob, cust_ssn)
VALUES
(1, 1, 'John Doe', '789 Oak St', 'CityX', 'StateY', '12345', '555-7890', 'john.doe@example.com', '1980-01-01', 'SSN123456789'),
(2, 2, 'Jane Smith', '321 Pine St', 'CityY', 'StateZ', '67890', '555-4321', 'jane.smith@example.com', '1985-02-02', 'SSN987654321'),
(3, 3, 'Bob Johnson', '654 Cedar St', 'CityZ', 'StateA', '54321', '555-6543', 'bob.johnson@example.com', '1975-03-03', 'SSN123123123'),
(4, 4, 'Alice Brown', '987 Spruce St', 'CityA', 'StateB', '98765', '555-8765', 'alice.brown@example.com', '1990-04-04', 'SSN987987987'),
(5, 5, 'Charlie Davis', '135 Maple St', 'CityB', 'StateC', '56789', '555-6789', 'charlie.davis@example.com', '1983-05-05', 'SSN456456456'),
(6, 6, 'Diana Evans', '246 Birch St', 'CityC', 'StateD', '23456', '555-7890', 'diana.evans@example.com', '1988-06-06', 'SSN789789789'),
(7, 7, 'Frank Green', '357 Ash St', 'CityD', 'StateE', '67812', '555-8901', 'frank.green@example.com', '1979-07-07', 'SSN654654654'),
(8, 8, 'Grace Harris', '468 Willow St', 'CityE', 'StateF', '78923', '555-9012', 'grace.harris@example.com', '1992-08-08', 'SSN321321321'),
(9, 9, 'Henry Clark', '579 Poplar St', 'CityF', 'StateG', '89034', '555-0123', 'henry.clark@example.com', '1977-09-09', 'SSN987654321'),
(10, 10, 'Ivy Lewis', '680 Palm St', 'CityG', 'StateH', '90145', '555-1234', 'ivy.lewis@example.com', '1995-10-10', 'SSN123987654'),
(11, 11, 'Jack Walker', '791 Fir St', 'CityH', 'StateI', '01256', '555-2345', 'jack.walker@example.com', '1981-11-11', 'SSN654987321'),
(12, 12, 'Karen Young', '902 Cedar St', 'CityI', 'StateJ', '12367', '555-3456', 'karen.young@example.com', '1993-12-12', 'SSN987321654'),
(13, 13, 'Leo Adams', '013 Elm St', 'CityJ', 'StateK', '23478', '555-4567', 'leo.adams@example.com', '1986-01-13', 'SSN321654987'),
(14, 14, 'Mia Wright', '124 Maple St', 'CityK', 'StateL', '34589', '555-5678', 'mia.wright@example.com', '1991-02-14', 'SSN654123789'),
(15, 15, 'Nate Hill', '235 Oak St', 'CityL', 'StateM', '45690', '555-6789', 'nate.hill@example.com', '1984-03-15', 'SSN321789654');
select * from cust_detail;

INSERT INTO loan_detail (loan_id, cust_id, loan_amount, loan_type, loan_start_date, loan_end_date, loan_interest_rate, loan_status, loan_payment_due, loan_outstanding_amount)
VALUES
(1, 1, 10000.00, 'Home Loan', '2023-01-01', '2033-01-01', 5.5, 'Active', '2024-01-01', 9500.00),
(2, 2, 15000.00, 'Car Loan', '2023-06-01', '2028-06-01', 3.8, 'Active', '2024-06-01', 14500.00),
(3, 3, 20000.00, 'Personal Loan', '2022-03-01', '2027-03-01', 4.2, 'Active', '2024-03-01', 18000.00),
(4, 4, 25000.00, 'Home Loan', '2021-07-01', '2031-07-01', 5.0, 'Active', '2024-07-01', 23000.00),
(5, 5, 12000.00, 'Car Loan', '2023-02-01', '2028-02-01', 3.6, 'Active', '2024-02-01', 11500.00),
(6, 6, 17000.00, 'Personal Loan', '2022-05-01', '2027-05-01', 4.5, 'Active', '2024-05-01', 16000.00),
(7, 7, 18000.00, 'Home Loan', '2020-11-01', '2030-11-01', 5.3, 'Active', '2024-11-01', 17000.00),
(8, 8, 14000.00, 'Car Loan', '2023-08-01', '2028-08-01', 3.7, 'Active', '2024-08-01', 13000.00),
(9, 9, 22000.00, 'Personal Loan', '2021-04-01', '2026-04-01', 4.0, 'Active', '2024-04-01', 20000.00),
(10, 10, 16000.00, 'Home Loan', '2019-12-01', '2029-12-01', 5.6, 'Active', '2024-12-01', 15000.00),
(11, 11, 13000.00, 'Car Loan', '2022-09-01', '2027-09-01', 3.9, 'Active', '2024-09-01', 12500.00),
(12, 12, 21000.00, 'Personal Loan', '2020-06-01', '2025-06-01', 4.3, 'Active', '2024-06-01', 19000.00),
(13, 13, 19000.00, 'Home Loan', '2018-10-01', '2028-10-01', 5.4, 'Active', '2024-10-01', 18000.00),
(14, 14, 23000.00, 'Car Loan', '2021-01-01', '2026-01-01', 3.5, 'Active', '2024-01-01', 22000.00),
(15, 15, 17000.00, 'Personal Loan', '2022-07-01', '2027-07-01', 4.6, 'Active', '2024-07-01', 16000.00);
select * from loan_detail;

INSERT INTO insurance_detail (insurance_id, loan_id, cust_id, bank_id, insurance_type, insurance_amount, insurance_start_date, insurance_end_date, insurance_premium, insurance_status)
VALUES
(1, 1, 1, 1, 'Home Insurance', 100000.00, '2023-01-01', '2033-01-01', 500.00, 'Active'),
(2, 2, 2, 2, 'Car Insurance', 15000.00, '2023-06-01', '2028-06-01', 300.00, 'Active'),
(3, 3, 3, 3, 'Personal Insurance', 20000.00, '2022-03-01', '2027-03-01', 350.00, 'Active'),
(4, 4, 4, 4, 'Home Insurance', 250000.00, '2021-07-01', '2031-07-01', 700.00, 'Active'),
(5, 5, 5, 5, 'Car Insurance', 12000.00, '2023-02-01', '2028-02-01', 250.00, 'Active'),
(6, 6, 6, 6, 'Personal Insurance', 17000.00, '2022-05-01', '2027-05-01', 400.00, 'Active'),
(7, 7, 7, 7, 'Home Insurance', 180000.00, '2020-11-01', '2030-11-01', 600.00, 'Active'),
(8, 8, 8, 8, 'Car Insurance', 14000.00, '2023-08-01', '2028-08-01', 300.00, 'Active'),
(9, 9, 9, 9, 'Personal Insurance', 22000.00, '2021-04-01', '2026-04-01', 500.00, 'Active'),
(10, 10, 10, 10, 'Home Insurance', 160000.00, '2019-12-01', '2029-12-01', 550.00, 'Active'),
(11, 11, 11, 11, 'Car Insurance', 13000.00, '2022-09-01', '2027-09-01', 280.00, 'Active'),
(12, 12, 12, 12, 'Personal Insurance', 21000.00, '2020-06-01', '2025-06-01', 450.00, 'Active'),
(13, 13, 13, 13, 'Home Insurance', 190000.00, '2018-10-01', '2028-10-01', 650.00, 'Active'),
(14, 14, 14, 14, 'Car Insurance', 23000.00, '2021-01-01', '2026-01-01', 320.00, 'Active'),
(15, 15, 15, 15, 'Personal Insurance', 17000.00, '2022-07-01', '2027-07-01', 380.00, 'Active');
select * from insurance_detail;

ALTER TABLE insurance_detail
ADD CONSTRAINT unique_loan_cust_bank UNIQUE (loan_id, cust_id, bank_id);


