
USE HTLN_LandBirds




SELECT P.LocationName, E.EventName, E.EventDateTime, E.NoiseID, E.WindID, E.RainID, E. Clouds_pct, E.Temperature_C, E.Comment, S.CommonName, 
  B.IntervalID, B.SexID, B.SexID, B.AgeID, B.DetectionTypeID, B.Distance
FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID
WHERE E.EventDateTime > CAST('20150101' AS datetime)
ORDER BY E.PlotID DESC ;