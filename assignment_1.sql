-- Q.1. Create the following schema 
-- MySql
create table regions(
region_id int primary key,
region_name varchar(50)
);
create table countries(
country_id int primary key,
country_name varchar(50),
region_id int,
foreign key (region_id) references regions(region_id)
);
CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(50),
    postal_code VARCHAR(50),
    city VARCHAR(50),
    state_province VARCHAR(50),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    CHECK (CHAR_LENGTH(postal_code) <= 10)
);
create table departments(
department_id int primary key,
department_name varchar(50),
location_id int,
foreign key(location_id) references locations(location_id)
);

CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(100),
    min_salary int check(min_salary>1000),
    max_salary int
);
CREATE TABLE employees(
employee_id INT PRIMARY KEY,
first_name varchar(50) not null,
last_name varchar(50)not null,
email varchar(50),
phone_number INT,
hire_date varchar(50),
job_id int,
salary int,
manager_id int,
department_id int,
foreign key (job_id) references jobs(job_id),
foreign key(manager_id) references employees(employee_id),
foreign key(department_id) references departments(department_id)
);
create table dependents(
dependent_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
relationship varchar(50),
employee_id int,
foreign key(employee_id) references employees(employee_id)
);

/* Q.2.Insert 5 rows in the jobs, dependents, regions, countries, locations, departments tables and  10 
rows in the Employee table.*/
INSERT into regions(region_id,region_name)
values (1,"jabalpur"),
       (2,"bhopal"),
       (3,"kolkata"),
       (4,"mumbai"),
       (5,"banglore");
      
INSERT into countries(country_id ,country_name ,region_id)
values (1,"india",1),
       (2,"china",2),
       (3,"russia",3),
       (4,"america",4),
       (5,"japan",5);
      
INSERT into locations(location_id, street_address, postal_code, city, state_province, country_id)
values (1,"3u1",482002,"jabalpur","mp",1),
       (2,"90383",8937412,"bhopal","mp",2),
       (3,"4984812",9812,"rewa","mp",3),
       (4,"4928",39847124,"jaipur","rajasthan",4),
       (5,"429dej",347984,"mumbai","maharastra",5);    
INSERT into departments(department_id,department_name,location_id)
values (1,"cs",1),
       (2,"it",2),
       (3,"ece",3),
       (4,"mech",4),
       (5,"ip",5);
insert into jobs(job_id,job_title,min_salary,max_salary)
values (1,"sde",2000,3294312),
       (2,"se",104814,34803),
       (3,"pp",429201,349094),
       (4,"web",91482,3409403),
       (5,"android",090480,4343244);
      
insert into employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES
    (1, 'John', 'Doe', 'johndoe@example.com', 123456789, '2022-01-01', 1, 5000, 1,1),
    (2, 'Jane', 'Smith', 'janesmith@example.com', 987654321, '2022-02-01', 2, 6000, 2,2),
    (3, 'Mike', 'Johnson', 'mikejohnson@example.com', 555555555, '2022-03-01', 1, 5500, 1,3),
    (4, 'Emily', 'Davis', 'emilydavis@example.com', 111111111, '2022-04-01', 3, 7000, 2,4),
    (5, 'Chris', 'Wilson', 'chriswilson@example.com', 999999999, '2022-05-01', 2, 6500, 1,5),
    (6, 'Sarah', 'Anderson', 'sarahanderson@example.com', 444444444, '2022-06-01', 1, 5200, 2,3),
    (7, 'Michael', 'Brown', 'michaelbrown@example.com', 222222222, '2022-07-01', 3, 7200, 1,2),
    (8, 'Jessica', 'Taylor', 'jessicataylor@example.com', 888888888, '2022-08-01', 2, 6300, 2,1),
    (9, 'David', 'Clark', 'davidclark@example.com', 666666666, '2022-09-01', 1, 5100, 1,2),
    (10, 'Amy', 'Moore', 'amymoore@example.com', 333333333, '2022-10-01', 3, 6800, 2,3);
   
insert into dependents(dependent_id,first_name,last_name,relationship,employee_id)
values (1,"sarthak","Tiwari","father",1),
       (2,"yash","barman","mother",2),
       (3,"vignesh","selvan","sister",3),
       (4,"uday","kiran","brother",4),
       (5,"saurabh","patel","father",5);
-- Q.3.aIn departments table, add a new field ‘manager_name’ of type VARCHAR       
ALTER table departments add column manager_name varchar(50); 
-- Q.3.b REMOVE field max_salary from jobs.
alter table jobs drop column max_salary;
-- Q.3.c In the locations table, rename postal_code column to pincode.
alter table locations drop constraint locations_chk_1;
alter table locations change column postal_code pincode varchar(50);
-- Q.4 // all the constraints are imposed while creating tables 





