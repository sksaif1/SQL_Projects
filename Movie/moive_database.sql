create database Moive_model

use Moive_model

create table actor(
act_id int not null primary key,
act_fname char(20),
act_lname char(20),
act_gender char(1)
);

insert into actor values (1,'amir','khan','M');
insert into actor values (2,'varon','dhawan','M');
insert into actor values (3,'ranbir','singh','M');
insert into actor values (4,'shahruk','khan','M');


create table director(
dir_id int not null primary key,
dir_fname char (20),
dir_lname char (20)
);

insert into director values (1,'farah','khan')
insert into director values (2,'raj','kumar rao')
insert into director values (3,'rohit','shetty')
insert into director values (4,'abbas','alibhai')

create table movie_director(
dir_id int references director(dir_id),
mov_id int,
)

insert into movie_director(2,1)

alter table movie_director add constraint mov_id foreign key (mov_id)  references movie(mov_id); 

create table movie(
mov_id int not null primary key,
mov_title char(50),
mov_year int,
mov_time int,
mov_lang char(30),
mov_date_rel date, 
mov_rel_country char(20)
)

insert into movie values(1,'PK',2016,12,'hindi','7-17-2016','india')
insert into movie values(2,'golmal',2006,21,'hindi','2/4/2006','india')
insert into movie values(3,'race 2',2013,15,'hindi','1/1/2013','india')
insert into movie values(4,'kabir singh',2019,18,'hindi','6/11/2016','india')


create table movie_cast(
act_id int references actor(act_id),
mov_id int references movie(mov_id),
mov_role char(30)
)

insert into movie_cast values(1,1,'hero')
insert into movie_cast values(2,3,'hero')
insert into movie_cast values(4,2,'villan')
insert into movie_cast values(3,1,'hero')

create table reviewer(
rev_id int not null primary key,
rev_name char(30)
)

insert into reviewer values (1,'zafar')
insert into reviewer values (2,'arbaz')
insert into reviewer values (3,'anwar')
insert into reviewer values (4,'mustufan')


create table genres(
gen_id int not null primary key,
gen_title char (20)
);

insert into genres values (1,'comedy')
insert into genres values (2,'horror')
insert into genres values (3,'darama')
insert into genres values (4,'action')

create table movie_genres(
mov_id int references movie(mov_id),
gen_id int references genres(gen_id)
)

insert into movie_genres values (1,1) 
insert into movie_genres values (2,3)
insert into movie_genres values (3,4) 
insert into movie_genres values (4,1) 
 

create table rating(
mov_id int references movie(mov_id),
rev_id int references reviewer(rev_id),
rev_stars int,
num_of_rating int
)

insert into rating values (1,4,5,10)
insert into rating values (2,1,4,8)
insert into rating values (3,2,3,7)
insert into rating values (4,3,5,9)
