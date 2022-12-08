--모든 평균은 소숫점 2자리까지 출력하되 반올림 해서 출력 하시오.  
--1.  10 번 부서를 제외하고 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오. 
select sum(salary) 월급의합계 , round(avg(salary),2) 월급의평균 ,max(salary) 월급의최대값 ,min(salary) 월급의최소값, dno
from employee
where dno not in 10
group by dno
order by dno;

--2.  직책의 SALSMAN, PRESIDENT, CLERK 을 제외한 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오.   
select sum(salary), max(salary), min(salary), dno,job
from employee
group by dno,job
having job not in ('SALESMAN' , 'PRESIDENT' , 'CLERK');

--3. SMITH 과 동일한 부서에 근무하는 사원들 의 월급의 합계와 평균과 최대값, 최소값을 구하시오.

select sum(salary) 월급합계, round(avg(salary),2) 월급의평균, max(salary) 월급의최대값, min(salary)월급의최소값
from employee
group by dno
having dno in (select dno from employee where ename = 'SMITH');

--4. 부서별 최소월급을 가져오되 최소월급이 1000 이상인 것만 출력하세요. 
select min(salary)
from employee
group by dno
having min(salary) > 1000
order by dno;

--5.  부서별 월급의 합계가 9000 이상것만 출력
select sum(salary),dno
from employee
GROUP by dno
having sum(salary) > 9000
order by dno;

--6. 부서별 월급의 평균이 2000 이상만 출력
select round(avg(salary),2),dno
from employee
group by dno
having avg(salary) > 2000;

--7. 월급이 1500 이하는 제외하고 각 부서별로 월급의 평균을 구하되 월급의 평균이 2500이상인 것만 출력 하라. 
select round(avg(salary),2),dno
from employee
group by dno
having avg(salary) > 1500 
order by dno;

--8. sub query - 부서별로 최소 급여를 받는 사용자의 이름과 급여와 직책과 부서번호를 출력하세요. 
select ename,job,salary,dno
from employee
where salary in (
    select min(salary)from employee
group by dno);



--9. sub query - 부서별로 부서별 평균 급여보다 많이 받는 사용자의  이름과 급여와 직책과 부서번호를 출력하세요. 
select ename, salary,job,manager,dno
from employee
where salary > all (select round (avg(salary)) from employee)
order by dno;

--10. sub query - 직급이 SALESMAN이 아니면서 면서 급여가 임의의 SalesMan 보다 작은 사원을 출력
--            SALESMAN 의 최대 값이 1600 보다 작은 사원들을 출력
select eno, ename, job, salary
from employee
where salary < all (select salary from employee
                    where job = 'SALESMAN')
    and job <> 'SALESMAN';

--11. sub query - 급여가 평균 급여보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해 오름차순 정렬하시오. 