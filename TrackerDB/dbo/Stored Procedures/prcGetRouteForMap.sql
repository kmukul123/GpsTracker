CREATE PROCEDURE [dbo].[prcGetRouteForMap]
@sessionID NVARCHAR(50)
AS

SET NOCOUNT ON

SELECT '{ "latitude": "' + CAST(latitude AS NVARCHAR(15)) 
+ '", "longitude": "' + CAST(longitude AS NVARCHAR(15)) 
+ '", "speed": "' + CAST(speed AS NVARCHAR(4)) 
+ '", "direction": "' + CAST(direction AS NVARCHAR(3)) 
+ '", "distance": "' + CAST(distance AS NVARCHAR(5)) 
+ '", "locationMethod": "' + locationMethod
+ '", "gpsTime": "' + CONVERT(NVARCHAR(50), gpsTime, 100)
+ '", "phoneNumber": "' + phoneNumber
+ '", "userName": "' + userName
+ '", "sessionID": "' + sessionID
+ '", "accuracy": "' + CAST(accuracy AS NVARCHAR(4)) 
+ '", "eventType": "' + eventType
+ '", "extrainfo": "' + extraInfo + '" }' json
  FROM gpslocations
	WHERE sessionID = @sessionID
	ORDER BY lastupdate

