create database Hospital_model;

use hospital_model

create table proceduree(
code int not null primary key,
name text,
cost real
);

create table physician(
empoyee_id int not null primary key,
name text,
position text,
ssn int
); 

create table trained_in(
physician int references physician(empoyee_id),
treatment int references proceduree(code),
certification_date date,
certification_expire date
);

create table department(
department_id int not null primary key,
name text,
head int references physician(empoyee_id)
);

create table affilated_with(
physician int references physician(empoyee_id),
department int references department(department_id),
primary_affilation BIT,
)

create table madication(
code int not null primary key,
name text,
brand text,
description_ text
)

create table patient(
ssn int not null primary key,
name text ,
address_ text,
phone_no int,
insurance_id int,
pcp int references physician(empoyee_id)
);

create table nurse(
employee_id int not null primary key,
name text ,
position text,
registered bit,
ssn int
)

create table appointment(
appointment_id int not null primary key,
patient int references patient(ssn),
prep_nurse int references nurse(employee_id),
physician int references physician(empoyee_id),
start_date_time Timestamp,
examination_room text 
)

create table prescribe(
physician int references physician(empoyee_id),
patient int references patient(ssn),
madication int references madication(code),
date_ timestamp,
appointmnet int references appointment(appointment_id),
dose text
)


create table undergose(
patient int references patient(ssn),
proceduree int references proceduree(code),
saty int,
date_ timestamp,
physician int references physician(empoyee_id),
assisting_nurse int references nurse(employee_id),
);

EXEC sp_RENAME 'undergose.saty', 'stay', 'column'
go


alter table undergose add  foreign key(stay) references stay(stay_id);


create table block(
block_floor int not null,
block_code int not null,
primary key (block_floor,block_code)
)



create table room(
room_number int not null primary key,
room_type text,
block_floor int, 
block_code int,
unavailable bit,
constraint FK_room_block foreign key (block_floor,block_code) references block(block_floor,block_code)
)

create table stay(
stay_id int not null primary key,
patient int references patient(ssn),
room int references room(room_number),
start_date_time Timestamp
)

create table on_call(
nurse int references nurse(employee_id), 
block_floor int, 
block_code int,
start_call Timestamp,
constraint FK_on_call_block foreign key (block_floor,block_code) references block(block_floor,block_code)
)

