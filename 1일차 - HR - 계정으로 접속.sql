show user;


--1. HR 계정으로 접속 확인 : resource : 테이블 생성, 수정, 삭제
show user; 

--2. 테이블 생성, 세미콜론까지가 하나의 명령어를 실행 
create table myTbl2 (
    id varchar2 (20),
    pass varchar2 (20)
    );

--3. 테이블의 값 넣기 : commmit (저장하라) 
insert into myTbl2 values ( '1', '1234');
commit;    --DB에 영구적으로 저장하라. (Insert, Update, Delete 구문에서 사용)


--4. 테이블의 값을 출력하기 
select * from myTbl2;

--5. 테이블 삭제하기 

drop table myTbl2;

-- 원격 접속한 Oracle버전 확인 
select * from v$version;

--접속한 datbase 에 존재하는 모든 테이블 보기 
select * from table;

select * 
from employee;

--<문제1> 컬럼 알리어스<별칭>, commission (보너스) 컬럼의 null인 값만 출력하되 사원번호, 사원이름, 입사 날짜를 출력
select eno 사원번호, ename 사람이름, hiredate 입사날짜, commission 보너스
from employee
where commission is null;
--<문제2> dno(부서 번호) 가 20이고, 입사 날짜가 81년4월이후 사원의 이름과 직책과 입사날짜를 출력
select ename 사람이름, hiredate 입사날짜, job 직첵
from employee
where dno = 20 and hiredate >= '81/04/01';
--<문제3> 연봉을 계산해서, 사원번호, 사원이름, 월급, 보너스, 전체 연봉을 출력
select eno 사원번호, ename 사원이름, salary 월급, commission 보너스, (salary * 12) + nvl(commission, 0)as 전체연봉
from employee;
--<문제4> commission 이 null이 아닌 사용자의 이름만 출력
select ename 사용자이름
from employee
where commission is not null;
--<문제5> manager (직급상시) - 7698 인 사원이름과 직책을 출력.
select manager 직급상시 , ename 사원이름, manager 직책 
from employee
where manager = 7698;
--<문제6> 월급이 1500 이상이고 부서가 20인 사원의 사원이름과 입사날짜 부서번호,월급을 출력
select ename 사원이름, hiredate 입사날짜, dno 부서번호, salary 월급 
from employee
where salary > 1500 or dno =20;
--<문제7> 입사 날짜가 81년 4월 이상이고 81년 12월 미만인 사용자들을 출력 
select hiredate 입사날짜, ename 사원이름
from employee
where hiredate >='81/04/01' or hiredate < '81/12/01';
--<문제8> 직책(job) salesman 이면서 월급이 1500이상이면서 부서번호가 30인 사원명을 출력
select job 직책, salary 월급, dno 부서번호 
from employee
where job = 'SALESMAN' and salary  > 1500 and dno = 30;
--<문제9> 월급이 1500이하이면서 부서번호가 20번이 아닌 사원이름과, 월급과 부서번호를 출력
select salary 월급, ename 사원이름, dno 부서번호 
from employee
where salary <= 1500 and dno !=20;
--<문제10> 사원번호(eno) 가 7788, 7782인 부서번호와 이름과 직책을 출력 
select dno 부서번호, ename 이름, job 직책 
from employee
where eno = 7788 or eno = 7782;

*/
select * from employee;