
-- Create table Articles
CREATE TABLE [dbo].[Articles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- Create table Tags
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



-- Create table ArticleTags (many to many)
CREATE TABLE [dbo].[ArticleTags](
	[ArticleId] [int] NOT NULL,
	[TagId] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ArticleTags]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTags_Articles] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
GO

ALTER TABLE [dbo].[ArticleTags] CHECK CONSTRAINT [FK_ArticleTags_Articles]
GO

ALTER TABLE [dbo].[ArticleTags]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO

ALTER TABLE [dbo].[ArticleTags] CHECK CONSTRAINT [FK_ArticleTags_Tags]
GO


-- Query
select 
 articles.Name as articleName
,tags.Name as tagName
from dbo.Articles articles
left join dbo.ArticleTags ariclesTags on ariclesTags.ArticleId=articles.Id
left join dbo.Tags tags on ariclesTags.TagId=tags.Id

