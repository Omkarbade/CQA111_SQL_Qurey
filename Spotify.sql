

create database Spotify;
use Spotify;
create table Users(u_id int primary key,u_name varchar(30),u_email varchar(30),u_password varchar(30));
desc Users;

create table Playlists(p_id int primary key,p_name varchar (30),p_desc varchar(40),u_id int, foreign key(u_id) references Users(u_id));
desc Playlists;

insert into Users values (101,'Omkar','omkar@gmail.com','12345678'),(102,'Rahul','rahul@gmail.com','R12345678'),
                         (103,'Yash','yashu@gmail.com','Y12345678'), (104,'Rohit','rohit@gmail.com','R1234567');
						  
select * from Users;
select * from Playlists;
drop table Users;
drop table Playlists;

insert into Playlists values (1,'Fav','global',101),(2,'BTS','global',101);

create table Tracks(t_id int primary key,t_name varchar(30),t_artist varchar(30),p_id int,foreign key(p_id) references Playlists(p_id));

insert into Tracks values (1,'music','abc','1'),(2,'album','abc','1');
select * from Tracks;
UPDATE Tracks SET t_artist = 'ABC' WHERE t_id =1; 

insert into Playlists values (3,'English','global',102),(4,'BTS','albums',103);
insert into Tracks values (3,'Believer','Imagine Dragons',2),(4,'hangover','BTS',3),(5,'ABCD','xyz',4);


SELECT * FROM Users WHERE u_id IN(SELECT u_id FROM Users);
SELECT * FROM Users WHERE u_id IN(SELECT u_id FROM Users WHERE u_id>101);
SELECT * FROM Users WHERE u_id IN(SELECT MAx(u_id) FROM Users );
SELECT * FROM Users WHERE u_id IN(SELECT min(u_id) FROM Users );
SELECT * FROM Users WHERE u_id NOT IN(SELECT u_id FROM Users WHere u_id=102 );
SELECT * FROM Users WHERE u_id IN(SELECT u_id FROM Playlists Where u_id=101 );
SELECT * FROM Playlists WHERE p_id IN(SELECT p_id FROM Playlists Where p_id=1 );
select * from Playlists;
select * from Tracks;
select * from Tracks where Tracks.p_id in (select Playlists.p_id from playlists where Playlists.p_name='Fav');
select * from Tracks where Tracks.p_id in (select Playlists.p_id from playlists where Playlists.p_id=1);
select * from Users where Users.u_id in(select Playlists.u_id from playlists where Playlists.p_id in (select Tracks.p_id from Tracks where tracks.p_id=1));
select * from Users where Users.u_id in(select Playlists.u_id from playlists where Playlists.p_id in (select Tracks.p_id from Tracks where tracks.t_id=4));

select * from Users where Users.u_id in(select Playlists.u_id from playlists where Playlists.p_id in (select Tracks.p_id from Tracks where tracks.p_id=2));
create Table subscribers(id int primary key,name varchar(30),email varchar(30),gender varchar(10));
insert into UserDetails values (1,'Raji','raji@gmail.com','F'),(2,'Deeraj','Dee@gmail.com','M');
select * from Userdetails;
ALTER TABLE Userdetails ADD Country varchar(30) AFTER gender ;  
 Update Userdetails set Country='India' where id =1;
 Update Userdetails set Country='USA' where id =2;
 RENAME TABLE UserDetails TO subscribers;
 SELECT * FROM subscribers;
 SELECT DISTINCT name from subscribers;
 SELECT DISTINCT name from subscribers where Country='india';
 INSERT INTO subscribers VALUES(3,'JK','Jk@gmail.com','M','India'),(4,'sai','sai@gmail.com','M','USA'),(5,'chinni','ch@gmail.com','F','Switzerland'),(6,'Frank','fr@gmail.com','F','Vennice'),(7,'worldstar','ws@gmail.com','M','Korea');
 SELECT * FROM subscribers where country='India' order by name;
SELECT * FROM subscribers where gender='M' group by name having min(id) >2; 
SELECT * FROM subscribers where gender='M' group by name having Sum(id) >=2; 
EXPLAIN subscribers;
desc subscribers;
select * from Users;
select * from playlists;
select * from Playlists where Playlists.user_id =100;
select p_name from Playlists order by p_name Asc ;
select p_name from Playlists order by p_name Desc;
ALTER TABLE subscribers ADD streaming_Hrs int AFTER country ; 
ALTER TABLE  subscribers  DROP COLUMN streaming_Hrs ;  
update subscribers set streaming_Hrs=1 where id=1;
update subscribers set streaming_Hrs=3 where id=2;
update subscribers set streaming_Hrs=7 where id=3;
update subscribers set streaming_Hrs= 5 where id=4;
update subscribers set streaming_Hrs=1 where id=6;
update subscribers set streaming_Hrs=7 where id=7;
update subscribers set streaming_Hrs=1 where id=5;

DELETE FROM Tracks WHERE t_id=2; 
 
 ------joins----------
select * from Users;
select * from Playlists;
select *from tracks;

select *from Users Inner Join Playlists on Playlists.u_id= Users.u_id;
select* from users  Join Tracks on Users.u_id=Tracks.t_id;
select *from Users Left Join Playlists  on Playlists.u_id= Users.u_id;
select *from Users Right Join Playlists on Playlists.u_id= Users.u_id;
select *from Users  Join Playlists on Playlists.u_id= Users.u_id;
select *from Users cross Join Playlists ;
select *from Users  Join Playlists on Playlists.u_id= Users.u_id join Tracks on Playlists.p_id=Tracks.p_id;
select *from Users  Left Join Playlists on Playlists.u_id= Users.u_id left join Tracks on Playlists.p_id=Tracks.p_id;
select *from Users  Right Join Playlists on Playlists.u_id= Users.u_id right join Tracks on Playlists.p_id=Tracks.p_id;
select *from Users cross Join Playlists cross join Tracks ;
select p_id from Playlists where p_id=1; 