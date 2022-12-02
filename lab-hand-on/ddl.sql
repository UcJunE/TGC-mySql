create table departments(
    department_id int unsigned auto_increment primary key ,
    name varchar(100) not null 
)engine=innodb;

create table task_forces(
    task_force_id int unsigned auto_increment primary key,
    name varchar(255) not null
)engine=innodb;



-- i got department and task force
create table employees(
    employee_id int unsigned auto_increment primary key ,
    name varchar(100), 
    email varchar(320),
    gender varchar(1),
    notes text null,
    employment_date date,
    designation varchar(100),
    supervisor_id int unsigned,
    department_id int unsigned,
    foreign key (supervisor_id) references employees(employee_id),
    foreign key (department_id) references employees(employee_id)
)engine = innodb;


create table taskforce_membership(
    taskforce_membership_id int unsigned auto_increment primary key,
    employee_id int unsigned,
    task_force_id int unsigned,
    foreign key (employee_id) references employees(employee_id),
    foreign key (task_force_id) references task_forces(task_force_id)
)engine =innodb;

create table contact_numbers(
    contact_number_id int unsigned auto_increment primary key,
    countrycode varchar(3),
    areacode varchar(3),
    number  varchar(3),
    employee_id int unsigned,
    foreign key(employee_id) references employees(employee_id)
)engine=innodb;

create table addresses(
    address_id int unsigned auto_increment primary key ,
    building varchar(255),
    employee_id int unsigned,
    street varchar(255),
    unit varchar(255),
    postalcode varchar(255),
    foreign key (employee_id) references employees(employee_id)
)engine=innodb;


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