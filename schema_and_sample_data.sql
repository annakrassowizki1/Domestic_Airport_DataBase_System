DROP TABLE FreqFlyer
DROP TABLE Payment
DROP TABLE Passenger
DROP TABLE Booking
DROP TABLE Flight
DROP TABLE Airplane
DROP TABLE Airport
DROP TABLE Route 


--Airplane Table
Create Table Airplane(
PlaneID INT Identity(1000,1) Primary Key,
Model varchar(50) not null,
Capacity int --this is a little detail because the largest commercial carrier can only carry 853 people :)
)

INSERT INTO Airplane (Model, Capacity)
VALUES 
    ('Boeing 737-800', 189),
    ('Airbus A320', 180),
    ('Boeing 777-300ER', 396),
    ('Airbus A380-800', 853),  
    ('Boeing 787-9 Dreamliner', 296),
    ('Boeing 747-400', 416),
    ('Airbus A350-900', 325),
    ('Boeing 737 MAX 9', 178),
    ('Airbus A321neo', 220),
    ('Embraer E195-E2', 146),
    ('Boeing 767-300ER', 269),
    ('Airbus A330-300', 277),
    ('Boeing 757-200', 200),
    ('Airbus A220-300', 160),
    ('Boeing 737-900ER', 215);


--Airport Table

Create Table Airport (
PortId Int IDENTITY(100,1) Primary Key,
PortName VarChar(50),
PortCode VarChar(3),
City VarChar(50),
State Varchar(50),
Country Varchar (100)
)

insert into Airport (PortName, PortCode, City, State, Country) values 
    ('San Diego International Airport', 'SAN', 'San Diego', 'California', 'USA'),
    ('Los Angeles International Airport', 'LAX', 'Los Angeles', 'California', 'USA'),
    ('John F. Kennedy International Airport', 'JFK', 'New York', 'New York', 'USA'),
    ('Hartsfield-Jackson Atlanta International', 'ATL', 'Atlanta', 'Georgia', 'USA'),
    ('O''Hare International Airport', 'ORD', 'Chicago', 'Illinois', 'USA'),
    ('Dallas/Fort Worth International', 'DFW', 'Dallas', 'Texas', 'USA'),
    ('Denver International Airport', 'DEN', 'Denver', 'Colorado', 'USA'),
    ('San Francisco International Airport', 'SFO', 'San Francisco', 'California', 'USA'),
    ('Seattle-Tacoma International Airport', 'SEA', 'Seattle', 'Washington', 'USA'),
    ('Miami International Airport', 'MIA', 'Miami', 'Florida', 'USA'),
    ('Phoenix Sky Harbor International', 'PHX', 'Phoenix', 'Arizona', 'USA'),
    ('Boston Logan International Airport', 'BOS', 'Boston', 'Massachusetts', 'USA'),
    ('Newark Liberty International Airport', 'EWR', 'Newark', 'New Jersey', 'USA'),
    ('Orlando International Airport', 'MCO', 'Orlando', 'Florida', 'USA'),
    ('Charlotte Douglas International', 'CLT', 'Charlotte', 'North Carolina', 'USA');

--Flight Table:
Create table Flight (
FlightID Int Identity(1000,1) Primary Key,
OriginAirportID int foreign key references Airport(PortId),
DestinationAirportID int foreign key references Airport(PortId),
AirplaneID int foreign key references Airplane(PlaneID),
DepartureTime DateTime,
ArrivalTime DateTime,
Status varchar(50) --"Scheduled", "Delayed", "Cancelled"
) ;

INSERT INTO Flight (OriginAirportID, DestinationAirportID, AirplaneID, DepartureTime, ArrivalTime, Status)
VALUES 
(100, 101, 1000, '2024-12-01 08:00:00', '2024-12-01 11:30:00', 'Scheduled'),
(101, 102, 1001, '2024-12-02 06:30:00', '2024-12-02 09:00:00', 'Delayed'),
(102, 104, 1002, '2024-12-02 12:00:00', '2024-12-02 15:20:00', 'Cancelled'),
(104, 100, 1003, '2024-12-03 19:45:00', '2024-12-03 22:10:00', 'Scheduled'),
(105, 106, 1004, '2024-12-03 14:00:00', '2024-12-03 18:30:00', 'Scheduled'),
(107, 108, 1005, '2024-12-04 07:15:00', '2024-12-04 10:45:00', 'Scheduled'),
(108, 109, 1006, '2024-12-04 16:30:00', '2024-12-04 21:00:00', 'Delayed'),
(110, 111, 1007, '2024-12-05 09:00:00', '2024-12-05 12:30:00', 'Scheduled'),
(111, 112, 1008, '2024-12-05 13:45:00', '2024-12-05 17:15:00', 'Scheduled'),
(112, 100, 1009, '2024-12-06 11:30:00', '2024-12-06 15:00:00', 'Cancelled'),
(100, 113, 1010, '2024-12-06 18:00:00', '2024-12-06 22:30:00', 'Scheduled'),
(113, 101, 1011, '2024-12-07 05:45:00', '2024-12-07 09:15:00', 'Scheduled'),
(101, 114, 1012, '2024-12-07 15:30:00', '2024-12-07 19:00:00', 'Delayed'),
(114, 104, 1013, '2024-12-08 08:30:00', '2024-12-08 12:00:00', 'Scheduled'),
(104, 107, 1014, '2024-12-08 19:15:00', '2024-12-08 23:45:00', 'Scheduled'),
(107, 110, 1000, '2024-12-09 06:00:00', '2024-12-09 09:30:00', 'Scheduled'),
(110, 100, 1001, '2024-12-09 14:45:00', '2024-12-09 18:15:00', 'Scheduled'),
(100, 108, 1002, '2024-12-10 10:30:00', '2024-12-10 14:00:00', 'Scheduled'),
(108, 112, 1003, '2024-12-10 20:00:00', '2024-12-11 00:30:00', 'Scheduled'),
(112, 105, 1004, '2024-12-11 12:15:00', '2024-12-11 15:45:00', 'Scheduled');

