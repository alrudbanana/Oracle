/*
    조인,뷰,인덱스 
*/

/*
    조인( JOIN ) : 두개 이상의ㅡ 테이블의 컬럼을 출력시 join을 사용해서 컬럼의 정보를 가져온다. 
    employee , department 테이블은 원래 하나의 테이블이었다. 
    모델링(중복제거,성능향상)을 사용해서 두 테이블로 분리 
    두 개 이상의 테이블에 컬럼을 가져오기 위해서는 JOIN문을 사용해서 출력 
    두 테이블을 JOIN하기 위해서는 두 테이블에서 공통의 키 컬럼이 존재해야한다.
    ANSI 호환 JOIN : 모든 SQL에서 공통으로 사용하는 JOIN 구문 
        Oracle, My_SQL(MariaDB) , MS-SQL, IBM DB2, .... <== DBMS 
        
*/

select * from employee;
select * from department;

-- EQUI JOIN : 오라클에서 제일 많이 사용하는 JOIN <== Oracle에서만 사용 
    --ANSI 호환의 SQL구문에서 INNER JOIN과 같은 구문 
        --두 테이블에서 공통으로 적용된 값만 출력해준다. <교집합>
        --주의 , select 절에 공통 키 컬럼을 출력시, 테이블을 명시해야한다.  
        --FROM절에 : INNER JOIN키를 사용해서 JOIN 
        --on 절에 공통의 키 컬럼을 ' = '로 처리 
        --where 에서 조건을 처리함
        
select eno as 사원번호, ename as 사원명, employee.dno as 부서번호, dname 부서명, loc 부서위치
from employee, department   --조인할 테이블 나열: ,
where employee.dno = department.dno -- 두 테이블의 공통의 키 컬럼을 찾아서 : "=" 로 처리 
and employee.dno >= 20 ; --조건을 처리

select eno, ename, salary, hiredate, e.dno,dname,loc
from employee e, department d --테이블 이름을 별칭 이름으로 사용 
where e.dno = d.dno; <== 두 테이블의 공통 KEY 컬럼 (명시)


--전체내용출력 
select eno 사원번호, ename 사원명, e.dno 부서번호, dname 부서명, loc 부서위치 
from employee e INNER JOIN department d
on e.dno = d.dno        --두 테이블의 공통의 키 컬럼을 '=' 로 처리 , and 대신 on
where e.dno >= 20;  --and 대신 where

    drop table ename
