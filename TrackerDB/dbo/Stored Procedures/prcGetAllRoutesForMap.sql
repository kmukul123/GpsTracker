CREATE PROCEDURE [dbo].[prcGetAllRoutesForMap]
AS

SET NOCOUNT ON

SELECT  
'{ "latitude": "' + CAST(latitude AS NVARCHAR(15)) 
+ '", "longitude": "' + CAST(longitude AS NVARCHAR(15)) 
+ '", "speed": "' + CAST(speed AS NVARCHAR(4)) 
+ '", "direction": "' + CAST(direction AS NVARCHAR(3)) 
+ '", "distance": "' + CAST(distance AS NVARCHAR(5)) 
+ '", "locationMethod": "' + locationMethod
+ '", "gpsTime": "' + CONVERT(NVARCHAR(25), gpsTime, 100)
+ '", "phoneNumber": "' + phoneNumber
+ '", "userName": "' + userName
+ '", "sessionID": "' + sessionID
+ '", "accuracy": "' + CAST(accuracy AS NVARCHAR(4)) 
+ '", "eventType": "' + eventType
+ '", "extrainfo": "' + extraInfo + '" }' json
FROM (SELECT MAX(GPSLocationID) ID
      FROM gpslocations
      WHERE sessionID != '0'
      GROUP BY sessionID) AS MaxID
JOIN gpslocations ON gpslocations.GPSLocationID = MaxID.ID
ORDER BY gpsTime

