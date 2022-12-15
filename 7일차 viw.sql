/* view , INDEX 
*/
show user;

select *from user_view;

select * from user_indexes;

/* VIEW : 가상의 테이블, 가상으로 만들어 놓은 테이블 , 데이터가 저장되어 있지 않다. 
    실제테이블의 값을 SELECT 하는 코드만 들어가있다
    목적: 1. 보안을 위해서 사용하는 경우 : 실제 테이블의 특정컬럼을 숨겨서 처리 
         2. 편의성을 위해서 사용하는 경우 : 복잡한 구문을 VIEW로 만들어서 처리 
            JOIN구문 , 복잡한 구문 
    
*/

--VIEW 실습을 위한 샘플 테이블 생성 
create table emp100
as 
select * from employee;

select * from emp100;

--view 생성 :  1. 보안을 위해서 사용하는 경우 
    --view 는 실제 테이블의 주로 select 구문을 저장하고 있다 
    --view 는 가상의 테이블. 데이터를 저장하고 있지 않다.
    --실제 테이블의 실행 코드만 들어있다. 

-- 보안을 위해 생성한 view : 실제 테이블의 특정 컬럼을 출력하지 않을 수 있다. 
create view V_emp
as 
select eno, ename, salary from employee;

-- view 를 실행 : select * from view 명 
select * from V_emp;

--view 정보를 감은 데이터 사전 
select * from user_views;

--view 의 내용을 수정 : 주의 : oracle에서는 alter view가 없다. 
    --create or replace view 구문을 사용 
create or  replace view V_emp 
as
select * from employee;

--view 삭제 
drop view V_emp;


--2. 편의성을 위해서 view 를 사용함.: 복잡한 조인 구문을 VIEW로 생성을 하고 view를 SELECT하면 된다. 
    --VIEW를 select하면 된다. 
-- 사원이름, 상사이름을 바로 출력하는 쿼리 : self조인을 사용해서 
create view v_emp02
as
select e.ename 사원이름, e.ename 상사이름 
from employee e , employee m 
where e.manager = m.eno;

--view실행 
select * from V_emp02;

-- 사원명, 월급, 부서번호, 부서위치를 출력하는 view생성 : v_emp_dept
create table v_emp_dept
as 
select ename 사원명, salary 월급, e.dno 부서번호, d.loc 부서위치
from employee e , department d
where e.dno = d.dno;

select * from v_emp_dept;

/*
뷰 처리과정 
view 는 가상의 테이블이고 값을 가지고 있지 않다.]
1. view는 가상의 테이블이고 값을 가지고 있지 않다. (select,join)
2. 실행 쿼리만 가지고 있다. (select)

---

1. user_view의 데이터 사전에서 뷰이름에 대한 쿼리를 조회 
2. 접속한 계정이 실제테이블에 접근할 수 있는 권한이 있는지 확인 
3. 각 테이블에 권한이 있으면 쿼리를 실행 
4. 검색(값을가져온다)
5. 출력
*/

--view를 사용해서 값을 넣을 수 있다. 
    --view에는 값이 저장되지 않는다. 코드만 존재함 
    -- 값은 실제테이블에 저장됨 
    --실제 테이블에 제약조건에 따라서 값이 저장될 수도 있고 안될수도 있다.
select * from emp100; --테이블을 복사 했으므로 제약 조건이 모두 빠져있다 

--테이블의 제약조건을 확인 하는 데이터 사전 
select * from user_constraints
where table_name in('EMP100');


--view 생성 
create or replace view V_emp10
as 
select eno,ename,salary
from emp100;

--뷰를 출력 
select * from V_emp10;

--view에 값 넣기 <= 실제 테이블에 저장됨(emp100)
insert into v_emp10
values (8888,'KORAN',600);
commit;

--view에 값을 넣으면 실제테이블에 값이 들어감 
select * from emp100;

--view에 값을 저장시 실제 테이블에 저장이 되면서 실제 테이블에 제약조건에 따라서
    --값이 저장될 수도 있고 그렇지 않을 수도 있다. 
