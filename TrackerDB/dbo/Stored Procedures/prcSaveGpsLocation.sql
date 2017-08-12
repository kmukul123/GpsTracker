CREATE PROCEDURE [dbo].[prcSaveGpsLocation]
@latitude          DECIMAL(10,7),
@longitude         DECIMAL(10,7),
@speed             INT,
@direction         INT,
@distance          DECIMAL(10,1),
@date              DATETIME,
@locationMethod    NVARCHAR(100),
@phoneNumber	   NVARCHAR(50),
@userName		   NVARCHAR(50),
@sessionID		   NVARCHAR(50),
@accuracy		   INT,
@eventType         NVARCHAR(50),
@extraInfo		   NVARCHAR(255),
@appId             NVARCHAR(50)
AS

SET NOCOUNT ON
  INSERT INTO gpslocations (Latitude, Longitude, speed, direction, distance, gpsTime, locationMethod,
                            phoneNumber, userName,  sessionID, accuracy, eventType, extraInfo, appID)
  VALUES (@latitude, @longitude, @speed, @direction, @distance, @date, @locationMethod, 
					@phoneNumber, @userName, @sessionID, @accuracy, @eventType, @extraInfo, @appId)

  SELECT CAST(GetDate() AS NVARCHAR(50))


