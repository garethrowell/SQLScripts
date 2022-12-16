USE HTLN_LandBirds;

SELECT P.LocationName AS Plot,  E.EventName AS Event, E.Temperature_C,  
    W.Code AS Wind, R.Code AS Precip, E.Clouds_pct AS Percent_Cloud, N.Code AS Noise, B.ObservationNumber, I.Name AS Interval, 
    S.TaxonCode AS AOUCode, B.Distance, D.Code AS DetectionType, X.Name AS Sex, 
	A.Name AS Age, B.FlockSize, B.IsPreviousPlot, B.IsFlyover, B.Comments

FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID
  JOIN LU.Noise AS N
    ON E.NoiseID = N.ID
  JOIN LU.Rain AS R
    ON E.RainID = R.ID
  JOIN LU.Wind AS W
	ON E.WindID = W.ID
  JOIN LU.Interval AS I
	ON B.IntervalID = I.ID
  JOIN LU.Sex AS X
    ON B.SexID = X.ID
  JOIN LU.DetectionType AS D
    ON B.DetectionTypeID = D.ID
  JOIN LU.Age AS A
    ON B.AgeID = A.ID

WHERE (E.EventDateTime > CAST('20180101' AS datetime))
AND ((P.LocationName = 'TAPR1') OR (P.LocationName = 'TAPR108') OR (P.LocationName = 'TAPR118') OR (P.LocationName = 'TAPR128') OR (P.LocationName = 'TAPR137')
   OR (P.LocationName = 'TAPR146') OR (P.LocationName = 'TAPR155') OR (P.LocationName = 'TAPR164') OR (P.LocationName = 'TAPR173') OR (P.LocationName = 'TAPR182')
   OR (P.LocationName = 'TAPR191') OR (P.LocationName = 'TAPR20') OR (P.LocationName = 'TAPR209') OR (P.LocationName = 'TAPR218') OR (P.LocationName = 'TAPR228')
   OR (P.LocationName = 'TAPR237') OR (P.LocationName = 'TAPR247') OR (P.LocationName = 'TAPR257') OR (P.LocationName = 'TAPR31') OR (P.LocationName = 'TAPR40')
   OR (P.LocationName = 'TAPR5') OR (P.LocationName = 'TAPR59') OR (P.LocationName = 'TAPR68') OR (P.LocationName = 'TAPR77') OR (P.LocationName = 'TAPR86')
   OR (P.LocationName = 'TAPR95')) 
ORDER BY P.LocationName,  E.EventName,  B.ObservationNumber;