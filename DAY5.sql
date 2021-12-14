use ITI
GO
CREATE VIEW v1
AS
select St_Fname+' '+St_Lname as fullname , Crs_Name
from Student s, Stud_Course sc, Course c
where s.St_Id= sc.St_Id and sc.Crs_Id=c.Crs_Id

select * from v1

--2
use ITI
GO
CREATE VIEW v2
with encryption
as 
select Dept_Manager, c.Crs_Name
from Department d, Instructor i , Ins_Course ic, course c
where d.Dept_Id = i.Dept_Id and i.Ins_Id = i.Ins_Id and c.Crs_Id = ic.Crs_Id

select * from v2
--3
use ITI
GO
create view v7
with schemabinding
as 
select Ins_Name, Dept_Name
from Instructor i inner join Department d
on d.Dept_Id = i.Dept_Id 
where Dept_Name in ('SD','JAVA')

select * from v3

--4
use ITI
GO
create view v4
as 
select *
from student s 
where St_Address in ('Alex','Cairo')

select * from v4

UPDATE  v4 SET St_Address='tanta'
WHERE St_Address='alex';


--5
use ITI
GO
create clustered index i1
on department(manager_hiredate) --xxxx error 

--6 
create unique index i2
on student(st_age) --xxxx error 

--7
use Company_SD

create table daily (
emp_id int primary key,
emp_name varchar(10),
emp_task varchar (50)
)
create clustered index i3
on daily(emp_id)


--8
use Company_SD
GO 

create view v9
as
select count(SSN), p.Pname
from Project p, Works_for w, employee e 
where e.SSN = w.ESSn and w.Pno = p.Pnumber
group by p.Pname

CREATE* FROM V9

