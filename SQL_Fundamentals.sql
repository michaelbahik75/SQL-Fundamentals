# Data Definition Language: 
# a) create b) alter c) drop d) truncate
# a) create a table:
create table emp (id int, name varchar(20), salary numeric(10));

desc
table emp;

# describe a table
select
    *
from
    emp;

# b) alter a table
# ALTER TABLE - ADD Column
alter table emp
add address varchar(15);

alter table emp
add DOB year;

# ALTER TABLE - DROP COLUMN
alter table emp
drop column dob
# ALTER TABLE - RENAME COLUMN
alter table emp
rename column address to location;

# ALTER TABLE - ALTER/MODIFY DATATYPE
alter table emp
alter column DOB int # sqlserver
ALTER TABLE emp
modify COLUMN dob DATE;

# MySQl
# c) drop a table   
drop table emp
# d) truncate a table: delete data inside a table but not table itself
truncate table emp1;

# Data Manipulation Language:
# a) insert b) select c) update d) delete
# a) inserting data into a table
# inserting into single row of a table
insert into
    emp (id, name, salary, address, dob)
VALUES
    (1, 'Tom', 10000, 'kapan', '2003-2-01');

# inserting into multiple rows of a table
insert into
    emp (id, name, salary, address, dob)
values
    (2, 'mike', 20000, 'chabahil', '2000-04-01'),
    (3, 'john', 15000, 'boudha', '2002-03-05');

# b) select command:
# select all rows from a table
select
    *
from
    emp;

# select specific columns from a table
select
    name,
    salary
from
    emp;

# select command with where clause
select
    id,
    name,
    salary
from
    emp
where
    salary > 10000;

# select command with order by clause
select
    name,
    salary
from
    emp
order by
    name;

# select command to insert records:
create table emp1 (id int);

alter table emp1
add salary numeric(10);

insert into
    emp1 (
        select
            id,
            name,
            salary
        from
            emp
    );

insert into
    emp1 (name)
VALUES
    ('jun');

insert into
    emp1 (name)
values
    ('michael'),
    ('manisha'),
    ('manish'),
    ('tony'),
    ('jack');

select
    *
from
    emp1;

# select column using alias:
select
    name as emp_name,
    salary as income
from
    emp1 as e;

# like operator in select: used with wildcards to find pattern
# wildcards: '%', '-', '[]', '^', [-]
# usecase of %
select
    name
from
    emp1
where
    name like 'mi%';

# find name starting with mi
select
    name
from
    emp1
where
    name like '%el';

# find name ending with el
select
    name
from
    emp1
where
    name like '%ani%';

# find name containing ani
select
    name
from
    emp1
where
    name like 't%y';

# find name starting with 't' and ending with 'y'
select
    name
from
    emp1
where
    name like 't__y';

# find name having first letter 't',any two character in middle and last letter 'y'
select
    name
from
    emp1
where
    name like '_a%';

# find name having second letter 'a'
select
    name
from
    emp1
where
    name like '%a__';

# find name having third last letter 'a'
select
    name
from
    emp1
where
    name like 'm___%';

# find name starts with 'm' and has atleast 3 letters
select
    name
from
    emp1
where
    name like 'j[ao]n';

# find name start with 'j', "a or o" in middle and ends with 'n'
select
    name
from
    emp1
where
    name like 'j[^a]n';

select
    name
from
    emp1
where
    name like '';

# update
update emp
set
    salary = 25000
where
    id = 3;

# single column
update emp
set
    name = 'amar',
    address = 'sukedhara'
where
    name = 'mike';

# multiple columns
select
    *
from
    emp
where
    id in (1, 2, 3);

# Delete
delete from emp1
where
    id in (1, 2);

# select multiple rows and delete
# Data Control Language
# give previleges to Randy to only view and modify records in table emp1
grant
select
,
update on emp1 to Randy
with
grant option;

# revoke granted previleges from randy in table emp1
revoke
select
,
update on emp1
from
    randy;