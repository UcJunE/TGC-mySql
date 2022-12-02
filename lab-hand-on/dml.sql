-- test case

insert into employees(name,email,gender) values("banana","banana@gmail.com","M");


-- to target specific  table row and update
select supervisor_id from employees where  employee_id =1;

update employees set supervisor_id =1 where employee_id=1;

-- to input data into the table via it's field
insert into addresses(employee_id,unit) values(1,133);

insert into contact_numbers(employee_id,number) values(1,91);

insert into taskforce_membership(employee_id,task_force_id) values(1,1);

insert into task_forces(name) values("banana");

insert into departments(name) values ("R&D");

select department_id from employees where employee_id=1;

update employees set department_id =1 where employee_id=1;