--Booking Table:

Create TABLE Booking(
BookingID Int Identity(10000,1) Primary Key,
FlightID Int Foreign Key references Flight(FlightID),
BookingDate DateTime,
SeatNumber VarChar(5),
FareClass Varchar (30), -- "Business", "Premium Economy" "Economy"
Status Varchar(30) -- "Checked-in","Cancelled","Confirmed"
)

Insert INTO Booking (FlightID, BookingDate, SeatNumber, FareClass, Status) 
Values
(1000, '2024-11-15 14:30:00', '12A', 'Business', 'Confirmed'),
(1000, '2024-11-16 09:20:00', '23C', 'Economy', 'Checked-in'),
(1001, '2024-11-20 11:45:00', '8F', 'Premium Economy', 'Confirmed'),
(1002, '2024-11-22 16:00:00', '45B', 'Economy', 'Cancelled'),
(1003, '2024-11-25 10:15:00', '1A', 'Business', 'Checked-in'),
(1004, '2024-11-26 08:30:00', '15D', 'Economy', 'Confirmed'),
(1005, '2024-11-27 13:45:00', '22B', 'Business', 'Confirmed'),
(1006, '2024-11-28 16:20:00', '31A', 'Economy', 'Checked-in'),
(1007, '2024-11-29 10:00:00', '5C', 'Premium Economy', 'Confirmed'),
(1008, '2024-11-30 14:15:00', '18E', 'Economy', 'Confirmed'),
(1009, '2024-12-01 07:45:00', '9B', 'Business', 'Cancelled'),
(1010, '2024-12-02 11:30:00', '27F', 'Economy', 'Confirmed'),
(1011, '2024-12-03 15:00:00', '14A', 'Premium Economy', 'Checked-in'),
(1012, '2024-12-04 09:15:00', '33D', 'Economy', 'Confirmed'),
(1013, '2024-12-05 12:45:00', '7B', 'Business', 'Confirmed'),
(1014, '2024-12-06 18:30:00', '20C', 'Economy', 'Checked-in'),
(1015, '2024-12-07 08:00:00', '11E', 'Premium Economy', 'Confirmed'),
(1016, '2024-12-08 13:20:00', '25A', 'Economy', 'Confirmed'),
(1017, '2024-12-09 16:45:00', '6F', 'Business', 'Confirmed'),
(1018, '2024-12-10 10:30:00', '19D', 'Economy', 'Checked-in');

--Passenger Table:

CREATE TABLE Passenger (
    PassengerID INT IDENTITY(10000,1) PRIMARY KEY,
    BookingID INT NOT NULL Foreign Key References Booking(BookingID),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    DateOfBirth DATE,
);

INSERT INTO Passenger (BookingID, FirstName, LastName, Phone, Email, DateOfBirth)
VALUES 
(10000, 'John', 'Doe', '555-1234', 'john@email.com', '1990-05-15'),
(10001, 'Sarah', 'Johnson', '555-2345', 'sarah.j@email.com', '1985-08-22'),
(10002, 'Michael', 'Chen', '555-3456', 'mchen@email.com', '1992-03-10'),
(10003, 'Emily', 'Williams', '555-4567', 'ewilliams@email.com', '1988-11-30'),
(10004, 'David', 'Martinez', '555-5678', 'dmartinez@email.com', '1995-07-18'),
(10005, 'Jennifer', 'Garcia', '555-6789', 'jgarcia@email.com', '1987-02-14'),
(10006, 'Robert', 'Anderson', '555-7890', 'randerson@email.com', '1993-09-25'),
(10007, 'Lisa', 'Taylor', '555-8901', 'ltaylor@email.com', '1991-06-08'),
(10008, 'James', 'Thomas', '555-9012', 'jthomas@email.com', '1989-12-03'),
(10009, 'Maria', 'Rodriguez', '555-0123', 'mrodriguez@email.com', '1994-04-17'),
(10010, 'William', 'Brown', '555-1357', 'wbrown@email.com', '1986-11-22'),
(10011, 'Patricia', 'Wilson', '555-2468', 'pwilson@email.com', '1992-07-30'),
(10012, 'Christopher', 'Lee', '555-3579', 'clee@email.com', '1990-01-11'),
(10013, 'Linda', 'Moore', '555-4680', 'lmoore@email.com', '1988-08-19'),
(10014, 'Daniel', 'Jackson', '555-5791', 'djackson@email.com', '1993-03-27'),
(10015, 'Barbara', 'White', '555-6802', 'bwhite@email.com', '1987-10-05'),
(10016, 'Matthew', 'Harris', '555-7913', 'mharris@email.com', '1991-05-14'),
(10017, 'Susan', 'Martin', '555-8024', 'smartin@email.com', '1989-12-23'),
(10018, 'Anthony', 'Thompson', '555-9135', 'athompson@email.com', '1994-06-09'),
(10019, 'Jessica', 'Clark', '555-0246', 'jclark@email.com', '1992-02-28');

