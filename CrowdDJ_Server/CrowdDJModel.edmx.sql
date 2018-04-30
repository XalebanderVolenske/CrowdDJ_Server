
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/29/2018 12:21:10
-- Generated from EDMX file: C:\Users\d-vol\source\repos\CrowdDJ_Server\CrowdDJ_Server\CrowdDJ_Server\CrowdDJModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CrowdDJ_DB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Party_Guest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Guest] DROP CONSTRAINT [FK_Party_Guest];
GO
IF OBJECT_ID(N'[dbo].[FK_Party_Partytweet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Partytweet] DROP CONSTRAINT [FK_Party_Partytweet];
GO
IF OBJECT_ID(N'[dbo].[FK_Party_Playlist]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Party] DROP CONSTRAINT [FK_Party_Playlist];
GO
IF OBJECT_ID(N'[dbo].[FK_Track_Playlist]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Playlist] DROP CONSTRAINT [FK_Track_Playlist];
GO
IF OBJECT_ID(N'[dbo].[FK_Track_Vote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Vote] DROP CONSTRAINT [FK_Track_Vote];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Administrator]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Administrator] DROP CONSTRAINT [FK_User_Administrator];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Guest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Guest] DROP CONSTRAINT [FK_User_Guest];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Partytweet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Partytweet] DROP CONSTRAINT [FK_User_Partytweet];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Track]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Track] DROP CONSTRAINT [FK_User_Track];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Vote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Vote] DROP CONSTRAINT [FK_User_Vote];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Administrator]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Administrator];
GO
IF OBJECT_ID(N'[dbo].[Guest]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Guest];
GO
IF OBJECT_ID(N'[dbo].[Party]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Party];
GO
IF OBJECT_ID(N'[dbo].[Partytweet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Partytweet];
GO
IF OBJECT_ID(N'[dbo].[Playlist]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Playlist];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Track]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Track];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO
IF OBJECT_ID(N'[dbo].[Vote]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Vote];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Administrators'
CREATE TABLE [dbo].[Administrators] (
    [UserID] int  NOT NULL,
    [Username] nvarchar(250)  NULL,
    [Password] nvarchar(250)  NULL
);
GO

-- Creating table 'Guests'
CREATE TABLE [dbo].[Guests] (
    [UserID] int  NOT NULL,
    [Partycode] int  NOT NULL,
    [PartyID] int  NULL
);
GO

-- Creating table 'Parties'
CREATE TABLE [dbo].[Parties] (
    [PartyID] int  NOT NULL,
    [Name] nvarchar(250)  NOT NULL,
    [Location] nvarchar(250)  NOT NULL,
    [StartTime] time  NULL,
    [EndTime] time  NULL,
    [Partycode] int  NULL,
    [PlaylistID] int  NULL
);
GO

-- Creating table 'Partytweets'
CREATE TABLE [dbo].[Partytweets] (
    [PartytweetID] int  NOT NULL,
    [Message] nvarchar(500)  NOT NULL,
    [UserID] int  NULL,
    [PartyID] int  NULL
);
GO

-- Creating table 'Playlists'
CREATE TABLE [dbo].[Playlists] (
    [PlaylistID] int  NOT NULL,
    [TrackID] int  NULL,
    [PartyID] int  NULL
);
GO

-- Creating table 'Tracks'
CREATE TABLE [dbo].[Tracks] (
    [TrackID] int  NOT NULL,
    [Titel] nvarchar(250)  NOT NULL,
    [Interpret] nvarchar(250)  NOT NULL,
    [Url] nvarchar(500)  NOT NULL,
    [Genre] nvarchar(250)  NOT NULL,
    [RecommandUserID] int  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserID] int  NOT NULL,
    [Emailaddress] nvarchar(250)  NOT NULL
);
GO

-- Creating table 'Votes'
CREATE TABLE [dbo].[Votes] (
    [VoteID] int  NOT NULL,
    [Timestamp] binary(8)  NULL,
    [UserID] int  NOT NULL,
    [TrackID] int  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UserID] in table 'Administrators'
ALTER TABLE [dbo].[Administrators]
ADD CONSTRAINT [PK_Administrators]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [UserID] in table 'Guests'
ALTER TABLE [dbo].[Guests]
ADD CONSTRAINT [PK_Guests]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [PartyID] in table 'Parties'
ALTER TABLE [dbo].[Parties]
ADD CONSTRAINT [PK_Parties]
    PRIMARY KEY CLUSTERED ([PartyID] ASC);
GO

-- Creating primary key on [PartytweetID] in table 'Partytweets'
ALTER TABLE [dbo].[Partytweets]
ADD CONSTRAINT [PK_Partytweets]
    PRIMARY KEY CLUSTERED ([PartytweetID] ASC);
GO

-- Creating primary key on [PlaylistID] in table 'Playlists'
ALTER TABLE [dbo].[Playlists]
ADD CONSTRAINT [PK_Playlists]
    PRIMARY KEY CLUSTERED ([PlaylistID] ASC);
GO

-- Creating primary key on [TrackID] in table 'Tracks'
ALTER TABLE [dbo].[Tracks]
ADD CONSTRAINT [PK_Tracks]
    PRIMARY KEY CLUSTERED ([TrackID] ASC);
GO

-- Creating primary key on [UserID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [VoteID] in table 'Votes'
ALTER TABLE [dbo].[Votes]
ADD CONSTRAINT [PK_Votes]
    PRIMARY KEY CLUSTERED ([VoteID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserID] in table 'Administrators'
ALTER TABLE [dbo].[Administrators]
ADD CONSTRAINT [FK_User_Administrator]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PartyID] in table 'Guests'
ALTER TABLE [dbo].[Guests]
ADD CONSTRAINT [FK_Party_Guest]
    FOREIGN KEY ([PartyID])
    REFERENCES [dbo].[Parties]
        ([PartyID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Party_Guest'
CREATE INDEX [IX_FK_Party_Guest]
ON [dbo].[Guests]
    ([PartyID]);
GO

-- Creating foreign key on [UserID] in table 'Guests'
ALTER TABLE [dbo].[Guests]
ADD CONSTRAINT [FK_User_Guest]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([UserID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PartyID] in table 'Partytweets'
ALTER TABLE [dbo].[Partytweets]
ADD CONSTRAINT [FK_Party_Partytweet]
    FOREIGN KEY ([PartyID])
    REFERENCES [dbo].[Parties]
        ([PartyID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Party_Partytweet'
CREATE INDEX [IX_FK_Party_Partytweet]
ON [dbo].[Partytweets]
    ([PartyID]);
GO

-- Creating foreign key on [PlaylistID] in table 'Parties'
ALTER TABLE [dbo].[Parties]
ADD CONSTRAINT [FK_Party_Playlist]
    FOREIGN KEY ([PlaylistID])
    REFERENCES [dbo].[Playlists]
        ([PlaylistID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Party_Playlist'
CREATE INDEX [IX_FK_Party_Playlist]
ON [dbo].[Parties]
    ([PlaylistID]);
GO

-- Creating foreign key on [UserID] in table 'Partytweets'
ALTER TABLE [dbo].[Partytweets]
ADD CONSTRAINT [FK_User_Partytweet]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([UserID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_User_Partytweet'
CREATE INDEX [IX_FK_User_Partytweet]
ON [dbo].[Partytweets]
    ([UserID]);
GO

-- Creating foreign key on [TrackID] in table 'Playlists'
ALTER TABLE [dbo].[Playlists]
ADD CONSTRAINT [FK_Track_Playlist]
    FOREIGN KEY ([TrackID])
    REFERENCES [dbo].[Tracks]
        ([TrackID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Track_Playlist'
CREATE INDEX [IX_FK_Track_Playlist]
ON [dbo].[Playlists]
    ([TrackID]);
GO

-- Creating foreign key on [TrackID] in table 'Votes'
ALTER TABLE [dbo].[Votes]
ADD CONSTRAINT [FK_Track_Vote]
    FOREIGN KEY ([TrackID])
    REFERENCES [dbo].[Tracks]
        ([TrackID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Track_Vote'
CREATE INDEX [IX_FK_Track_Vote]
ON [dbo].[Votes]
    ([TrackID]);
GO

-- Creating foreign key on [RecommandUserID] in table 'Tracks'
ALTER TABLE [dbo].[Tracks]
ADD CONSTRAINT [FK_User_Track]
    FOREIGN KEY ([RecommandUserID])
    REFERENCES [dbo].[Users]
        ([UserID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_User_Track'
CREATE INDEX [IX_FK_User_Track]
ON [dbo].[Tracks]
    ([RecommandUserID]);
GO

-- Creating foreign key on [UserID] in table 'Votes'
ALTER TABLE [dbo].[Votes]
ADD CONSTRAINT [FK_User_Vote]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([UserID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_User_Vote'
CREATE INDEX [IX_FK_User_Vote]
ON [dbo].[Votes]
    ([UserID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------