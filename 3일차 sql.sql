--5. 일반 함수 
--NVL, NVL2, NULLIF,
--coalesce , 

--NVL 함수 : NULL을 처리하는 함수 
    --nvl(컬럼명, 
    

--case          : if ~ else if, else if 와 비슷한 구문 
/*
    case WHEN 조건 1 THEN 결과 1
         WHEN 조건 2 THEN 결과 2
         WHEN 조건 3 THEN 결과 3
         ELSE 결과 n 
    END
*/
-- 부서 번호에 대한 부서명 출력 : case
select ename,dno,
    case WHEN dno = 10 then 'ACCOUNTING'
        WHEN dno = 20 then 'RESEARCH'
        wHEN dno = 30 then 'SALES'
        else 'DEFAULT'
    END as 부서명 
from employee
order by dno;

--chapter 04 : 그룹함수 
/*
그룹함수 : 동일한 값에 대해서 그룹핑 해서 처리하는 함수 
    groub by 절에 특정 컬럼을 정의 할 경우, 해당 컬럼의 동일한 값을 그룹핑해서 연산처리 한다. 
    
집계 함수 : 연산을 처리하는 함수 
    -SUM : 합계를 구하는 함수 
    -AVG: 평균을 구하는 함수 
    -MAX : 최대값을 출력
    -MIN : 최소값을 출력 
    -COUNT : 레코드 수 ( 한 라인의 값이 저장된 ) , ROW (행)
    
    select 컬럼명 
    from 테이블명 , 뷰 (가상으로 생성된 테이블)
    where 조건 <== 테이블에서 원하는 조건을 가지고 올 때
    group by 그룹핑 할 칼럼 
    having group by 를 사용해서 나온 결과를 조건 처리 
    order by 정렬 
*/
-- 집계 함수를 컬럼에 사용하면 단일 행으로 출력됨 
select salary as 월급, sum (salary) as 합계, avg (salary) as 평균, 
    MAX(salary) as 최대월급, MIN(salary) as 최소월급 
from employee;

select --salary, 
    sum (salary) as 합계, round(avg (salary),2) as 평균, 
    MAX(salary) as 최대월급, MIN(salary) as 최소월급 
from employee;

-- 집계함수는 NULL 을 0으로 자동으로 처리해서 연산 
select commission
from employee;

select SUM(commission), AVG(commission), MAX(commission), MIN(commission)
from employee;

--count 함수 : 레코드수, row (행) 의 수
    --NULL은 카운트 되지 않는다.
select count(eno) as 레코드수 
from employee;

select manager 
from employee;

select count(manager) 
from employee;

select count(commission) -- 보너스를 받는 사원수 : 4명 
from employee;

--특정 칼럼을 count 함수를 사용하면 전체 레코드 수를 부정확하게 출력할 수 있다.
    -- NOT NULL 정의된 컬럼을 카운트 해야한다. 
desc employee;

select * from employee;

--테이블의 전체 레코드 수를 출력 시 : NOT NULL 로 지정된 컬럼이나, * 를 사용해서 Count 해야한다.  
select count ( eno ) from employee;
select count ( * ) from employee;

--직업의 개수를 출력 , 중복된 값 제거 
select count(distinct job) 
from employee;

--부서의 개수 
select count(distinct dno) 부서개수
from employee;

-- 부서별로 급여의 합계 , 평균, 최대값, 최소값 구하기 : group by <==컬럼의 동일한 것을 값 그룹핑
select * 
from employee
order by dno asc;


select SUM(salary) 부서별월급합계, round(AVG(salary),2)부서별월급평균, 
MAX(salary) 부서별최대월급, MIN(salary)부서별최소월급,dno
from employee
group by dno    --dno컬럼의 동일한 값을 그룹핑
order by dno;

-- 직책 별로 월급의 합계, 평균, 최대값, 최소값을 출력.
select sum(salary) 직책별월급의합계, round(avg(salary)) 직책별월급의평균, max(salary) 최대값, min(salary),job
from employee
group by job
order by job;

select * 
from employee
where job = 'ANALYST';

-- group by 에서 나온 결과를 조건으로 처리해서 출력 : having <조건>
    --having : 별칭 이릉을 사용해서 조건을 처리하면 오류가 발생 , 연산한 것을 입력 
    --출력한 내용 중에 평균 월급이 2000만원 이상인것만 출력
select sum(salary) 직책별월급의합계, round(avg(salary)) 직책별월급의평균,
    max(salary) 최대값, min(salary),job
from employee
group by job
having round( avg(salary) ) >= 2000 --group by를 사용해서 나온 결과에 대한 조건 처리 
order by job;

-- having 절에서 별칭이름을 사용할 경우 오류 발생 <==<<주의>> 
select sum(salary) 직책별월급의합계, round(avg(salary)) 직책별월급의평균,
    max(salary) 최대값, min(salary),job
from employee
group by job
having round( avg(salary) ) >= 2000 --group by를 사용해서 나온 결과에 대한 조건 처리 
order by job;

--where : 테이블의 값을 조건을 주어서 가지고 올때 사용 
--having : group by를 사용해서 나온 결과를 조건으로 출력 

-- 20번 부서는 제외하고 부서별 합계, 평균, 최대값, 최소값을 구하되 부서별 최소월급이 1000만원 이상인 것만 출력 
select sum(salary) 부서별합계, round(avg(salary)) 평균,
max(salary) 최대값, min(salary) 최소값,dno
from employee
where dno not in (20)
having min (salary) >= 1000
group by dno
order by dno;

--두 컬럼이상을 그룹핑하기 : 두 컬럼 모두 동일할때 그룹핑 처리됨. 
select dno, job 
from employee
order by dno, job;

-- count (*) 를 사용하면 중복된 레코드가 몇개인지 확인 가능 
select sum(salary), round (avg(salary)), max(salary), min(salary), dno,job,count(*)
from employee
group by dno ,job     -- 두컬럼 둘 다 동일한 것을 그룹핑한다.
order by dno, job;

--group by를 사용하면서 select절에 출력할 칼럼 
    --집계함수(sum,avg,max,min),count(*),group by 절에 사용된 컬럼.

-- Rollup : 마지막라인에 전체 합계, 전체 평균을 추가적으로 출력 
select sum(salary), round( avg(salary)), max(salary), min(salary), dno, count(*)
from employee
group by dno
order by dno desc;

--rollup사용 
select sum(salary), round( avg(salary)), max(salary), min(salary), dno, count(*)
from employee
group by rollup(dno)
order by dno;

-- ========ename이 SCOTT인 사원과 동일한 부서의 사원을 출력 
select * from employee;
/* sub query 를 사용하지 않고 출력 
    --1. SCOTT의 부서를 확인
    --2. SCOTT의 부서와 동일한 부서를 조건을 사용해서 출력 
*/
   --1. SCOTT의 부서를 확인 
    select ename, job from employee where ename = 'SCOTT';
    --2. SCOTT의 부서와 동일한 부서를 조건을 사용해서 출력 
    select ename, job from employee where job = 'ANALYST';
    
    --sub query를 사용해서 한 라인에서 출력 
    select ename, job from employee where job = (select job from employee where ename = 'SCOTT');
    
select *from employee;

    -- SMITH와 동일한 직책의 사원들을 sub query를 사용해서 출력 
    select ename, job from employee where job = (select job from employee where ename = 'SMITH');

    --Scott 과 동일한 부서에 근무하는 사원들 출력 
    select ename, dno from employee where dno = (select dno from employee where ename = 'SCOTT');
    
    --scott보다 월급이 많은 사용자, 서브쿼이한 결과값이 단일값으로 출력되어야 한다.
   select ename, salary from employee where ename = 'SCOTT';
   
    select ename, salary from employee where salary >(3000);
    
    --최소 급여를 받는 사원들 이름,담당업무,급여 출력 
    select ename, job, salary from employee where salary = (select min (salary)from employee);
    
    select min(salary)
    from employee ;
    
    --30번 부서의 (dno)의 최소 급여보다 큰 부서를 출력
    --각 부서의 최소 급여를 구함 
    --30부서의 최소 급여보다 큰 부서를 출력 
    select dno, min(salary), count(*)
    from employee
    group by dno
    having min(salary) > (select min(salary) from employee where dno = 30)       -- 30번 부서의 최소 급여를 
    order by dno;
    
    /* sub query 에서 단일 값이 아니라 여러개의 값이 출력될 경우 : IN 연산자를 사용 

    */
    -- 각 부서별로 최소 급여를 받는 사원의 번호와 이름을 출력 
    select ename 사원번호, eno 사원번호 
    from employee
    where salary in (
    select min(salary)from employee
    group by dno
    ); --sub query : 부서별로 최소 월급을 출력
    
    --ALL연산자 : sub query 에서 반환하는 모든 값을 비교 
    -- '> all' : 최대 값 보다 큼을 나타냄
    --  '< all' : 최소값 보다 작음을 나타냄 
    
--직급이 salesman이 아니면서 직급이 salesman 인 사원보다 급여가 적은 사원을 모두출력 
select * from employee
order by job asc;

select eno, ename, job, salary
from employee
where salary < all (select salary from employee
                    where job = 'SALESMAN')
    and job <> 'SALESMAN';
    
--담당업무가 분석가 인 사원보다 급여가 적으면서 업무 분석가가 아닌 사원들을 표시하세요 
select eno, ename, job
from employee
where salary < all(select salary from employee where job = 'ANALYST')
            and job <> 'ANALYST'
order by job;


