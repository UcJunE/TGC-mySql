create table parents(
    parent_id integer unsigned primary key auto_increment,
    first_name varchar(45) not null,
    last_name varchar(45) not null
)engine = innodb;

create table locations(
    location_id integer unsigned auto_increment primary key,
    name  varchar(255) not null default "",
    address varchar(255) not null 
)engine = innodb;

-- insert a new location
insert into locations ( name, address) values ("Bishan Swimming Complex" ,"Bishan St 81")

-- to see all the rows from a TABLE

select* from locations;

--L9 if the input value is nth, the default value will be a empty string ,
-- if we dint define a default value =  SQL will prompt error

--create student with parents foreign key
-- not null = compulsory
-- use unsigned if the int gonna be positive
create table student(
    student_id int unsigned auto_increment primary key,
    parent_id int unsigned not null,
    first_name varchar(45) not null,
    last_name varchar(45),
    swimming_level tinyint unsigned not null default 0,
    date_of_birt datetime not null
)engine =innodb;


-- step 2 add the foreign key 
--MUL stands for fk
alter table student add constraint  fk_student_parents
    foreign key(parent_id) references parents(parent_id)


-- another method to do it in 1 step - add fk in the table
create table sessions(
    session_id int unsigned auto_increment primary key,
    datetime datetime not null ,
    location_id int unsigned not null,
    foreign key (location_id) references locations(location_id)   
)engine = innodb;


-- remove a column from an existing table
alter table student drop column swimming_level;

-- to add back a new colum
alter table student add column swimming_level int unsigned;

-- modified the column that already existed .
alter table student modify column swimming_level int unsigned not null default 0;
