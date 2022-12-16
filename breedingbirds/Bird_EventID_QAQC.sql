









USE HTLN_LandBirds;


SELECT P.Name AS PeriodID, P.StartDate AS StartDate, E.EventName As EventID, E.EventDateTime AS EventDateTime

FROM dbo.SamplingPeriod AS P

  JOIN dbo.BirdSamplingEvent AS E
  ON P.ID = E.SamplingPeriodID


ORDER BY P.Name, P.StartDate, E.EventName, E.EventDateTime;


