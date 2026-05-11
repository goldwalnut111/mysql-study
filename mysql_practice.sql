create  database if not exists itcast;
use itcast;
drop table if exists emp;
create table emp(
    id int comment '编号',
    workno varchar(10) comment'姓名',
    name varchar(10) comment '年龄',
    gender char(1) comment '性别',
    age tinyint unsigned comment '年龄',
    idcard varchar(18) comment '身份证号',
    workaddress varchar(50) comment '工作地址',
    entrydate date comment '入职日期'
)comment '员工表';

insert into emp(id,workno,name,gender,age,idcard,workaddress,entrydate)values
(1, '1', '柳岩', '女', 20, '123456789012345678', '北京', '2000-01-01'),
(2, '2', '张无忌', '男', 18, '123456789012345670', '北京', '2005-09-01'),
(3, '3', '韦一笑', '男', 38, '123456789712345670', '上海', '2005-08-01'),
(4, '4', '赵敏', '女', 18, '123456757123845670', '北京', '2009-12-01'),
(5, '5', '小昭', '女', 16, '123456769012345678', '上海', '2007-07-01'),
(6, '6', '杨逍', '男', 28, '12345678931234567X', '北京', '2006-01-01'),
(7, '7', '范瑶', '男', 40, '123456789212345670', '北京', '2005-05-01'),
(8, '8', '黛绮丝', '女', 38, '123456157123645670', '天津', '2015-05-01'),
(9, '9', '范凉凉', '女', 45, '123156789012345678', '北京', '2010-04-01'),
(10, '10', '陈友谅', '男', 53, '123456789012345670', '上海', '2011-01-01'),
(11, '11', '张士诚', '男', 55, '123567897123465670', '江苏', '2015-05-01'),
(12, '12', '常遇春', '男', 32, '123446757152345670', '北京', '2004-02-01'),
(13, '13', '张三丰', '男', 88, '123656789012345678', '江苏', '2020-11-01'),
(14, '14', '灭绝', '女', 65, '123456719012345670', '西安', '2019-05-01'),
(15, '15', '胡青牛', '男', 70, '12345674971234567X', '西安', '2018-04-01'),
(16, '16', '周芷若', '女', 18, NULL, '北京', '2012-06-01');


-- =============================================
-- emp员工表 DQL基础查询练习题
-- 直接复制到DataGrip控制台，在每个题目下方写SQL
-- =============================================

USE itcast; -- 确保使用正确的数据库

-- 一、基础必做题
-- 1. 查询所有员工的全部信息
select * from emp;


-- 2. 查询所有员工的姓名、年龄、性别三个字段
select name,age,gender from emp;

-- 3. 查询所有员工的工作地址，并给该字段起别名为 address
select workaddress as address from emp;

-- 4. 查询公司员工有哪些不同的工作地址（去除重复值）
select distinct workaddress from emp;

-- 5. 查询年龄等于20岁的员工姓名和年龄
select name,age from emp
where age=20;

-- 6. 查询年龄小于20岁的员工所有信息
select * from emp
where age<20;

-- 7. 查询年龄小于等于20岁的员工姓名和工号
select name,workno from emp
where age<=20;

-- 8. 查询没有填写身份证号的员工姓名和性别
select name,gender from emp
where idcard is null;

-- 9. 查询已经填写了身份证号的所有员工信息
select * from emp
where idcard is not null;

-- 10. 查询年龄不等于18岁的员工姓名
select name from emp
where age !=18;

-- 11. 查询年龄在18到30岁之间（包含18和30）的员工所有信息
select * from emp
where age between 18 and 30;

-- 12. 查询性别为女且年龄小于30岁的员工姓名和入职日期
select name,entrydate from emp
where gender='女'and age<30;

-- 13. 查询工作地址是北京或者上海的员工信息
select * from emp
where workaddress='北京'or workaddress='上海';

-- 14. 查询年龄是18岁、20岁或者38岁的员工姓名和工作地址
select name,workaddress from emp
-- where age=18 or age=20 or age=38;
where age in(18,20,38);
-- 15. 查询姓名为两个字的员工所有信息
select * from emp
where name like '__';


-- 16. 查询身份证号最后一位是'X'的员工姓名和身份证号
select name,idcard from emp
where idcard like '%x';

-- 17. 查询所有员工信息，按照年龄从小到大（升序）排序
select * from emp order by age asc;


-- 18. 查询所有员工信息，按照入职时间从晚到早（降序）排序
select * from emp order by entrydate desc;

-- 19. 查询年龄大于等于30岁的员工姓名和年龄，先按年龄降序排序，年龄相同则按入职时间升序排序
select name,age from emp
where age>=30
order by age desc,entrydate asc;

-- 20. 查询公司前5名员工的信息
select * from emp limit 0,5;

-- 21. 查询从第6条记录开始的5条员工信息（分页查询第二页）
select * from emp limit 5,5;

-- 22. 查询公司年龄最大的3个员工的姓名和年龄
select name,age from emp
order by age asc
limit 3;

-- 二、进阶选做题
-- 1. 查询工作地址不是北京的员工所有信息
select * from emp
where workaddress != '北京';

-- 2. 查询年龄在20到40岁之间（不包含20和40）的员工姓名和性别
select name,gender from emp
where age between 21 and 39;

-- 3. 查询姓名中包含"张"字的所有员工信息
select * from emp
where name like '%张%';

-- 4. 查询姓"张"且年龄大于30岁的员工姓名和入职日期
select name,entrydate from emp
where name like '张%' and age>30;

-- 5. 查询身份证号以"123"开头的员工信息
select * from emp
where idcard like '123%';

-- 6. 查询入职日期在2010-01-01到2020-12-31之间的员工姓名和工作地址
select name,workaddress from emp
where entrydate between '2010-01-01' and '2020-12-31';-- 日期需要引号否则报错

-- 7. 查询所有女员工的姓名和年龄，按年龄升序排序，年龄相同则按姓名升序排序
select name,age from emp
order by age asc,name asc;

-- 8. 查询工作地址为北京且年龄在25到45岁之间的员工信息
select * from emp
where workaddress='北京'and age between 25 and 45;

-- 9. 查询年龄大于等于50岁的员工姓名和工作地址
select name,workaddress from emp
where age>=50;

-- 10. 查询姓名第二个字是"三"的员工信息
select * from emp
where name like '_三%';

-- 三、挑战拔高题
-- 1. 查询公司中年龄第二大的员工所有信息
select * from emp
order by age desc
limit 1,1;

-- 2. 查询公司中入职最早的3个员工的姓名和入职日期
select name,entrydate from emp
order by entrydate asc
limit 3;

-- 3. 查询所有员工中，姓名长度为3个字的员工信息
select * from emp
where name like'___';

-- 4. 查询所有员工中，工作地址为"北京"且性别为男的员工数量
select count(*) from emp
where workaddress='北京'and gender='男';-- 在 WHERE 子句中，多个条件之间不能用逗号 , 连接，必须用逻辑运算符（AND/OR）

-- 5. 查询所有员工中，身份证号倒数第二位是偶数的员工姓名
select name from emp
where substr(idcard,17,1) in (0,2,4,6,8);