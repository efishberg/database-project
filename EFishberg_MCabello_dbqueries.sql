USE HotelDW;
GO

/* 1. Multiple SELECT * queries to display all the records from each table. (Suppose the database has 4 tables, you should create 4 queries for
this requirement.)*/

SELECT * FROM Reservation;
SELECT * FROM Hotels;
SELECT * FROM Room;
SELECT * FROM Employee;
SELECT * FROM Customer;

/* 2. A query that uses aggregate function.

Find all the sales processed in the Boston Hotel */
SELECT H.LocationName, H.City, SUM(TotalPayment) AS 'Total Payment Amount'
FROM Hotels AS H
JOIN Reservation AS R
ON H.HotelID=R.HotelID
WHERE H.City = 'Boston'
GROUP BY H.LocationName, H.City;


/* 3. A query that selects records from two (or multiple) tables using INNER JOIN.

Find the reservations whose total ammount exceeded $350 */
SELECT r.ReservationID, c.FirstName, c.LastName, r.TotalPayment
FROM Reservation AS r
INNER JOIN Customer AS c
ON r.CustomerID=c.CustomerID
WHERE TotalPayment > 350; 


/* 4. A query that selects records from two (or multiple) tables using LEFT OUTER JOIN (or RIGHT OUTER JOIN or FULL OUTER JOIN). Specify why outer
join is neccesary in comment block. Make sure your fake data could reflect the necessary. If it could not, you need to go back to part 2 to redo
the data insertion, or you can use INSERT INTO, UPDATE or DELETE statements to modify the existing data.

Find email, phone number, and total amount spend on hotels per customer

FULL OUTER JOIN was neccesary in this query because without it, the customers who have been entered into the database but have not stayed in the 
hotel yet do not appear*/
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone, SUM(r.TotalPayment) AS 'Total Amount Spent at Hotel'
FROM Customer as c
FULL OUTER JOIN Reservation AS r
ON r.CustomerID=c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone;


/* 5. A query that uses subquery.

Show the reservation ID of those orders in the year 2017 of which the total payment is greater than the average total due of all the
orders of the same year*/
SELECT c.CustomerID, c.FirstName, c.LastName, r.ReservationID, r.CheckOutDate
FROM Reservation AS r
JOIN Customer AS c
ON r.CustomerID=c.CustomerID
WHERE YEAR(CheckOutDate) = '2017'
AND TotalPayment > (Select AVG(n.TotalPayment)
						FROM Reservation AS n
						WHERE YEAR(CheckOutDate) = '2017');