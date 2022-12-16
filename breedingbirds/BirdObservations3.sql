
USE HTLN_LandBirds




SELECT P.LocationName, E.EventName, E.EventDateTime, E.Temperature_C,  W.Code, R.Code, E.Clouds_pct, N.Code, E.Comment,  B.ObservationNumber, S.TaxonCode, 
    B.Distance, dbo.BirdSamplin.Name, X.Name, B.FlockSize, B.IsFlyover, B.Comments, B.DateCreated

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

WHERE E.EventDateTime > CAST('20150101' AS datetime)
ORDER BY E.PlotID DESC ;