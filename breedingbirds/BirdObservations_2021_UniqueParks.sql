USE HTLN_LandBirds;

SELECT DISTINCT P.LocationName AS Plot --,  E.EventName AS Event 


FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID

WHERE (E.EventDateTime > '20210101')
ORDER BY P.LocationName


