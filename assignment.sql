use Company_SD
select Dname , Dnum , MGRSSN
from Departments as d 

--problem 2 inner join 
use Company_SD
select Dname, Pname
from Departments d, Project p
where d.Dnum = p.Dnum

-- problem3 INNER join
use Company_SD
select   Fname+' '+Lname as fullname, ESSN, Dependent_name, d.Sex , d.Bdate
from Employee e
INNER join Dependent d
on e.SSN = d.ESSN

--problem 4 
use Company_SD
select Pname, Plocation, Pnumber
from Project 
where City = 'cairo' or City= 'alex'
-- problem5
use Company_SD
select *
from Project p
where Pname like 'a%'
-- problem 6
use Company_SD
select *
from Employee
where Dno= 30 and salary between 1000 and  2000

--problem 7
use Company_SD
select Fname+' '+lname as fullname , Dno
from employee e left join Works_for w 
on e.SSN = w.ESSn 
left join project p
on p.Pnumber = w.Pno
where e.Dno = 10 and Pname ='AL Rabwah' and w.Hours>= 10

--problem 8 
use Company_SD
select  e.Fname+' '+e.lname as fullname 
from Employee e , Employee s
where s.Superssn = e.SSN 

-- problem 9
use Company_SD
select Pnumber, lname , Dname, e.Address , e.Bdate
from project p left join  Departments d 
on  d.Dnum =p.Dnum 
inner join  employee e
on e.ssn = d.MGRSSN

--problem 10
use Company_SD
select *
from Employee e, Departments d
where e.SSN = d.MGRSSN

-- problem 11
use Company_SD
select *
from employee e left join Departments d
on d.Dnum = e.Dno

--dml join assignment 
use Company_SD
insert into Employee
       values ('asmaa', 'shehata',102682 ,15-6-1997,'shiben' ,'female',3000, 112233, 30)
insert into Employee (Dno, SSN )
       values (30 , 102660)
update Employee
      set Salary += Salary *20 / 100 
from Employee e 
where e.SSN = 102682

select Salary
from Employee e 
where e.SSN = 102682