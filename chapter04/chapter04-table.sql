-- [사원 데이터베이스]
create table dept(
    deptno number primary key,
    dname varchar2(20),
    loc varchar2(20)
);

create table emp(
    empno number primary key,
    ename varchar2(10),
    job varchar2(9),
    mgr number,
    hiredate date,
    sal number,
    comm number,
    deptno number,
    foreign key(deptno) references dept (deptno)
);
