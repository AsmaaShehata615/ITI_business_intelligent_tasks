--1
use Company_SD
select Dependent_name as deptname , e.Sex as gender
from   Dependent d ,  Employee e 
where  d.ESSN = e.ssn and  e.sex = 'f' and d.Sex ='f'
union 
select Dependent_name as deptname , e.Sex as gender 
from   Dependent d ,  Employee e 
where  d.ESSN = e.ssn and  e.sex = 'm' and d.Sex ='m'
--2
use Company_SD
select pname , (select sum(w.hours) as total from Works_for  w join Employee e
on w.ESSn = e.SSN)
from Project

--3
use Company_SD
select * 
from Departments d inner join Employee e 
on d.Dnum = e.dno
where e.SSN= (Select min(SSN)
From Employee )

--4
use Company_SD
select dname, min(e.salary) as min , max(e.salary) as max, avg(salary) as avg
from Departments d inner join Employee e
on d.Dnum = e.Dno
group by dname 

--5
select lname 
from Employee e join Departments dd
on e.SSN = dd.MGRSSN
left join Dependent d 
on e.SSN = d.ESSN
where d.Dependent_name is null

--6
select d.Dname , d.Dnum , count(SSN) as count
from departments d left join employee e 
on d.Dnum=e.Dno
group by Dname, Dnum
having avg(e.Salary) < (select avg (Salary) from Employee)

--7
select Fname,Lname, Dname 
from  departments d left join project p 
on d.Dnum = p.Dnum
inner join employee e 
on d.Dnum = e.Dno
order by Dname , e.Fname , e.Lname

--8
(SELECT MAX(salary) FROM Employee) union (SELECT MAX(salary) FROM Employee
WHERE Salary NOT IN ( SELECT Max(Salary) FROM Employee))

--9
use Company_SD
select Fname+' '+Lname as fullname ,Dependent_name,
 case 
	when Fname+' '+Lname = Dependent_name then 'similar' 
	else 'not similar' 
 end
from Employee e left join Dependent d
on e.SSN = d.ESSN

--10
select fname,lname, ((30*salary)/100) as New_Salary
from employee,works_for,project
where ssn=essn and pno=pnumber and pname='Al Rabwah'

--DML 

--1
insert into Departments 
values('Dept it',100,112233,'1-11-2006')
--2.1
update Departments
set MGRSSN = 968574
where dname = 'dept it'
--2.2
update Departments
set Dnum = 20
where Dname =dno -- join but i have no idea about the solution 
--2.3
update Employee
set Superssn=102660
where ssn=102672

--3
-- it's unable to delete mr.kamal