-- employee, department 테이블의 사원명, 월급, 입사월, 입사일, 부서명과 부서위치,부서번호를 출력하되
-- 월급이 2000 이상인 사원만 출력 해보기 

    --    EQUI JOIN (등가)<== ORACLE에서만 사용됨.
    select ename 사원명, salary 월급, hiredate 입사일, dname 부서명, d.dno 부서번호, loc 부서위치  
    from employee e , department d
    where e.dno = d.dno -- 공통의 key 컬럼을 찾아서 where 
    and e.salary >= 2000;
    
    alter table employee drop column ename aaaa;
    
    --    ANSI 호환  INNER JOIN문으로 출력: 모든 SQL에서 공통으로 사용됨.
    
    select ename 사원명, salary 월급, hiredate 입사일, dname 부서명, d.dno 부서번호, loc 부서위치  
    from employee e INNER JOIN department d
    on e.dno = d.dno --( where 대신 on 절)
    where e.salary >= 2000;
    
    --두 테이블을 JOIN 해서 부서별 월급의 최대값을 출력 ( employee, department)
    --부서이름과 부서번호를 출력
      select dname 부서이름, d.dno 부서번호, max(salary), count(*)
      from employee e, department d
      where e.dno = d.dno
      group by dname, d.dno;
        
        
    select dname 부서이름, d.dno 부서번호, max(salary), count(*)
    from employee e INNER JOIN department d
    on e.dno = d.dno
    group by dname, d.dno;
        
    
    select * from department;
    select * from employee;
    
    
    -- NATURAL JOIN : ORACLE 9i지원 
        --두 테이블을 join시 두 테이블에서 공통의 키 컬럼을 찾아야한다. 
        -- 두 테이블의 공통의 키 컬럼을 oracle내부에서 찾아서 처리함 
        -- EQUI JOIN레서 where 절의 두 테이블의 공통의 키 컬럼을 명시 하지 앟아도됨( WHERE절 없앰)
        -- where 절 생략시 오라클에서 두 테이블의 공통 키 컬럼을 자동으로 찾아준다
        -- 두 테이블의 공통키 컬럼은 동일한 타입이여야 함
        -- select 절에서 공통 키 컬럼을 출력시 테이블명을 명시하면 오류발생됨
        -- form 절에 natural join을 사용함.
        
    -- NATURAL JOIN을 사용해서 출력하기 
    -- 주의 : SELECT 문에서 두 테이블의 공통의 키 컬럼을 출력시 테이블 이름을 명시하면 오류 발생 
    -- 
    select eno,ename,salary,dno,dname,loc
    from employee  NATURAL JOIN department ;
   --where 절이 생략되어 자동으로 oracle내부에서 key 컬럼을 자동으로 찾음 
    /*
    SELECT 절에서 두 테이블의 공통의 키 컬럼 출력시 
        --EQUL JOIN (INNER JOIN) ==> 반드시 키 컬럼 앞에 테이블명을 명시해야함 
        --NATURAL JOIN ==> 키 컬럼 테이블 이름을 명시하면 오류발생  
    */
    
    --<문제> 사원이름,월급,부서이름,부서번호를 출력하되 월급이 2000이상인 사용자만 출력 
    -- EQUI join(등가조인) : Oracle만 사용 
    -- Natural join : Oracle만 사용 <== 두 테이블의 공통키 커럼을 oracle에서 찾
    -- ANSI 호환 : 모든 sql에서 사용 
    
    --1.EQUI join(등가조인)
    select ename 사원이름, salary 월급, dname 부서이름, e.dno 부서번호 
    from employee e, department d
    where e.dno = d.dno
    and salary >= 2000;
    
    --2.Natural join 
    select ename, salary, dname, dno
    from employee NATURAL JOIN department
    where salary >= 2000;
    
    --3.ANSI 호환 : 모든 sql에서 사용 
    select ename 사원이름, salary 월급, dname 부서이름, e.dno 부서번호 
    from employee e INNER JOIN department d
    on e.dno = d.dno
    where salary >=2000;
    
    --NON EQUI JOIN : 
        --from 절에 테이블로 , 로 나열 
        --where 절에 '='을 사용하지 않는 JOIN구문 <== 공통 키 컬럼없이 JOIN 
        
    --월급에 대해서 등급을 출력하는 테이블
    select * from salgrade;
    
    --사원 정보를 출력하는 테이블 
    select  * from employee;
    
    --employee, salgrade 테이블을 조인해서 각 사원의 월급의 등급을 출력 
    select ename 사원이름, salary 월급, s.grade
    from employee e ,salgrade s --from 절에서 테이블을 ,로 나열됨(EQUI JOIN)
    where salary between losal and hisal;
    
    --employee, department, salgrade 테이블을 JOIN해서 
        --사원이름, 부서이름, 월급, 월급의 등급 
select ename 사원이름, dname 부서이름, salary 월급, grade 월급의등급 
from employee e, department d, salgrade s
where e.dno = d.dno     --employee 테이블, department 테이블 
and salary between losal and hisal;


    --사원번호, 입사일, 부서번호, 월급, 월급의 등급, 부서명
    --세개의 테이블 join
    select eno 사원번호, hiredate 입사일,salary 월급, grade 월급의등급, e.dno 부서명
    from employee e, department d, salgrade s
    where e.dno = d. dno
    and salary between losal and hisal;
    
