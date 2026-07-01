#Total completed segmented bookings per fareclass. Used to track flight class distinction in end of quarter review
SELECT 
    FareClass,
    COUNT(BookingID) as TotalBookings
FROM Booking
WHERE Status != 'Cancelled'
GROUP BY FareClass
ORDER BY TotalBookings DESC;

#track Overall Flight Departures: Reports overall amount of flights leaving from a specific airport for internal and external use

SELECT 
    PortName,
    PortCode,
    City,
    COUNT(F.FlightID) as DepartingFlights
FROM Airport as A
JOIN Flight F ON A.PortId = F.OriginAirportID
GROUP BY A.PortName, A.PortCode, A.City
ORDER BY DepartingFlights DESC;


#Find average completed ticket price month to month: Used to track price fluctuation for up-to-date repricing depending on demand.
SELECT 
    YEAR(B.BookingDate) as Year, MONTH(B.BookingDate) as Month, COUNT(B.BookingID) as TotalBookings, AVG(P.Amount) as AvgTicketPrice, MIN(P.Amount) as LowestPrice, MAX(P.Amount) as HighestPrice
FROM Booking as B
JOIN Payment as P 
ON B.BookingID = P.BookingID
WHERE P.TransactionStatus = 'Completed'
GROUP BY YEAR(B.BookingDate), MONTH(B.BookingDate), DATENAME(MONTH, B.BookingDate)
ORDER BY Year, Month;

#Lists all cancelled flights with route information: Used to track cancelled status flights internally and shared with external bodies

SELECT 
    F.FlightID,
    Origin.PortCode as OriginCode,
    Origin.City as OriginCity,
    Dest.PortCode as DestinationCode,
    Dest.City as DestinationCity,
    F.DepartureTime
FROM Flight F
JOIN Airport Origin ON F.OriginAirportID = Origin.PortId
JOIN Airport Dest ON F.DestinationAirportID = Dest.PortId
LEFT JOIN Booking B ON F.FlightID = B.FlightID
WHERE F.Status = 'Cancelled'
ORDER BY F.DepartureTime;


