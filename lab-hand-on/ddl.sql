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


