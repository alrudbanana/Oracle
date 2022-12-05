
--모든 테이블 출력 하기 
select * from tab;

--테이블의 구조 확인하기 
    --select : 출력하기 코드 
    /*
    select 컬럼명 
    from 테이블이름 
    
    */
-- 1. emplyee 테이블의 모든 컬럼을 출력하라.
    -- 근로자(고용자) 에 대한 정보를 저장 
select * 
from employee;

--2.Department 출력 
select * 
from department;

--3. salgrade 테이블의 모든 컬럼(필드,엔티티)을 출력
    -- 판매 순위를 저장하는 테이블. 
select * 
from salgrade;

-- =========================================================================
-- 각 테이블의 각각의 컬럼 정보 
-- 1. employee 테이블 
select * from employee;
/*
    ENO : 사원번호 
    ENAME : 사원명
    JOB : 직책 
    MANAGER : 상관 
    HIREDATE :  입사일 
    SALARY : 월급을 저장
    COMMISSION : 보너스 
    DNO : 부서번호 
*/
-- 2.부서 정보를저장하는 테이블 
select * from department;
/*
    DNO: 부서 번호 
    DNAME: 부서명 
    LOC: 부서의 위치
*/

--3.월급 순위를 저장하는 테이블 
Select * from salgrade;

/*
    GRADE : 순위 <--월급의 순위 
    LOSAL : 제일 낮은 연봉 
    HISAL: : 제일 높은 연봉 
*/
---------------------------
--select : 츨력해라 
--컬럼 , 필드, 엔티티 
--레코드 : 각 컬럼에 들어간 값 : 1라인
--레코드셋: 레코드들의 집합 
select * 
from employee;

--특정 컬럼만 출력하기
select eno
from employee; 

--특정 컬럼 여러개 출력하기 (하나의 칼럼이 끝날 경우 , 로 구별)
select salary, ename,salary
from employee;

--모든 컬럼 출력하기 (특정컬럼 여러번 출력도 가능) 
select eno, eno, ename, job, manager,hiredate,salary,commission,dno
from employee;

--특정 칼럼만 출력시 여러번 출력하기 
select eno, ename, salary, ename, ename
from employee;

-- 테이블의 구조 확인 하기 : 테이블의 컬럼들을 확인
DESCRIBE employee;
DESC employee;


--컬럼을 별칭으로 출력하기 ( as 별칭 )
select eno as 사원번호, ename as 사원명, job as 직책 
from employee;

--employee 테이블의 모든 칼럼을 별칭으로 출력하기 
select eno 사원번호, ename 사원명, job 직책, manager 상관번호,
   hiredate 입사일, salary "월#급", commission 보너스, dno "부서 번호"
    from employee;

--조건을 사용하여 출력하기 : Where
--순서 중요 

select * 
from employee
where eno = 7499; --조건을 사용해서 출력 할 경우, eno 컬럼의 값이 7499]

desc employee; -- <==employee 테이블의 구조를 확인

--값을 출력시 : number 데이터 타입의 값은 ''없이 출력 
--  number이외의 데이터 타입은 '' : char, varchar, date 

select * from employee
where job = 'MANAGER'; -- Job (varchar2), 값을 가져올때는 대소문자를 구별
    --job 
desc employee;

--부서 번호가 20번인 모든 컬럼을 출력해라 
select * from employee
where dno = 20;

--<문제>
--salary (월급) 2000만원 이상인 사용자만 모든 컬럼 출력 
--이름이 CLARK인 사용자의 월급만 출력 
--사원번호(ENO) 가 7788인 사용자의 이름과 입사 날짜를 출력 <==컬럼이름을 별칭으로 출력 

--1
select * from employee
where salary >= 2000;

--2
select salary 월급 ,ename 사원명, eno 사원번호 
from employee
where ename = 'CLARK';

--3
select ename 사원명, hiredate 입사일,eno 사원번호 
from employee
where eno = 7788;

--select 문의 전체 구조 --
select --컬럼명 ㅣ * (모든컬럼) , (컬럼단위) 
from --  테이블 명, 뷰이름 
-- ================필수
where -- 조건
group by   --특정 컬럼의 동일한 값을 그룹핑 
Having -- group by 에서 나온 결과를 조건처리 
Order by -- 정렬해서 출력 할 칼럼, asc : 내림차순 정렬, desc ; 오름차순 정렬 (제일마지막)

select dno
from employee;

select distinct dno 부서번호
--distinct : 중복된 값은 제거 후 출력, 다른 컬럼과 동시에 작성 시 오류 발생  
from employee;


select 
distinct dno,eno --오류발생 , 하나의 컬럼만 제거 가능 
from employee;

--컬럼에 연산을 적용 : 컬럼명이 없어짐, alias(별칭) 해서 출력
select eno, ename, salary as 월급 , salary * 12 as 연봉, commission
from employee;

--전체 연봉 구하기 월급 * 12 + 보너스 = 전체 연봉 
-- null 값이 있는 경우 = 처리가 안되면 전체 다 null. 
-- null 과 연산(+,-,*,/)을 하게되면 전체가 NULL 
select eno, ename, salary, commission, salary * 12 as 연봉, (salary * 12) + commission as 전체연봉
from employee;

 -- 전체 연봉을 계산할 때 null 이 들어간 칼럼을 0으로 변경 후 연산을 적용해야한다. 
    -- nvl 함수 : null 이 들어간 컬럼을 다른 값으로 변환해서 처리해주는 함수 
    -- nvl (commission, 0) <== commission 컬럼에 null 을 0으로 수정해서 처리해라 

select eno, ename, salary, commission, salary * 12 as 연봉, (salary * 12) + nvl(commission, 0) as 전체연봉
from employee;

--null이 들어간 컬럼을 출력하기 <== 주의 
select *
from employee
where commission is not null;

-- where 조건에서 and, or 사용하기 

-- 부서 번호가 20번인 모든 컬럼 출력 
select * 
from employee
where dno = 20 or salary > = 2000;

select *
from employee 
where dno = 20 and salary <=1500;

-- job (직책) Manager이면서 월급이 2000이상인 사용자만 출력 
select *
from employee 
where job = 'MANAGER' and salary >=2000;
