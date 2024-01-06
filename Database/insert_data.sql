-- Department Insert --
INSERT INTO department (Name)
VALUES ("Finance"), ("Surgery"), ("Oncology"), ("GI");

-- Specialty Insert --
INSERT INTO specialty (specialty)
VALUES ("Neurosurgery"), ("Cardiothoracic Surgery"), ("Pancreatic Cancer"), ("Microbiome");

-- Accountant Insert --
INSERT INTO accountant (SSN, FirstName, LastName, Salary, idDepartment)
VALUES (000000000, "Accountant", "Man", "1", 1);

-- Doctor Insert --
INSERT INTO doctor (SSN, FirstName, LastName, Salary, idDepartment, idSpecialty)
VALUES (000000001, "John", "Smith", 100000, 2, 1), (000000002, "Emma", "Watson", 100001, 2, 1), (000000003, "Edward", "Stark", 99999, 2, 2), (000000004, "Alex", "Dean", 80000, 3, 3), (000000005, "Melanie", "Mills", 130000, 4, 4);

INSERT INTO medication (name, company)
VALUES ("Valium", "BigPharma"), ("Oxycontin", "BigPharma"), ("Tylenol", "SmallPharma"), ("TLC", "Mom's Love");

INSERT INTO patient (FirstName, LastName, Insurance, SSN, Address)
VALUES ("Brendan", "Foley", 1, 000000006, "JHH East Baltimore"), ("Everett", "Vacek", 1, 000000007, "Somewhere"), ("Alex", "Nguyen", 0, 000000008, "There"), ("Lewis", "Hamilton", 1, NULL, "London, UK"), ("Nicholas", "Latifi", 0, NULL, "Not F1");

INSERT INTO room (Floor, Number)
VALUES (1, 101), (2, 202), (10, 1099);

INSERT INTO referencetype (type)
VALUES ("GI"), ("X-ray"), ("MRI");

INSERT INTO bed (idBed, Room_Floor, Room_Number)
VALUES (1, 1, 101), (2, 1, 101), (1, 2, 202), (2, 2, 202), (3, 2, 202), (1, 10, 1099);

INSERT INTO nurse (SSN, FirstName, LastName, Salary, idDepartment, Room_Floor, Room_Number)
VALUES (000000009, "Jenny", "From The Block", 70000, 1, 1, 101), (000000010, "Honey", "Badger", 80000, 2, 2, 202), (000000011, "Max", "Verstappen", 100000, 3, 10, 1099);

INSERT INTO reference (Name, Address, idDoctor, idPatient, idReferenceType, date)
VALUES ("Johns Hopkins Radiology", "10 Baltimore St.", 000000001, 1, 1, '2022-11-19');

INSERT INTO prescription (idDoctor, idPatient, idMedication, price, numdoses, date)
VALUES (000000002, 1, 1, 10.00, 100, '2021-11-18'), (000000002, 1, 1, 10.00, 100, '2022-11-18'), (000000001, 2, 2, 1.00, 5, '2022-11-1');

INSERT INTO visit (idPatient, start_date, end_date, idBed, Bed_Room_Floor, Bed_Room_Number)
VALUES (000000006, '2022-11-19', NULL, 1, 1, 101), (000000007, '2021-11-10', '2021-11-20', 1, 1, 101), (000000008, '2022-10-31', '2022-10-31', 2, 2, 202), (000000008, '2022-10-31', '2022-10-31', 2, 2, 202);

INSERT INTO visit_has_doctor (idVisit, idDoctor)
VALUES (1, 1), (2, 2), (3, 3), (4, 4)