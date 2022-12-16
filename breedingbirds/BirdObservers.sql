


USE HTLN_LandBirds;


SELECT Left(E.EventName,4) + Right(E.EventName,15) AS EventName,  C.FirstName, C.LastName, C.Employer AS Unit
FROM dbo.BirdObserver AS B
JOIN dbo.Contact AS C
ON C.ID = B.ContactID
JOIN dbo.BirdSamplingEvent  AS E
ON B.BirdSamplingEventID = E.ID 
ORDER BY B.ID