/****** Object:  Schema [exams]    Script Date: 9/18/2023 10:33:31 AM ******/
CREATE SCHEMA [exams]
GO
/****** Object:  Table [exams].[exam]    Script Date: 9/18/2023 10:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [exams].[exam](
	[id] [int] NOT NULL,
	[path] [nvarchar](500) NULL,
	[name] [nvarchar](200) NULL,
	[cnp] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [exams].[exam_patient]    Script Date: 9/18/2023 10:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [exams].[exam_patient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exam_id] [int] NOT NULL,
	[type] [nvarchar](50) NULL,
	[patient_id] [nvarchar](20) NOT NULL,
	[patient_name] [nvarchar](200) NULL,
	[date] [nvarchar](20) NULL,
	[institution] [nvarchar](100) NULL,
 CONSTRAINT [PK_exam_patient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [exams].[exam_patient_protocol]    Script Date: 9/18/2023 10:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [exams].[exam_patient_protocol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exam_patient_id] [int] NOT NULL,
	[protocol_id] [int] NOT NULL,
 CONSTRAINT [PK_exam_patient_protocol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [exams].[protocol]    Script Date: 9/18/2023 10:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [exams].[protocol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[protocol] [nvarchar](200) NULL,
 CONSTRAINT [PK_protocol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [exams].[exam_patient_protocol]  WITH CHECK ADD  CONSTRAINT [FK_exam_patient_protocol_exam_patient] FOREIGN KEY([exam_patient_id])
REFERENCES [exams].[exam_patient] ([id])
GO
ALTER TABLE [exams].[exam_patient_protocol] CHECK CONSTRAINT [FK_exam_patient_protocol_exam_patient]
GO
ALTER TABLE [exams].[exam_patient_protocol]  WITH CHECK ADD  CONSTRAINT [FK_exam_patient_protocol_protocol] FOREIGN KEY([protocol_id])
REFERENCES [exams].[protocol] ([id])
GO
ALTER TABLE [exams].[exam_patient_protocol] CHECK CONSTRAINT [FK_exam_patient_protocol_protocol]
GO
