

USE HTLN_LandBirds




SELECT YEAR(E.EventDateTime) AS Year, SUBSTRING(P.LocationName,5,8) AS Plot,  S.TaxonCode AS AOUCode, COUNT(S.TaxonCode) AS Abundance
FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID
  JOIN LU.Interval AS I
	ON B.IntervalID = I.ID
  JOIN LU.Sex AS X
    ON B.SexID = X.ID
  JOIN LU.DetectionType AS D
    ON B.DetectionTypeID = D.ID
  JOIN LU.Age AS A
    ON B.AgeID = A.ID

WHERE (LEFT(P.LocationName,4) = 'GWCA') OR (LEFT(P.LocationName,4) = 'PERI') OR (LEFT(P.LocationName,4) = 'WICR') 

GROUP BY E.EventDateTime, P.LocationName,  S.TaxonCode
ORDER BY Year, Plot;
