


USE HTLN_LandBirds



SELECT EventName, Left(E.EventName,4) AS Park, S.Family, S.ScientificName, S.CommonName

FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID

ORDER BY EventName

