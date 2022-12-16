


USE HTLN_LandBirds



SELECT  DISTINCT Left(E.EventName,4) AS Park, S.CommonName

FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID


ORDER BY Left(E.EventName,4)

