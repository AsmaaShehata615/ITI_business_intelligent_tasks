Use ITI
go 
--1
create function get_month(@date date)
returns varchar(50)
as
begin 
declare @get varchar(50)
set @get= (select DATENAME(month,@date))
return @get
end 

select dbo.get_month('11/1/2020')

--2
alter function betweenN(@num int , @numm int )
returns @out table (Num int)
as
begin 
declare @tt int 
set @tt = @num
 begin 
   while @num< @numm
   set @tt+=1 
   insert into @out 
   values(@tt)
   end 
   return
 end

 select * from dbo.betweenN(1,8)

 --3
 create function getstudent(@id int)
 returns @student table(deptName varchar(50) , full_name varchar(50))
 as
 begin 
 insert into @student 
 select St_Fname+''+s.St_Lname as fullname , d.Dept_Name
 from Student  s , Department d 
 where s.Dept_Id= d.Dept_Id and @id= s.St_Id 
 return 
 end 

 select * from dbo.getstudent(1)

 --4
create function getMessage(@id int)
returns varchar(50)
as 
begin 
declare @msg varchar(50)
SELECT @msg = CASE WHEN s.St_Fname IS NULL AND s.St_Lname IS NULL
                       THEN 'First name & last name are null'
                       WHEN s.St_Fname IS NULL AND s.St_Lname IS NOT NULL
                       THEN 'first name is null'
                       WHEN s.St_Fname IS NOT NULL AND s.St_Lname IS NULL
                       THEN 'last name is null'
                  ELSE 'First name & last name are not null' END
FROM dbo.Student s
where @id= s.St_Id
 return @msg
 end 

 select dbo.getMessage(1)

 --5
 use Company_SD
 go

create function manager(@num int)
returns table 
as 
return(select e.Fname+''+e.Lname as fullName, d.Dname, convert(varchar(50), [MGRStart Date], @num) as hiredate
from Departments d , Employee e
 where d.MGRSSN=e.SSN)
 
 select * from manager(5)

 --6
 use ITI
 go
 create function fname(@s varchar(50))
 returns @tt table (namee varchar(50))
 as
 begin
 declare @ss varchar(50)
 select @ss = case when @s= 'first'  then s.St_Fname
			   when @s= 'last' then s.St_Lname
			   when @s= 'full 'then s.St_Fname+''+s.St_Lname 
			  else 'not found' end 
 from dbo.student s
 insert into @tt 
 values (@ss)
 return
 end 

select * from dbo.fname('')

--7
use ITI
select s.St_Id, SUBSTRING(s.St_Fname, 1, LEN(St_Fname)-1) as withoutLastChar
from Student s

--8
declare @yy varchar(50)
declare @xx varchar(50)
set @yy = 'cards'
set @xx='hearts'

execute ('select'+@yy+ 'from'+@xx )