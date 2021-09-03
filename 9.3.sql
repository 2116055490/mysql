create database school;
use school;

create table student(
  sno varchar(20) not null primary key,-- 学号
	sname varchar(20) not null, -- 姓名
	ssex varchar(20) not null, -- 性别
	sbirthday datetime, -- 出生年月
	class varchar(20)  -- 班级
);

create table course(
 cno varchar(20) not null primary key, -- 课程号
 cname varchar(20) not null, -- 课程名称
 tno varchar(20) not null references tearcher(tno) -- 教工编号
);

create table score(
 sno varchar(20) not null references student(sno),  -- 学号
 cno varchar(20) not null references course(cno),  -- 课程号
 degree decimal(4,1) -- 成绩
);

create table tearcher(
 tno varchar(20) not null primary key, -- 教工编号
 tname varchar(20) not null , -- 教工姓名
 tsex varchar(20) not null , -- 教工性别
 tbirthday datetime ,-- 教工出生年月
 prof varchar(20) , -- 职称
 depart varchar(20) not null -- 教工所在部门
 
 
);

insert into student values ('108','曾华','男','1977-09-01','95033'),('105','匡明','男','1975-10-02','95031'),
('107','王丽','女','1976-01-23','95033'),
('101','李军','男','1976-02-20','95033'),
('109','王芳','女','1975-02-10','95031'),
('103','陆军','男','1974-06-03','95031')

select * from student;

insert into course values ('3-105','计算机导论','825'),
('3-245','操作系统','804'),
('6-166','数字电路','856'),
('9-888','高等数学','831')
select * from course;

insert into score values ('103','3-245','86'),
('105','3-245','75'),
('109','3-245','68'),
('103','3-105','92'),
('105','3-105','88'),
('109','3-105','76'),
('101','3-105','64'),
('107','3-105','91'),
('108','3-105','78'),
('101','6-166','85'),
('107','6-166','79'),
('108','6-166','81')
select * from score;

insert into tearcher values ('804','李诚','男','1958-12-02','副教授','计算机系'),
('856','张旭','男','1969-03-12','讲师','电子工程系'),
('825','王萍','女','1972-05-05','助教','计算机系'),
('831','刘兵','女','1977-08-14','助教','电子工程系')
select * from tearcher;

-- 1.查询student 表中的所有记录的sname , ssex, 和 class列（查询指定列）
select sname as 姓名,ssex as 性别,class as 班级 from student;


-- 2.查询教师所有的单位即不重复的depart列
select distinct depart from tearcher;

-- 3.查询student 表的所有记录
select * from student;

-- 4.查询score 表中成绩在60到80之间的所有记录。
select * from score where degree between 60 and 80;
select * from score where degree >=60 and degree <=80;

-- 5.查询score表中成绩为85，86或88的记录。
select * from score where degree=85 || degree=86 || degree=88;
select * from score where degree in (85,86,88);

-- 6.查询student表中"95031"班或性别为"女"的同学记录
select * from student where class='95031' || ssex = '女';

-- 7.以class降序查询student表的所有记录
select * from student order by class desc;

-- 8.以cno升序、degree降序查询score表的所有记录。
select * from score order by cno,degree desc;

-- 9.查询"95031"班的学生人数。
select count(*) 人数 from student where class='95031';

-- 10.查询score表中的最高分的学生学号和课程号
select sno,cno from score  order by degree desc limit 1;
select sno,cno from score where degree=(select max(degree) from score);