-- view를 사용해서 값을 삭제 : 실제 테이블 : emp100
delete v_emp10
where eno =8888;
commit;

select * from v_emp10;

--alter table 를 사용해서 hiredate컬럼에 NOT NULL 제약 조건을 추가 
    --not null, default 수정할때 modify
alter table emp100
modify hiredate constraint EMP100_HIREDATE_NN not null ;

select * from user_constraints
where table_name = 'EMP100';

--테이블에 제약 조건위배로 view에서 값을 넣을때 오류가 발생 
select * from v_emp10;

--hiredate 컬럼에 ㅜ값을 넣지 않아 값이 안들어감 
insert into V_emp10
values(9999,'CANDY',7000);


/*1. 단순뷰(Simple View) : 하나의 테이블로 생성된 view
2. 복합뷰(Complex View) : 두게이상의 테이블로 생성된 view
    1. 뷰 내에서는 DISTINCT, 그룹함수(SUM, AVG, MAX, MIN), Group by
        
        , ROWNUM 을 사용하지 못한다. 
        
        —단 , 그룹함수를 사용 할 경우 반드시 별칭이름을 사용해야 사용 가능
        
*/
-- rownum  : 레코드의 숫자를 출력해줌, ROW의 넘버를 출력 <==레코드가 많을 때 조건을 사용해서 출력 
select rownum, eno, ename, salary
from employee
where rownum <10 ;

-- 중복된 값을 제거 : 직급의 종류 
create or replace view v_emp30
as 
select rownum, eno,ename from emp100;

--view 내부에 rownum 컬럼에 별칭이름을 사용할 경우 사용가능  
create or replace view v_emp30
as
select rownum 행번호,eno,ename from emp100;


select * from v_emp30;

--view내부에 distinct  를 사용하면 오류 발생 
create or replace view v_emp31
as
select distinct job from emp100;

select * from v_emp31;

--view 내부에서 그룹함수를 사용했을때 : SUM, AVG, MAX, MIN, COUNT(*)
-- 각 부서별로 월급의 합계, 평균, 최대값, 최소값, count(*) 
create or replace view v_emp32
as
select SUM(salary) 합계, round (AVG(salary)) 평균 ,
max(salary) 최대값 , min (salary) 최소값
from emp100;

select * from v_emp32;

--view 내부에서 group by를 사용할 경우 별칭을 사용해야 오류가 발생하지 않는다. 
--각 부서별로 월급의 합계, 평균, 최대값,최소값, count(*)

create or replace view v_emp33
as
select sum(salary) 부서별합계, round(AVG(salary),2) 부서별평균, max(salary) 부서별최대값, 
min(salary) 부서별최소값, count(*) 그룹된갯수
from emp100
group by dno;

select * from v_emp33;

/*
    뷰를 생성시 옵션 사용 
    --force 옵션: 기존 테이블 생성 유무에 상관없이 뷰를 생성
    --nonforce 옵션: 반드시 기존 테이블에 존재해야만 생성<<기본값>>
*/

create or replace view v_emp34
as 
select * from emp101;   --emp101 table이 존재하지 않아서 오류 발생 

--force 옵션을 사용해서 해당 테이블이 존재하지 않더라도 강제로 생성 
    --해당 테이블은 나중에 만들 수 있다. 
create or replace force view v_emp34
as 
select * from emp101;

---view 생성 이후에  테이브블 생성 
create table emp101
as 
select * from employee;

select * from user_views;

select * from user_views;


