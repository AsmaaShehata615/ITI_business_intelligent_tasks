use ITI
go
create proc getcount 
as 
  select count(s.St_Id), d.Dept_Name
  from Student s, Department d
  where s.Dept_Id=d.Dept_Id
  group by d.Dept_Name

  exec dbo.getcount

--2
use Company_SD
go
create proc getmsg
as
declare @xx int 
set @xx	=(select count(e.SSN)
	from Employee e inner join Works_for w 
	on w.ESSn= e.ssn inner join Project p
	on w.Pno = p.Pnumber
	where  p.Pname= 'Al Rawdah')
	begin 
	if @xx >3
	begin 
	select 'The number of employees in the project p1 is 3 or more'
	select e.Fname , e.Lname  
	from Employee e inner join Works_for w 
	on w.ESSn= e.ssn inner join Project p
	on w.Pno = p.Pnumber 
	where  p.Pname= 'Al Rawdah'
	end
	else 
	begin 
	select 'The following employees work for the project p1'
	select e.Fname , e.Lname  
	from Employee e inner join Works_for w 
	on w.ESSn= e.ssn inner join Project p
	on w.Pno = p.Pnumber 
	where  p.Pname= 'Al Rawdah'
	end
	end

exec dbo.getmsg

--3
use Company_SD
go 
create proc oldemployeee @old int, @new int,@projectno int 
as 
if (exists  
(select ssn from employee e where e.ssn= @new)
and exists 
(select pno from Works_for where essn=@new)
)
begin 
update Works_for
set essn=@new
where Pno=@projectno
end

exec oldemployeee 

--4
use ITI
go

create table tablee
		(
		Server_User_Name varchar(100),
    	HireDate  date ,
        Note varchar(200) 
	     	)
			select * from student
create trigger trig
			 on student
			 instead  of insert
			 as
			 begin
             declare @n varchar(100)
	         select @n=St_Fname+''+St_Lname +' inserted'  from inserted
			 insert into tablee values(SUSER_NAME(),GETDATE(),@n)
			 end


		   select * from student

			  insert into student values(23,'Asmaa','shehata','shiben elkom',77,14,null)


			  select * from tablee
--5
use ITI
GO 

create table table1
		(
		Server_User_Name varchar(100),
    	HireDate  date ,
        Note varchar(200) 
	     	)
			select * from student
create trigger trigg
			 on student
			 instead  of delete
			 as
			 begin
             declare @n varchar(100)
	         select @n=St_Fname+''+St_Lname +'Deleted'  from deleted
			 insert into tablee values(SUSER_NAME(),GETDATE(),@n)
			 end

   delete from student
              where St_Id=4

			  select * from table1