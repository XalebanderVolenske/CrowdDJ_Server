USE [CrowdDJ_DB]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 21.04.2018 00:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[UserID] [int] NOT NULL,
	[Username] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 21.04.2018 00:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[UserID] [int] NOT NULL,
	[Partycode] [int] NOT NULL,
	[PartyID] [int] NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Party]    Script Date: 21.04.2018 00:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Party](
	[PartyID] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Location] [nvarchar](250) NOT NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[Partycode] [int] NULL,
	[PlaylistID] [int] NULL,
 CONSTRAINT [PK_Party] PRIMARY KEY CLUSTERED 
(
	[PartyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partytweet]    Script Date: 21.04.2018 00:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partytweet](
	[PartytweetID] [int] NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[UserID] [int] NULL,
	[PartyID] [int] NULL,
 CONSTRAINT [PK_Partytweet] PRIMARY KEY CLUSTERED 
(
	[PartytweetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlist]    Script Date: 21.04.2018 00:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[PlaylistID] [int] NOT NULL,
	[TrackID] [int] NULL,
	[PartyID] [int] NULL,
 CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Track]    Script Date: 21.04.2018 00:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[TrackID] [int] NOT NULL,
	[Titel] [nvarchar](250) NOT NULL,
	[Interpret] [nvarchar](250) NOT NULL,
	[Url] [nvarchar](500) NOT NULL,
	[Genre] [nvarchar](250) NOT NULL,
	[RecommandUserID] [int] NULL,
 CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21.04.2018 00:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] NOT NULL,
	[Emailaddress] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vote]    Script Date: 21.04.2018 00:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[VoteID] [int] NOT NULL,
	[Timestamp] [timestamp] NULL,
	[UserID] [int] NOT NULL,
	[TrackID] [int] NOT NULL,
 CONSTRAINT [PK_Vote] PRIMARY KEY CLUSTERED 
(
	[VoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [FK_User_Administrator] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [FK_User_Administrator]
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD  CONSTRAINT [FK_Party_Guest] FOREIGN KEY([PartyID])
REFERENCES [dbo].[Party] ([PartyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [FK_Party_Guest]
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD  CONSTRAINT [FK_User_Guest] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [FK_User_Guest]
GO
ALTER TABLE [dbo].[Party]  WITH CHECK ADD  CONSTRAINT [FK_Party_Playlist] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[Playlist] ([PlaylistID])
GO
ALTER TABLE [dbo].[Party] CHECK CONSTRAINT [FK_Party_Playlist]
GO
ALTER TABLE [dbo].[Partytweet]  WITH CHECK ADD  CONSTRAINT [FK_Party_Partytweet] FOREIGN KEY([PartyID])
REFERENCES [dbo].[Party] ([PartyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Partytweet] CHECK CONSTRAINT [FK_Party_Partytweet]
GO
ALTER TABLE [dbo].[Partytweet]  WITH CHECK ADD  CONSTRAINT [FK_User_Partytweet] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Partytweet] CHECK CONSTRAINT [FK_User_Partytweet]
GO
ALTER TABLE [dbo].[Playlist]  WITH CHECK ADD  CONSTRAINT [FK_Track_Playlist] FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([TrackID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Playlist] CHECK CONSTRAINT [FK_Track_Playlist]
GO
ALTER TABLE [dbo].[Track]  WITH CHECK ADD  CONSTRAINT [FK_User_Track] FOREIGN KEY([RecommandUserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Track] CHECK CONSTRAINT [FK_User_Track]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_Track_Vote] FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([TrackID])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_Track_Vote]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_User_Vote] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_User_Vote]
GO
