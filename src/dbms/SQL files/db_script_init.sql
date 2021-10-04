CREATE DATABASE social_media;
Use social_media;

drop table If exists users;
CREATE TABLE users(
  User_ID INT NOT NULL auto_increment,
  Email_ID VARCHAR(25) NOT NULL,
  Phone_No CHAR(10) NOT NULL,
  Pass_word VARCHAR(20) NOT NULL,
  First_name VARCHAR(20) NOT NULL,
  Last_name VARCHAR(20),
  City VARCHAR(20),
  PinCode INT,
  DOB DATE NOT NULL,
  Gender CHAR(10),
  PRIMARY KEY(User_ID)
);
ALTER TABLE users AUTO_INCREMENT=1;
ALTER TABLE users ADD COLUMN AGE INT GENERATED ALWAYS AS (TIMESTAMPdIFF(YEAR,DOB,'2021-09-26'));




drop table if exists posts;
CREATE TABLE posts(
   Post_ID INT NOT NULL auto_increment,
   Posted_User_ID INT NOT NULL,
   Post_Date DATE NOT NULL,
   Post_Content VARCHAR(50) NOT NULL,
   PRIMARY KEY(Post_ID)
);


ALTER TABLE posts AUTO_INCREMENT=1;
ALTER TABLE posts ADD CONSTRAINT Post_User_fk FOREIGN KEY (Posted_User_ID) references users(User_ID) on delete cascade;



drop table if exists post_shares;
CREATE TABLE post_shares(
  Post_ID INT NOT NULL,
  Shared_User_ID INT NOT NULL,
  PRIMARY KEY(Post_ID,Shared_User_ID)
);
ALTER TABLE post_shares ADD CONSTRAINT Shared_Post_ID_fk FOREIGN KEY (Post_ID) references posts(Post_ID) on delete cascade;
ALTER TABLE post_shares ADD CONSTRAINT Shared_User_ID_fk FOREIGN KEY (Shared_User_ID) references users(User_ID) on delete cascade; 



drop table if exists post_likes;
CREATE TABLE post_likes(
  Post_ID INT NOT NULL,
  Liked_User_ID INT NOT NULL,
  PRIMARY KEY(Post_ID,Liked_User_ID)
);
ALTER TABLE post_likes ADD CONSTRAINT Liked_Post_ID_fk FOREIGN KEY (Post_ID) references posts(Post_ID) on delete cascade;
ALTER TABLE post_likes ADD CONSTRAINT Liked_User_ID_fk FOREIGN KEY (Liked_User_ID) references users(User_ID) on delete cascade; 





drop table if exists post_comments;
CREATE TABLE post_comments(
  Comment_ID INT NOT NULL auto_increment,
  Post_ID INT NOT NULL,
  Commented_Date DATE,
  Comment_Content VARCHAR(50),
  Commented_User_ID INT NOT NULL,
  PRIMARY KEY(Comment_ID)
);
ALTER TABLE post_comments AUTO_INCREMENT=1;
ALTER TABLE post_comments ADD CONSTRAINT Commented_Post_ID_fk FOREIGN KEY (Post_ID) references posts(Post_ID) on delete cascade;
ALTER TABLE post_comments ADD CONSTRAINT Commented_User_ID_fk FOREIGN KEY (Commented_User_ID) references users(User_ID) on delete cascade;





drop table if exists pages;
CREATE TABLE pages(
   Page_ID INT NOT NULL auto_increment,
   Page_Name VARCHAR(20) NOT NULL,
   Page_Content VARCHAR(50) NOT NULL,
   PRIMARY KEY(Page_ID)
);
ALTER TABLE pages AUTO_INCREMENT=1;




drop table if exists page_likes;
CREATE TABLE page_likes(
  Page_ID INT NOT NULL,
  Page_User_ID INT NOT NULL,
  PRIMARY KEY(Page_ID,Page_User_ID)
);
ALTER TABLE page_likes ADD CONSTRAINT Page_ID_fk FOREIGN KEY (Page_ID) references pages(Page_ID) on delete cascade;
ALTER TABLE page_likes ADD CONSTRAINT Page_User_ID_fk FOREIGN KEY (Page_User_ID) references users(User_ID) on delete cascade;






DROP TABLE if exists friends;
CREATE TABLE friends(
   User_ID INT NOT NULL,
   Friend_ID INT NOT NULL,
   PRIMARY KEY(User_ID,Friend_ID)
);
ALTER TABLE friends ADD CONSTRAINT User_ID_fk FOREIGN KEY (User_ID) references users(User_ID) on delete cascade on update cascade; 
ALTER TABLE friends ADD CONSTRAINT Friend_ID_fk FOREIGN KEY (Friend_ID) references users(User_ID) on delete cascade;





drop table if exists comments_like;
CREATE TABLE comments_like(
  Comment_ID INT NOT NULL,
  Comment_liked_User_ID INT NOT NULL,
  PRIMARY KEY (Comment_ID,Comment_liked_User_ID)
);
ALTER TABLE comments_like ADD CONSTRAINT Comment_ID_fk FOREIGN KEY (Comment_ID) references post_comments(Comment_ID) on delete cascade;
ALTER TABLE comments_like ADD CONSTRAINT Comment_liked_user_ID_fk FOREIGN KEY (Comment_liked_User_ID) references users(User_ID) on delete cascade;