/*
    INNER JOIN :90% (e.dno = d.dno)
    --EQUI JOIN, Natural JOIN : Oracle 
    --INNER JOIN: ANSI호환(모든 DBMS에서 공통으로 사용되는 구문)
*/
 
    
/* self join : 자신의 테이블(원본)을 가상의 테이블(원본을 복사한 테이블) JOIN함 
    --자신의 테이블을 다시한번 조인 
    반드시 테이블을 별칭이름을 만들고 별칭이름을 사용해서 JOIN 
    회사의 조직도를 SQL구문으로 출력할때, 직급상사가 누구인지를 출력할때 주로 사용.

*/

--관리자(직속상관)가 7788인 사원들 정보  ENO, ENAME, MANAGER 
SELECT eno 사원번호, ename 사원명, manager 직속상관 
from employee 
where manager = 7788
order by ename asc;

--직속상관의 정보를 출력 
select ename 사원명, eno 사원번호, manager 직속상관 
from employee
where eno = 7788;

select * from employee;

--self join을 사용해서 자신의 테이블을 JOIN해서 사원에 대한 직속 상관정보를 한번에 출력 


--EQUIE JOIN을 사용해서 self join 출력 
select e.ename 사원이름, e.manager 직속상관번호,m.eno 직속상관번호 , m.ename 직속상관이름
from employee e, employee m -- 두 테이블 모두 employee 테이블 , 반드시 별칭이름을 사용 
where e.manager = m.eno 
order by e.ename asc;

select eno,ename,nvl( manager,0) || ' |' || eno ,ename,manager
from employee;


select e.ename || ' 의 직속상관은 ' || m.ename || '입니다.'
from employee e INNER JOIN employee m
on e.manager = m.eno
order by e.ename asc;

select eno,ename,manager,eno,ename,manager
from employee;

/* Outer Join : 
    -- 특정 컬럼의 내용은 두 테이블에 공통적이지 않는 내용도 출력해야 할때
    null 출력 
    + 를 사용해 Outer Join , oracle 
    ansi 호환 구문을 사용할 때 : outer join 구문을 사용함
        LEFT OUTER JOIN , LEFT OUTER JOIN
        RIGHT OUTER JOIN, RIGHT JOIN
        FULL OUTER JOIN,FULL JOIN

*/

--EQUI JOIN을 사용해서 Inner join OUTER JOIN
select e.ename || ' 의 직속상관은 ' || m.ename || '입니다.'
from employee e, employee m
where e.manager = m.eno;    --e.manager와 m.eno 값이 일치하는 내용만 출력 (13개 레코드 출력)

select e.ename || ' 의 직속상관은 ' || m.ename || '입니다.'
from employee e, employee m
where e.manager = m.eno(+); --m.eno 컬럼의 내용은 e.manager 의 값이 없더라도 무조건 출력 


-- ANSI 호환에서 Outer Join 
    --LEFT Outer Join , Left Join   : 왼쪽 테이블의 내용은 매칭되지 않더라도 무조건 출력 
    --Right Outer Join, Right Join  : 오른쪽 테이블의 내용은 매칭되지 않더라도 무조건 출력
    --Full outer Join , Full Join   : 왼쪽, 오른쪽 모두 매칭되지 않는 내용도 무조건 출력 
    
select e.ename ||' 의 직속상관은 ' || m.ename || '입니다'
from employee e Left Outer JOIN employee m 
on e.manager = m.eno
order by e.ename asc;

/* 카디시안 곱 : 왼쪽 테이블의 하나의 레코드에서 오른쪽 테이블의 모든 레코드를 곱
    employee : 14
    department : 4
    카디시안 곱 : 14 * 4 = 56 / 개의 레코드가 출력 되어야..
*/


select count  (*) from employee;
select count  (*) from department;

-- inner Join : e.dno = d.dno 가 매칭되는 내용만 출력 
    --Equie Join : oracle 구문으로 출력 
-- employee(14), department(4) 카디시안 곱 :56
select * 
from employee e, department d 
where e.dno = d.dno ;-- e.dno 와 e.dno가 같은 것을 출력 (이너 조인)


select * 
from employee e, department d 
where e.dno = d.dno(+);
