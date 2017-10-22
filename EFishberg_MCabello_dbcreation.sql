CREATE DATABASE HotelDW;
GO

USE HotelDW;
GO

CREATE TABLE Hotels(
  HotelID bigint NOT NULL PRIMARY KEY,
  LocationName varchar(50) NOT NULL,
  Address varchar(50) NOT NULL,
  City varchar(50) NOT NULL,
  State varchar(50) NOT NULL);

CREATE TABLE Room(
  RoomID bigint NOT NULL PRIMARY KEY,
  HotelID bigint NOT NULL,
  RoomNumber varchar(50) NOT NULL,
  Rate varchar(50) NOT NULL);

CREATE TABLE Employee(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  HotelID bigint NOT NULL,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  JobTitle varchar(50) NOT NULL,
  HireDate DATE NOT NULL,
  Gender varchar(12) NOT NULL);

  CREATE TABLE Reservation(
  ReservationID bigint NOT NULL PRIMARY KEY,
  HotelID bigint NOT NULL,
  CustomerID bigint NOT NULL,
  RoomID bigint NOT NULL,
  CheckInDate DATE NOT NULL,
  CheckOutDate DATE NOT NULL,
  TotalPayment money NOT NULL,
  NumberOfGuests int NOT NULL);

  CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  BirthDate DATE NOT NULL,
  Gender varchar(10) NOT NULL,
  Email varchar(50) NOT NULL,
  CreditCardNumber varchar(50) NOT NULL,
  Phone varchar(50) NOT NULL);

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Hotels 
FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID);
GO

ALTER TABLE Room ADD CONSTRAINT FK_Room_Hotels 
FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID);
GO

ALTER TABLE Reservation ADD CONSTRAINT FK_Reservation_Hotels 
FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID);
GO

ALTER TABLE Reservation ADD CONSTRAINT FK_Reservation_Customer 
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);
GO


ALTER TABLE Room ADD CONSTRAINT FK_Room_Hotels 
FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID);
GO

INSERT INTO Hotels(HotelID, LocationName, Address, City, State) VALUES 
(1, 'Marriott Boston', '4 Hill Street', 'Boston', 'MA'),
(2, 'Marriott New York City', '6 Main Street', 'New York', 'NY'),
(3, 'Marriott Los Angeles', '8 Pine Street', 'Los Angeles', 'CA'),
(4, 'Marriott Chicago', '10 Maple Street', 'Chicago', 'IL'),
(5, 'Marriott Houston', '12 Cedar Street', 'Houston', 'TX'),
(6, 'Marriott Phoenix', '14 Elm Street', 'Phoenix', 'AZ'),
(7, 'Marriott Philadelphia', '16 View Street', 'Philadelphia', 'PA'),
(8, 'Marriott San Diego', '18 Washington Street', 'San Diego', 'CA'),
(9, 'Marriott Dallas', '20 Oak Street', 'Dallas', 'TX'),
(10, 'Marriott Miami', '22 Hill Street', 'Miami', 'FL');

INSERT INTO Room(RoomID, HotelID, RoomNumber, Rate) VALUES 
(1, 1, '101', '129.99'),
(2, 1, '102', '129.99'),
(3, 1, '103', '129.99'),
(4, 1, '104', '129.99'),
(5, 2, '101', '199.99'),
(6, 2, '102', '199.99'),
(7, 2, '103', '199.99'),
(8, 2, '104', '199.99'),
(9, 3, '101', '159.99'),
(10,3, '102', '159.99');

