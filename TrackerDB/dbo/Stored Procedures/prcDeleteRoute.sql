CREATE PROCEDURE [dbo].[prcDeleteRoute]
@sessionID NVARCHAR(50)
AS

SET NOCOUNT ON

DELETE FROM gpslocations
WHERE sessionID = @sessionID