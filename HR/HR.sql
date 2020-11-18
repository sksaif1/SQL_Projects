create database hr

use hr 

create table region(
region_id int not null primary key,
region_Name varchar(25)
)

create table countries(
country_id int not null primary key,
country_Name varchar(40),
region_id int references region(region_id)
)


create table locations(
location_id int not null primary key,
street_address varchar(25),
postal_code varchar(12),
city varchar(25),
state_provice varchar(12),
country_id int references countries(country_id)
)

create table department(
dep_id int not null primary key,
dep_Name varchar(30),
maanager_id int,
location_id int references locations(location_id) 
)

create table jobs(
job_id varchar not null primary key,
job_title varchar(35),
min_salary int,
max_salary int
)

create table job_history(
emp_id int not null primary key,
start_dates date,
end_date date ,
job_id varchar references jobs(job_id),
dep_id int references department(dep_id)
)

create table employees(
emp_id int not null primary key,
first_Name varchar(20),
last_Name varchar(25),
Eamil varchar(25),
Phone_Numnber varchar(20),
Hire_date date,
job_id varchar references jobs(job_id),
salary int,
commission_pct int,
manager_id int,
dep_id int references department(dep_id)
)

create table job_garade(
great_level char(10),
lowest_level int,
high_level int,
)