--Frequent Flyer
Create Table FreqFlyer(
FFPassID INT PRIMARY KEY,
Tier Varchar(20),
MilesBalance Int,
JoinDate Date,
FOREIGN KEY (FFPassID) REFERENCES Passenger(PassengerID)
)

INSERT INTO FreqFlyer (FFPassID, Tier, MilesBalance, JoinDate)
VALUES
(10000, 'Gold', 75000, '2020-03-15'),
(10001, 'Platinum', 125000, '2019-06-22'),
(10002, 'Silver', 45000, '2021-09-10'),
(10004, 'Gold', 82000, '2020-11-18'),
(10006, 'Bronze', 15000, '2023-02-14'),
(10007, 'Silver', 52000, '2021-05-25'),
(10009, 'Platinum', 150000, '2018-12-03'),
(10011, 'Gold', 68000, '2020-07-30'),
(10013, 'Bronze', 22000, '2022-08-19'),
(10015, 'Silver', 48000, '2021-10-05');


--Payment Table:
Create Table Payment(
PaymentID Int Identity(1000,1) Primary Key,
BookingID int foreign key references Booking(BookingID),
Amount Decimal (10,2),
PaymentDate DateTime,
PaymentMethod Varchar(50), --Visa, Discover, MasterCard
TransactionStatus VarChar(30) -- I don't know what this would be yet
)


INSERT INTO Payment (BookingID, Amount, PaymentDate, PaymentMethod, TransactionStatus)
VALUES
(10000, 850.00, '2024-11-15 14:35:00', 'Visa', 'Completed'),
(10001, 320.50, '2024-11-16 09:25:00', 'MasterCard', 'Completed'),
(10002, 475.00, '2024-11-20 11:50:00', 'Discover', 'Completed'),
(10003, 280.00, '2024-11-22 16:05:00', 'Visa', 'Refunded'),
(10004, 1200.00, '2024-11-25 10:20:00', 'MasterCard', 'Completed'),
(10005, 395.75, '2024-11-26 08:35:00', 'Visa', 'Completed'),
(10006, 920.00, '2024-11-27 13:50:00', 'American Express', 'Completed'),
(10007, 410.50, '2024-11-28 16:25:00', 'MasterCard', 'Completed'),
(10008, 565.00, '2024-11-29 10:05:00', 'Discover', 'Completed'),
(10009, 340.25, '2024-11-30 14:20:00', 'Visa', 'Completed'),
(10010, 785.00, '2024-12-01 07:50:00', 'MasterCard', 'Pending'),
(10011, 495.50, '2024-12-02 11:35:00', 'Visa', 'Completed'),
(10012, 625.00, '2024-12-03 15:05:00', 'American Express', 'Completed'),
(10013, 380.75, '2024-12-04 09:20:00', 'Discover', 'Completed'),
(10014, 1050.00, '2024-12-05 12:50:00', 'MasterCard', 'Completed'),
(10015, 440.00, '2024-12-06 18:35:00', 'Visa', 'Completed'),
(10016, 515.25, '2024-12-07 08:05:00', 'American Express', 'Completed'),
(10017, 670.00, '2024-12-08 13:25:00', 'MasterCard', 'Completed'),
(10018, 890.50, '2024-12-09 16:50:00', 'Visa', 'Completed'),
(10019, 355.00, '2024-12-10 10:35:00', 'Discover', 'Completed');

--Route table:
CREATE TABLE Route (
    FlightID INT NOT NULL,
    OriginPortID   INT NOT NULL,
    DestPortID INT NOT NULL,
    PRIMARY KEY (FlightID, OriginPortID, DestPortID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID),
    FOREIGN KEY (OriginPortID)   REFERENCES Airport(PortID),
    FOREIGN KEY (DestPortID)   REFERENCES Airport(PortID)
);

-- Insert Origin Airport into Route
INSERT INTO Route (FlightID, OriginPortID, DestPortID)
SELECT FlightID, OriginAirportID, DestinationAirportID
FROM Flight;
