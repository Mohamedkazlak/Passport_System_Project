USE [Passport Automatation System]

CREATE TABLE [dbo].[Admin](
	[ID] [int] NOT NULL primary key identity ,
	[name] [nvarchar](50) NULL,
	[phone_number] [nvarchar](50) NULL,

) 


CREATE TABLE [dbo].[Passport](
	[number] [nvarchar](50) Not NULL unique ,
	[ID] [int]   primary key identity,
	[state_id] [int] NULL,
	[visa_id] [int] NULL,
	[admin_id] [int] NULL,
	[user_id] [int] NULL,
	[passport_state_id] [int] NOT NULL,

) 

CREATE TABLE [dbo].[Passport state](
	[passport_state_id] [int]  primary key identity,
	[passport_state] [nvarchar](50) NULL,

)

CREATE TABLE [dbo].[User](
	[ID] [int]   primary key identity,
	[name] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[national_ID] [nvarchar](50) NULL,
	[birth_date] [date] NULL,
	[passport_ID] [int] NULL,

) 
CREATE TABLE [dbo].[Visa](
	[ID] [int]   primary key identity,
	[leaving_time] [date] NULL,
	[arriving_time] [date] NULL,
	[destination] [nvarchar](50) NULL,
	[visa_type_id] [int] NULL,
 
)

CREATE TABLE [dbo].[Visa Type](
	[visa_type] [nvarchar](50) NOT NULL,
	[visa_id] [int]   primary key identity,

)




ALTER TABLE Passport
ADD FOREIGN KEY (visa_id) REFERENCES Visa(ID);


ALTER TABLE Passport
ADD FOREIGN KEY (passport_state_id) REFERENCES state(passport_state_id);



ALTER TABLE Passport
ADD FOREIGN KEY (admin_id) REFERENCES Admin(ID);



ALTER TABLE Passport
ADD FOREIGN KEY (user_id) REFERENCES [User](ID);


ALTER TABLE Visa
ADD FOREIGN KEY (visa_type_id) REFERENCES [Visa Type](visa_id);



  insert into [dbo].[Admin]
  (name,phone_number)
  values('samy mohamad','01079774490'),
  ('ahmad ali','01270019033'),
  ('amr hany','01092657005'),
  ('omar hossam','01219107734');

  insert into [dbo].[User]
  (name,city,national_ID,birth_date,passport_ID)
  values('ali hany','alexandria','30082109991345','9-26-1987',5),
  ('ahmad zain','cairo','29910105617891','12-29-1999',6),
  ('zyad ayman','portsaid','28929903004935','10-26-1989',3),
  ('mohamad amr','giza','30071651656646','7-21-1998',1),
  ('mariam hossam','ismailia','29205626124612','6-5-1992',4),
  ('dalia salah','portsaid','29404151448737','6-14-1994',2);

  insert into [dbo].[Passport state]
  (passport_state)
  values('accepted'),
  ('not accepted');

  
  insert into [dbo].[Visa Type]
  (visa_type)
  values('tourism'),
  ('buisness');

   insert into [dbo].[Visa]
  (leaving_time,arriving_time,destination,visa_type_id)
  values('9-20-2020','1-15-2021','usa',2),
  ('6-21-2020','7-20-2020','belgium',1),
  ('10-12-2020','8-11-2021','germany',2),
  ('11-30-2020','12-15-2020','usa',1);

  insert into [dbo].[Passport]
  (number,visa_id,admin_id,[user_id],passport_state_id)
  values('2015933',301,4,4,1),
  ('6053924',508,3,6,1),
  ('1644952',NULL,1,3,2),
  ('2613105',657,4,5,1),
  ('1701210',NULL,2,7,2),
  ('2178921',198,1,2,1);