/*
    index(인덱스,색인) : 테이블의 컬럼에 검색을 빠르게 하기 위해 컬럼에 index를 생성 
                    select 를 빠르게 하기 위해서 사용 
                    테이블 스캔 : 검색할 내용을 첫 레코드 부터 마지막 레코드 까지 순차적으로 검색 
                    -- 검색할 내용을 찾기 위해서 책의 첫장 부터 마지막 장까지 검색 
                    index가 생성되어있지 않는 컬럼의 내용을 검색할때는 테이블 스캔을 한다. 
                    index 정보를 사용한 스캔 : 검색이 빠르다. 
                    index를 사용해서 정보를 검색 
                    책의 색인,목차 (index) 
                    where 절에서 사용되는 컬럼
                    JOIN시 ON절에서 사용되는 컬럼 
                    
                    테이블의 index정보를 출력하는 데이터 사전 
                    select * from user_indexes
                    where table_name in ('EMPLOYEE','DEPARTMENT);
                    select * from user_columns
                        where table_name in ('EMPLOYEE','DEPARTMENT);
                    select * from user_ind_columns
                    where table_name in ('EMPLOYEE','DEPARTMENT);
                    
*/


/*
*/


-- ename컬럼은 인덱스가 생성되지 않아서 테이블을 스캔한다.
select * from employee 
where ename = 'KING';


select * from user_ind_columns
                    where table_name in ('TBL1','TBL2');
--index 자동 생성되는 컬럼: primary key, unique 컬럼은 자동을 index 생성됨
create table tbl1 (
    a number (4) constraint tbl1_a_pk primary key, --인덱스 자동생성
    b number (4),
    c number (4)
    );
    
create table tbl2 (
    a number(4) constraint tbl2_a_pk primary key,
     b number(4) constraint tbl2_b_uk unique ,
    c number(4) constraint tbl2_c_uk unique 
    );
    
-- 특정 컬럼에 index 부여하기 , where 절, join시 on절에서 사용되는 컬럼 
select * from employee;

-- employee 테이블의 ename 컬럼은 검색을 자주 사용한다.레코드가 10만개 존재한다. 
--컬럼에 index를 생성하면 컬럼의 값을 가지고 index페이지를 생성한다. 
--부하가 굉장히 많이 걸리는 작업. 야간에 index사용  

--DBA 과정에서 전문적으로 다룬다. 
    --index는 DBMS를 잘 이해하고 잘 생성해야한다. 
    --index는 잘못 만들면 오히려 성능이 떨어진다. 
    --주기적으로 index정보를 업데이트 해야함 (insertmupdate,delete)
        --rebulid
--index가 테이블의 어떤 컬럼에 index가 생성되었는지 확인 
select * from user_ind_columns
where table_name = 'EMPLOYEE';
--index의 자세한 정보를 출력 
select * from 

--employee 테이블의 ename컬럼에 index생성 
create index idc_employee_ename 
on employee(ename);

/* index는 생성후 지속적인 관리가 필요함 
    employee 테이블의 ename칼럼에 index를 생성함 
    ename 컬럼에insert,update,delete가 빈번하게 일어날 경우 index 페이지가 조각난다. 
    주기적으로 rebuild 해줘야한다. (index페이지를 업데이트 해야한다)
*/

--생성된 index 정보를 새로이 업데이트 
alter index idx_employee_ename rebuild; 
--ename컬럼의 수정된 정보를 index페이지에 새로이 업데이트 

select * from employee;

--employee 테이블에서 job 컬럼을 빈번하게 검색 
create index idx_employee_job
on employee (job); --인덱스 부여 

--데이터가 많으면 검색하는데 시간이 많이 소요되므로 검색하는데 인덱스가 많이 필요하다. 

--employee 테이블의 job 컬럼이 빈번하게 (update,delete,insert) 
    --주기적으로 수정될 경우 업데이트가 필요함 : 1주 ~ 1달
    --레코드가 적을때는 생성할 필요 X,10만건 이상되면 테이블 스캔으로 검색하는데 
        -- 시간이 오래걸릴 경우 INDEX 생성의 필요성이 있다 
alter index idx_employee_job rebuild;

select * from user_ind_colunmS
where table_name = 'EMPLOYEE';

--생성된 INDEX삭제 
drop index idx_employee_ename;
drop index idx_employee_job;

/* ERD : 데이터 베이스 모델링 , 설계도 
    --ER - WIN : 전세계적으로 제일 많이 사용한 모델링 툴 

*/