INSERT INTO Employee(EmployeeID, HotelID, FirstName, LastName, JobTitle, HireDate, Gender) VALUES 
(1, 1, 'John', 'Smith', 'Concierge', '2015-12-07', 'Male'),
(2, 1, 'Jack', 'Johnson', 'Manager', '2012-01-08', 'Male'),
(3, 1, 'Liam', 'Williams', 'Housekeeper', '2013-02-09', 'Male'),
(4, 1, 'Emma', 'Brown', 'Front Desk', '2016-03-09', 'Female'),
(5, 2, 'Maria', 'Smith', 'Concierge', '2017-04-10', 'Female'),
(6, 2, 'Alana', 'Johnson', 'Manager', '2011-05-11', 'Female'),
(7, 2, 'Nolan', 'Williams', 'Housekeeper', '2015-06-12', 'Male'),
(8, 2, 'Cody', 'Brown', 'Front Desk', '2016-07-13', 'Male'),
(9, 3, 'Joc', 'Smith', 'Concierge', '2014-08-14', 'Male'),
(10, 3, 'Clayton', 'Johnson', 'Manager', '2013-09-15', 'Male');

INSERT INTO Customer(CustomerID, FirstName, LastName, BirthDate, Gender, Email, CreditCardNumber, Phone) VALUES
(1, 'Justin', 'Smith', '1990-05-11', 'Male', 'jsmith@email.com', '6666-565656-01010', '555-555-5555'),
(2, 'Charlie', 'Barnes', '1979-06-12', 'Male', 'cbarnes@email.com', '7777-565656-01010', '111-111-1111'),
(3, 'Logan', 'Jones', '1989-07-13', 'Male', 'ljones@email.com', '8888-565656-01010', '222-222-2222'),
(4, 'Enrique', 'Miller', '1972-08-14', 'Male', 'emiller@email.com', '6688-565656-01010', '333-333-3333'),
(5, 'Austin', 'Davis', '1992-09-15', 'Male', 'adavis@email.com', '9999-565656-01010', '444-444-4444'),
(6, 'Lucy', 'Wilson', '1986-10-16', 'Male', 'lwilson@email.com', '1010-565656-01010', '656-656-6656'),
(7, 'Mary', 'Martinez', '1984-11-17', 'Male', 'mmartinez@email.com', '6758-565656-01010', '417-777-6574'),
(8, 'Elizabeth', 'Anderson', '1980-12-18', 'Male', 'eanderson@email.com', '3443-565656-01010', '123-456-7890'),
(9, 'Margaret', 'Taylor', '1975-01-19', 'Male', 'mtaylor@email.com', '6584-565656-01010', '554-555-6565'),
(10, 'Carol', 'Turner', '1960-02-20', 'Male', 'cturner@email.com', '9564-565656-01010', '908-110-2547');

ALTER TABLE Customer ALTER COLUMN Email varchar(50) NULL;
ALTER TABLE Customer ALTER COLUMN Phone varchar(50) NULL;

INSERT INTO Customer(CustomerID, FirstName, LastName, BirthDate, Gender, CreditCardNumber) VALUES
(11, 'Aaron', 'Judge', '1992-01-28', 'Male', '9444-533444-12121');

INSERT INTO Reservation(ReservationID, HotelID, CustomerID, RoomID, CheckInDate, CheckOutDate, TotalPayment, NumberOfGuests) VALUES
(1, 1, 1, 1, '2017-03-19', '2017-03-21', 259.98, 2),
(2, 1, 3, 1, '2017-05-20', '2017-05-27', 909.93, 1),
(3, 1, 5, 3, '2017-08-01', '2017-08-04', 389.97, 2),
(4, 1, 7, 4, '2017-11-05', '2017-11-06', 129.99, 3),
(5, 2, 9, 5, '2017-01-02', '2017-01-06', 799.96, 3),
(6, 2, 2, 7, '2017-02-04', '2017-02-09', 999.95, 2),
(7, 2, 1, 7, '2017-03-06', '2017-03-07', 199.99, 1),
(8, 2, 3, 6, '2017-03-08', '2017-03-11', 599.97, 3),
(9, 3, 10, 10, '2017-12-10', '2017-12-16', 959.94, 4),
(10, 3, 2, 9, '2017-09-12', '2017-09-15', 479.97, 1);

INSERT INTO Reservation(ReservationID, HotelID, CustomerID, RoomID, CheckInDate, CheckOutDate, TotalPayment, NumberOfGuests) VALUES
(11, 3, 11, 2, '2017-10-24', '2017-10-26', 319.98, 1);