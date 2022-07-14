CREATE TABLE [Lecture](
	[lid] [int] PRIMARY KEY NOT NULL,
	[lname] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [datetime] NOT NULL,
	[address] [nvarchar](50) NOT NULL
	)

CREATE TABLE [Subject](
	[suid] [int] PRIMARY KEY NOT NULL,
	[suname] [nvarchar](50) NOT NULL
	)

CREATE TABLE [Student](
	[sid] [int] PRIMARY KEY NOT NULL,
	[sname] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[dob] [datetime] NOT NULL
	)

CREATE TABLE [Group](
	[gid] [int] PRIMARY KEY NOT NULL,
	[gname] [nvarchar](50) NOT NULL,
	[lid] [int] NOT NULL,
	[suid] [int] NOT NULL,
	FOREIGN KEY (lid) REFERENCES [Lecture] (lid),
	FOREIGN KEY (suid) REFERENCES [Subject] (suid)
	)

CREATE TABLE [Section](
	[seid] [int] PRIMARY KEY NOT NULL,
	[date] [datetime] NOT NULL,
	[lid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	FOREIGN KEY (lid) REFERENCES [Lecture] (lid),
	FOREIGN KEY (gid) REFERENCES [Group] (gid)
	)

CREATE TABLE [G_Student](
	[sid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	PRIMARY KEY (sid, gid),
	FOREIGN KEY (sid) REFERENCES [Student] (sid),
	FOREIGN KEY (gid) REFERENCES [Group] (gid)
	)

CREATE TABLE [Info_Assessment](
	[Category_ID] [int] PRIMARY KEY NOT NULL,
	[Category_name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Part] [int] NOT NULL,
	[Weight] [float] NOT NULL,
	[Completion criteria] [nvarchar](50) NOT NULL,
	[Duration] [nvarchar](50) NOT NULL,
	[Question type] [nvarchar](50) NOT NULL,
	[No question] [int] NOT NULL,
	[Knowledge and Skill] [nvarchar](150) NOT NULL,
	[Grading guide] [nvarchar](150) NOT NULL,
	[Note] [nvarchar](150) NOT NULL
	)

CREATE TABLE [Assessment](
	[aid] [int] PRIMARY KEY NOT NULL,
	[suid] [int] NOT NULL,
	[Category_ID] [int] NOT NULL,
	FOREIGN KEY (suid) REFERENCES [Subject] (suid),
	FOREIGN KEY (Category_ID) REFERENCES [Info_Assessment] (Category_ID)
	)

CREATE TABLE [Result](
	[sid] [int] NOT NULL,
	[suid] [int] NOT NULL,
	PRIMARY KEY (sid,suid),
	FOREIGN KEY (sid) REFERENCES [Student] (sid),
	FOREIGN KEY (suid) REFERENCES [Subject] (suid)
	)

CREATE TABLE [ScoreTable](
	[stid] [int] PRIMARY KEY NOT NULL,
	[aid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[score] [float] NOT NULL,
	FOREIGN KEY (sid) REFERENCES [Student] (sid),
	FOREIGN KEY (aid) REFERENCES [Assessment] (aid)
	)

