create schema cab_booking;

-- 1. Customers
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  phone VARCHAR(15),
  email VARCHAR(100),
  registration_date DATE
);

select * from customers;
desc customers;
INSERT INTO Customers (customer_id,name,phone,email,registration_date)
VALUES (1, 'Raj Singh', '9588120411', 'user1@mail.com', '2025-03-13'),
 (2, 'Karan Patel', '9338656268', 'user2@mail.com', '2025-06-29'),
 (3, 'Pooja Sharma', '9559756759', 'user3@mail.com', '2025-01-24'),
 (4, 'Raj Patel', '9360047439', 'user4@mail.com', '2025-02-06'),
 (5, 'Karan Sharma', '9247698352', 'user5@mail.com', '2025-04-30'),
 (6, 'Sunil Singh', '9392002887', 'user6@mail.com', '2025-03-19'),
 (7, 'Amit Singh', '9402977362', 'user7@mail.com', '2025-02-28'),
 (8, 'Anita Sharma', '9596149699', 'user8@mail.com', '2025-03-30'),
 (9, 'Pooja Kumar', '9642698322', 'user9@mail.com', '2025-02-11'),
 (10, 'Priya Sharma', '9322886637', 'user10@mail.com', '2025-07-07');


-- 2. Drivers
CREATE TABLE Drivers (
  driver_id INT PRIMARY KEY,
  name VARCHAR(100),
  license_number VARCHAR(50),
  rating DECIMAL(2,1)
);

select * from drivers;
truncate  drivers;

insert into drivers(driver_id,name,license_number,rating)
values(1, 'Pooja Bhosale', 'DL-338469', 2.6),
(2, 'Karan Mehta', 'DL-491120', 4.2),
(3, 'Divya Das', 'DL-477264', 3.8),
(4, 'Sunil Mehta', 'DL-784989', 3.7),
(5, 'Amit Mehta', 'DL-587959', 4.8),
(6, 'Ravi Mehta', 'DL-472413', 3.9),
(7, 'Ravi Das', 'DL-781918', 2.9),
(8, 'Ravi Das', 'DL-347542', 3.8),
(9, 'Pooja Verma', 'DL-840118', 3.9),
(10, 'Pooja Bhosale', 'DL-119676', 3.0);

-- 3. Cabs
CREATE TABLE Cabs (
  cab_id INT PRIMARY KEY,
  cab_type VARCHAR(20),
  model VARCHAR(50),
  number_plate VARCHAR(20),
  driver_id INT,
  FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

select * from cabs;

insert into cabs( cab_id,cab_type,model,number_plate,driver_id)
values(1, 'SUV', 'Toyota Innova', 'MH127804', 1),
(2, 'SUV', 'Honda City', 'MH126280', 2),
(3, 'Sedan', 'Hyundai Verna', 'MH126470', 3),
(4, 'Sedan', 'Toyota Innova', 'MH127677', 4),
(5, 'SUV', 'Maruti Dzire', 'MH121385', 5),
(6, 'Sedan', 'Toyota Innova', 'MH125529', 6),
(7, 'Sedan', 'Tata Nexon', 'MH127214', 7),
(8, 'SUV', 'Tata Nexon', 'MH121280', 8),
(9, 'Sedan', 'Maruti Dzire', 'MH129860', 9),
(10, 'SUV', 'Honda City', 'MH126034', 10);

-- 4. Bookings
CREATE TABLE Bookings (
  booking_id INT PRIMARY KEY,
  customer_id INT,
  cab_id INT,
  booking_time TIMESTAMP,
  status VARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (cab_id) REFERENCES Cabs(cab_id)
);

select * from bookings;

insert into bookings( booking_id,customer_id,cab_id,booking_time,status)
values(1, 1, 1, '2025-05-29 05:55:09', 'cancelled'),
(2, 2,2, '2025-05-21 03:43:21', 'cancelled'),
(3, 3,3, '2025-04-25 16:38:50', 'completed'),
(4, 4,4, '2025-07-05 16:04:59', 'cancelled'),
(5, 5 , 5, '2025-01-26 21:25:49', 'completed'),
(6, 9, 6, '2025-02-20 22:41:40', 'completed'),
(7, 4, 8, '2025-04-09 02:43:09', 'completed'),
(8, 3, 4, '2025-07-13 20:18:44', 'completed'),
(9, 9, 3, '2025-04-16 16:04:13', 'completed'),
(10, 7, 1, '2025-03-27 10:31:01', 'completed');

-- 5. TripDetails
CREATE TABLE TripDetails (
  trip_id INT PRIMARY KEY,
  booking_id INT UNIQUE,
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  distance_km DECIMAL(6,2),
  fare DECIMAL(8,2),
  pickup_location VARCHAR(100),
  dropoff_location VARCHAR(100),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

select * from tripdetails;

insert into tripdetails(trip_id, booking_id,start_time,  end_time,  distance_km,fare,  pickup_location,dropoff_location  )
values(3, 3, '2025-02-26 03:35:27', '2025-02-26 03:51:27', 11.24, 183.18, 'Baner', 'Airport'),
(5, 5, '2025-05-11 00:03:30', '2025-05-11 01:02:30', 20.95, 374.14, 'Baner', 'Hadapsar'),
(6, 6, '2025-04-12 05:06:38', '2025-04-12 06:35:38', 15.59, 216.82, 'Pune Station', 'Hadapsar'),
(7, 7, '2025-06-01 08:06:39', '2025-06-01 09:28:39', 19.15, 292.5, 'Kothrud', 'Baner'),
(8, 8, '2025-01-22 22:23:58', '2025-01-22 22:45:58', 15.87, 295.04, 'MG Road', 'Kothrud'),
(9, 4, '2025-03-14 08:01:42', '2025-03-14 09:28:42', 13.83, 224.74, 'Hadapsar', 'MG Road'),
(10, 1, '2025-05-30 02:07:34', '2025-05-30 02:35:34', 3.87, 43.63, 'Viman Nagar', 'Baner'),
(11, 9, '2025-03-21 09:48:38', '2025-03-21 10:41:38', 14.38, 176.04, 'Kothrud', 'Pune Station'),
(12, 2, '2025-04-20 12:41:07', '2025-04-20 14:10:07', 17.96, 309.83, 'Baner', 'Kothrud'),
(14, 10, '2025-01-24 16:31:26', '2025-01-24 17:51:26', 2.71, 35.7, 'Wakad', 'Hinjewadi');


-- 6. Feedback
CREATE TABLE Feedback (
  feedback_id INT PRIMARY KEY,
  booking_id INT UNIQUE,
  customer_rating DECIMAL(2,1),
  driver_rating DECIMAL(2,1),
  comments TEXT,
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

select * from feedback;

insert into feedback(feedback_id, booking_id, customer_rating,  driver_rating,  comments)
values(3, 3, 4.7, 2.8, 'Trip was cancelled'),
(5, 5, 2.8, 3.6, 'Trip was cancelled'),
(6, 6, 2.3, 1.9, 'Driver was friendly'),
(7, 7, 1.8, 2.9, 'Clean cab'),
(8, 8, 2.6, 3.6, 'Rude driver'),
(9, 9, 3.0, 1.4, 'Clean cab'),
(10, 10, 4.6, 4.0, 'Rude driver'),
(11, 4, 3.0, 3.4, 'Clean cab'),
 (12, 2, 1.5, 2.4, 'Driver was friendly'),
 (14, 1, 2.1, 3.8, 'Rude driver'); 
