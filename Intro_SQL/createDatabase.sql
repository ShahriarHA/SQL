drop database if exists `university_database`;
create database `university_database`;
use `university_database`;

create table Department
(
	 Dept_name varchar(20),
     Building varchar(20),
     Budget numeric(20,2),
     primary key (Dept_name)
);

create table Course
(
	Course_id varchar(7),
    Course_Title varchar(50),
    Dept_name varchar(20),
    Credits numeric(2,2),
    primary key (Course_id),
    foreign key (Dept_name) references Department(Dept_name)
);

create table Instructor
(
	ID varchar(10) not null,
    Name varchar(29) not null,
    Dept_name varchar(20),
    Salary numeric(8,2),
    primary key (ID),
    foreign key (Dept_name) references Department(Dept_name)
);

create table Section
(
	Course_id varchar(7),
    Sec_id varchar(8),
    Semester varchar(10),
    Year numeric(4,0),
    building varchar(20),
    room_number varchar(20),
    time_slot_id varchar(10),
    primary key (Course_id,Sec_id,Semester,Year),
    foreign key (Course_id) references Course(Course_id)
); 

create table Teaches
(
	ID varchar(10) not null,
    Course_id varchar(7),
    Sec_id varchar(8),
    Semester varchar(10),
    Year numeric(4,0),
    primary key (ID,Course_id,Sec_id,Semester,Year),
    foreign key (Course_id,Sec_id,Semester,Year) references Section(Course_id,Sec_id,Semester,Year),
    foreign key (ID) references Instructor(ID)
);




