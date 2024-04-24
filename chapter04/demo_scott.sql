insert into dept
values(14,'홍보','2층');
insert into dept
values(20,'영업','4층');
insert into dept
values(22,'개발','6층');

-- (1) 사원의 이름과 업무를 출력하시오.
insert into emp
values(1,'사원1','홍보',10,'2024-04-24',10000,5000,14);
insert into emp
values(2,'사원2','영업',11,'2024-03-25',12000,3000,20);
insert into emp
values(3,'사원3','개발',12,'2024-02-11',13000,2000,22);
select ename as 사원이름,
    job as 사원업무
from emp;

-- (2) 30번 부서에 근무하는 모든 사원의 이름과 급여를 출력하시오.
insert into dept
values(30,'전자','5층');
insert into emp
values(4,'사원4','전자',15,'2023-06-21',20000,2000,30);
insert into emp
values(5,'사원5','전자',15,'2024-01-14',14000,2000,30);

select ename, sal
from emp 
where deptno = 30;

-- (3) 사원번호와 이름, 현재 급여, 증가된 급여(열 이름은 '증가액'), 10% 인상된 급여
-- (열 이름은 '인상된 급여')를 사원번호순으로 출력하시오
select
    empno,
    ename,
    sal as 현재급여,
    (sal * 1.1) - sal as 증가액,
    (sal * 1.1) as "인상된 급여"
from emp
order by empno;

-- (4) 'S'로 시작하는 모든 사원과 부서번호를 출력하시오.
insert into emp
values(7,'Soft7 ','개발',12,'2024-02-11',13000,2000,22);
insert into emp
values(8,'Some8','전자',12,'2024-02-11',13000,2000,30);

select ename, deptno
from emp
where ename like 'S%';

-- (5) 모든 사원의 최대 및 최소 급여, 합계 및 평균 급여를 출력하시오
-- 열 이름은 각각 MAX, MIN, SUM, AVG로 한다. 단, 소수점 이하는 반올림하여 정수로 표현
select MAX(sal), MIN(sal), SUM(sal), ROUND(AVG(sal))
from emp;

-- (6) 업무 이름과 업무별로 동일한 업무를 하는 사원의 수를 출력하시오. 
-- 열 이름은 각각 '업무'와 '업무별 사원수'로 한다
select 
    job as "업무",
    count(*) as "업무별 사원수"
    from emp
group by job;

-- (7) 사원의 최대 급여와 최소 급여의 차액을 출력하시오
select (MAX(sal) - MIN(sal)) as "차액"
from emp;

-- (8) 30번 부서의 사원 수와 사원들 급여의 합계와 평균을 출력하시오
select
    count(*) as "사원 수",
    SUM(sal) as "급여의 합계",
    AVG(sal) as "급여의 평균"
from emp
where deptno = 30;

-- (9) 평균 급여가 가장 높은 부서의 번호를 출력하시오.
select deptno
from (
    select deptno, ROUND(AVG(sal)) as "평균 급여"
    from emp
    group by deptno
    order by "평균 급여" desc
    )
where rownum = 1; -- 만족시키는 자료에 1번부터 붙는 순번

-- (10) 세일즈맨을 제외하고, 각 업무별 사원의 총급여가 3,000 이상인 각 업무에 대해서,
-- 업무명과 각 업무별 평균 급여를 출력하시오. 단 평균 급여의 내림차순으로 출력한다






