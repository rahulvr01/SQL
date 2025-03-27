use dummy;
create table family(member_id varchar(50),name varchar(20),age int,parent_id varchar(50));
insert into family(member_id,name,age,parent_id)
values("f1","David",4,"f5"),
("f2","Carol",10,"f5"),
("f3","michael",12,"f5"),
("f4","johnson",36,"NULL"),
("f5","maryam",40,"f6"),
("f6","stewart",70,"NULL"),
("f7","rohan",6,"f4"),
("f8","ashs",8,"f4");



#wasq to fetch child name,age and their corressponding parent name , age from the family table
select c.name as childname,c.age as childage ,
p.name as parentname,p.age as parentage from
family p inner join family c 
on c.member_id=p.parent_id;

select c.name as childname,c.age as childage ,
p.name as parentname,p.age as parentage from
family c inner join family p 
on p.member_id=c.parent_id;

select c.name as childname,c.age as childage ,
p.name as parentname,p.age as parentage from
family c left join family p 
on p.member_id=c.parent_id;

use dummy;

select c.name as childname,c.age as childage ,
p.name as parentname,p.age as parentage from
family c left join family p 
on p.member_id=c.parent_id
order by childname desc;







