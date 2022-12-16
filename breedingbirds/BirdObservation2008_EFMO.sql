







USE HTLN_LandBirds;


SELECT P.LocationName AS PlotID

FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID
  

WHERE (E.EventDateTime < CAST('20100101' AS datetime))  AND 
     ((LEFT(P.LocationName,4) = 'EFMO')) 
 
ORDER BY P.LocationName,  E.EventName,  B.ObservationNumber;
