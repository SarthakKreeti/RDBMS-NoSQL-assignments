use sys;

/* 1. Create a trigger to fill up the full_name column in the dependents table while
inserting any new records. */
alter table dependents add column full_name varchar(50);

drop trigger fill_full_name;

CREATE TRIGGER fill_full_name
BEFORE INSERT ON dependents
FOR EACH ROW SET NEW.full_name = CONCAT(NEW.first_name, ' ', NEW.last_name);

delete from dependents ;
insert into dependents(dependent_id,first_name,last_name,relationship,employee_id,city ,full_name)
values (1,'sarthak','Tiwari','father',1,'jabalpur',''),
       (2,'yash','barman','mother',2,'rewa',''),
       (3,'vignesh','selvan','sister',3,'kolkata',''),
       (4,'uday','kiran','brother',4,'mumbai',''),
       (5,'saurabh','patel','father',5,'delhi','');

/*
2. Create a trigger that stores the transaction records of each insert, update and
delete operations performed on the locations table into locations_info table.
*/
drop table locations_info ;

create table locations_info(
operation varchar(50),
transaction_date date,
location_id int
); 
CREATE TRIGGER locations_insert_trigger
AFTER INSERT ON locations
FOR EACH ROW
    INSERT INTO locations_info (operation, location_id, transaction_date)
    VALUES ('insert', NEW.location_id, NOW());
   
INSERT into locations(location_id, street_address, pincode, city, state_province, country_id)
values (8,"3u1",482002,"rewa","mp",1);

create trigger locations_update_trigger
after update on locations
FOR EACH ROW
    INSERT INTO locations_info (operation, location_id, transaction_date)
    VALUES ('update', NEW.location_id, NOW());
   
update locations set city='bhagalpur' where location_id =8;

-- drop trigger locations_delete_trigger;
CREATE TRIGGER locations_delete_trigger
before delete ON locations
FOR EACH ROW
    INSERT INTO locations_info (operation, location_id, transaction_date)
    VALUES ('delete', old.location_id, NOW());
DELETE from locations WHERE location_id =8;
   
/*
3. For the following tables create a view named employee_information with
employee first name, last name, salary, department name, city, postal code insert
only those records whose postal code length is less than 5.
*/
create view employee_information as select
e.first_name, e.last_name,e.salary, d.department_name, l.city, l.pincode
from employees e join departments d on e.department_id =d.department_id join locations l on d.location_id =l.location_id 
where length(l.pincode)<5;

SELECT
* from employee_information;      
/*      
4. Explain ACID properties with an example.
ans.ACID (Atomicity, Consistency, Isolation, Durability) is a set of properties that ensure reliability and integrity in database transactions.
 Let's explain each property with an example:
Consider a banking system with two tables: accounts and transactions.
 The accounts table stores information about customer accounts, while the transactions table records all financial transactions.

Atomicity:
Atomicity ensures that a transaction is treated as a single, indivisible unit of work. Either all the changes made by the transaction are committed, 
or none of them are. If any part of the transaction fails, all the changes are rolled back to maintain consistency.
For example, let's say a customer transfers money from one account to another. The transaction includes two steps: deducting the amount from 
the source account and adding it to the destination account. If any of these steps fails (e.g., due to an error or system crash), the entire transaction
 is rolled back, and both accounts remain unchanged.

Consistency:
Consistency guarantees that a transaction brings the database from one valid state to another. It ensures that all defined rules, constraints, 
and relationships are maintained during and after the transaction.
For instance, suppose there is a constraint that an account balance cannot go below zero. If a withdrawal transaction attempts to bring the 
balance below zero, the transaction is aborted to maintain consistency and prevent invalid data.

Isolation:
Isolation ensures that concurrent transactions do not interfere with each other. Each transaction should appear to be executed in isolation,
 even when multiple transactions are executing concurrently. Changes made by one transaction should be invisible to other transactions until 
 the changes are committed.
For example, if two customers simultaneously transfer funds from their accounts, the transactions should not interfere with each other.
 Each transaction should read the initial state of the accounts, perform the transfer, and commit the changes without being affected by 
 the other transaction's operations.

Durability:
Durability guarantees that once a transaction is committed, its changes are permanent and will survive any subsequent failures, 
such as power outages or system crashes. The changes made by the transaction are stored in non-volatile memory and can be recovered 
even in the event of a system failure.
For instance, after a successful funds transfer, the changes are committed to the database, written to disk, and persisted.
 Even if there is a power outage or a system crash, the transferred funds will be retained and not lost.


These ACID properties collectively ensure that database transactions are reliable, consistent, and maintain data integrity even 
in the face of failures or concurrent operations.
*/


-- question 5.
/*
 we can make a composite primary key by using the three attributes name,age and occupation , because these three attributes 
 have unique values .
 and then we can make an index file with this composite primary key
 */
CREATE TABLE records (
    name varchar(50),
    age int,
    occupation varchar(50),
    category char,
    PRIMARY KEY (name,age,occupation)
);

create index record_index on records (name,age,occupation);





      
      
      
  























      
      
      
      
