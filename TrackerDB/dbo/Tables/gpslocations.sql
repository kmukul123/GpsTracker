CREATE TABLE [dbo].[gpslocations] (
    [GPSLocationID]  INT             IDENTITY (1, 1) NOT NULL,
    [lastUpdate]     DATETIME        CONSTRAINT [DF_gpslocations_LastUpdate] DEFAULT (getdate()) NOT NULL,
    [latitude]       DECIMAL (10, 7) CONSTRAINT [DF_gpslocations_latitude] DEFAULT ((0.0)) NOT NULL,
    [longitude]      DECIMAL (10, 7) CONSTRAINT [DF_gpslocations_longitude] DEFAULT ((0.0)) NOT NULL,
    [phoneNumber]    NVARCHAR (50)   CONSTRAINT [DF_gpslocations_phoneNumber] DEFAULT ('') NOT NULL,
    [userName]       NVARCHAR (50)   CONSTRAINT [DF_gpslocations_userName] DEFAULT ('') NOT NULL,
    [sessionID]      NVARCHAR (50)   CONSTRAINT [DF_gpslocations_sessionID] DEFAULT ('') NOT NULL,
    [speed]          INT             CONSTRAINT [DF_gpslocations_speed] DEFAULT ((0)) NOT NULL,
    [direction]      INT             CONSTRAINT [DF_gpslocations_direction] DEFAULT ((0)) NOT NULL,
    [distance]       DECIMAL (10, 1) CONSTRAINT [DF_gpslocations_distance] DEFAULT ((0.0)) NOT NULL,
    [gpsTime]        DATETIME        CONSTRAINT [DF_gpslocations_gpsTime] DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [locationMethod] NVARCHAR (100)  CONSTRAINT [DF_gpslocations_locationMethod] DEFAULT ('') NOT NULL,
    [accuracy]       INT             CONSTRAINT [DF_gpslocations_accuracy] DEFAULT ((0)) NOT NULL,
    [eventType]      NVARCHAR (50)   CONSTRAINT [DF_gpslocations_eventType] DEFAULT ('') NOT NULL,
    [extraInfo]      NVARCHAR (255)  CONSTRAINT [DF_gpslocations_extraInfo] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_gpslocations] PRIMARY KEY CLUSTERED ([GPSLocationID] ASC)
);

