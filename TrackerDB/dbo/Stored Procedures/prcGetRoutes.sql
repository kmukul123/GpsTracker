CREATE PROCEDURE [dbo].[prcGetRoutes]
AS

SET NOCOUNT ON

CREATE TABLE #tempRoutes 
( 
    sessionID NVARCHAR(50) NULL, 
    userName NVARCHAR(50) NULL, 
    startTime DATETIME NULL,
	endTime DATETIME NULL 
)

-- get the distinct routes
INSERT #tempRoutes (sessionID, userName)
SELECT DISTINCT sessionID, userName
FROM gpslocations

-- get the route start times
UPDATE #tempRoutes
SET startTime = (SELECT MIN(gpsTime) FROM gpslocations gl
WHERE gl.sessionID = tr.sessionID
AND gl.userName = tr.userName)
FROM #tempRoutes tr

-- get the route end times
UPDATE #tempRoutes
SET endTime = (SELECT MAX(gpsTime) FROM gpslocations gl
WHERE gl.sessionID = tr.sessionID
AND gl.userName = tr.userName)
FROM #tempRoutes tr

-- format dates and then send it out as json

SELECT '{ "sessionID": "' + CAST(sessionID AS NVARCHAR(50)) 
+ '", "userName": "' + userName
+  '", "times": "(' + CONVERT(NVARCHAR(25), startTime, 100) 
+ ' - ' + CONVERT(NVARCHAR(25), endTime, 100) + ')" }' json
FROM #tempRoutes
ORDER BY startTime DESC

DROP TABLE #tempRoutes



