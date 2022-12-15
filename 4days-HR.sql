/*
    SQL(Structured Query Language) : 구조화된 질의 언어, 시퀄
        select 컬럼 
        from 테이블명, 뷰명
        group by 그룹핑할 칼럼명 
        having 나온결과에 대한 조건 
        order by 정렬할 칼럼 
        
    DDL(Data Definition Language) : 객체를 생성하고 수정, 삭제
            객체(Object) - Table,View,Function,Index,Store Procedure, Triger ...
        CREATE(생성), ALTER(수정), DROP (삭제)
        RENAME(객체이름변경), TRUNCATE(레코드삭제)
    DML(Data manufature Language) : 데이터 조작언어, 레코드를 생성, 수정, 삭제 
        INSERT(생성), UPDATE(수정), DELETE(삭제)
        --트랜젝션을 발생시킴. commit (DB에 영구저장), rollback (원래 상태로 되돌림) 
    DCL(Data control Language) : 데이터 제어 언어, 계정을 생성하고 권한을 부여하고 삭제할 때 사용.
        : GRANT (권한을 부여), REVOKE (권한을 취소) 
    DQL(Data Query Language) : 데이터 질의 언어(출력) : SELECT
    TCL(Transaction Control Language): 트랜젝션 처리 언어 
    
        BEGIN TRANSACTION : 트랜잭션 시작 (INSERT, UPDATE, DELETE <= DML )
        
        COMMIT : 트랜잭션을 종료 ( DB에 영구저장)
        ROLLBACK : 트랜잭션을 종료 ( 원래 상태로 되돌림, 트랜잭션 시작 전 상태로 되돌림)
        SAVEPOINT ( 트랜잭션 내의 임시 저장 시점 설정)
*/

--테이블 생성 (Create Table) 
create Table dept(          --생성할 테이블 명
    dno number(2) not null, --컬럼명 자료형 NULL허용여부(nuber(_) <- 자리수 notnull ( null을 넣을 수 없다)
    dname varchar2 (4) not null, --varchar2(4) 4자리 ,널 허용 불가
    loc varchar2 (13) null      --
    );
    
--테이블 구조 확인 
desc dept;


--테이블에 값 넣기 (INSERT INTO 테이블명(명시할 컬럼명) values (넣을값);
    --BEGIN TRANSATION 명시해도되고 안해도 ㄱㅊ

insert into dept (dno,dname,loc) 
values (10,'ACCO', 'SEOUL');

commit;
rollback;

--데이터 검색하기 
select * from dept;

-- => db정보가 아닌 메모리의 정보만 확인
/* 
    - 트랜잭션(TRANSATION): 작업(일)을 처리하는 최소단위
    DML (INSERT,UPDATE,DELETE문을 사용하면 자동으로 트랙잭션이 시작됨.)
        => 트랜잭션을 종료하지 않으면 외부에서 다른 사용자가 접근을 못함.
    
    - 트랜잭션 종료 
    1. COMMIT : DB에 영구저장
    2. ROLLBACK : 원래 상태로 되돌림, 트랜잭션 시작시점 
    
    -트랜잭션의 4가지 특징 
        a. 원자성 (Atomicity) : 여러 구문을 하나의 작업단위로 처리됨
        b. 일관성 (Consistency) : 트랜잭션에서 처리한 결과는 일관성을 가져야한다. 
        c. 독립성 (Isolation) : 하나의 트랜잭션이 처리되기 전까지는 다른 트랜잭션과 격리
        d. 지속성 (Durablity): commit 된 트랜잭션은 
    */
    
    
    select * from dept;
    desc dept;
--명시적으로 null 
--컬럼과 값의 순서가 맞아야한다. 
insert into dept (dno,loc,dname)
values(20,'BUSAN','SALE');

--컬럼명을 생략시 값 넣기 , 모든 컬럼에 값을 넣어줘야함 
insert into dept
values (30,'abc','Taegu');

--loc 컬럼의 값을 안넣을 수 있는 방법 : null 허용 
insert into dept (dno, dname)
values (30, 'abc');

commit;

-- 회원정보를 저장하는 테이블 생성 
create table member (
    id varchar2(50) not null primary Key ,
    pass varchar2(50) not null ,
    addr varchar2(100) null ,
    phone varchar(30) null,
    age number (3) not null,
    weight number (5, 2) not null
    );
    
/* 제약조건 : 데이터의 무결성을 확보하기 위해서 테이블의 컬럼에 부여 
        - 무결성 : 오류없는 데이터, 원하는 데이터 
    --primary key : 테이블에서 하나만 존재 할 수 있다.
        --primary key 가 적용된 컬럼은 중복된 값을 넣을 수 없다
        --데이터를 수정 할 때 삭제시 조건을 사용하는 컬럼.
        --인덱스가 자동으로 생성된다. <==검색을 빠르게 할때 사용됨
        --NULL을 넣을 수 없다. 
        
    --Unique : 중복된 값을 넣을 수 없다. 테이블에 여러번 넣을 수 있다.
        --NULL을 넣을 수 있다. 1번만 넣을 수 있다. 
        --인덱스가 자동으로 생성된다. <== 검색을 빠르게함. 
    --check : 값을 넣을 때 체크해서 값을 넣는다 .
    --not null : 컬럼에 NULL을 넣을 수 없다. 
    
*/

    desc member;

    insert into member (id, pass,addr,phone,age,weight)
    values ('aaaa','1234','서울 종로구','010-1111-1111',20,50.22);
    
    insert into member (id, pass,addr,phone,age,weight)
    values ('bbbb','1234','서울 종로구','010-1111-1111',20,50.22);
    
    insert into member (id, pass,addr,phone,age,weight)
    values ('cccc','1234','서울 종로구','010-1111-1111',20,50.22);

select * from member;

-- null허용 컬럼에 null넣기 
desc member;
insert into member
values ( 'dddd' , '1234' , null, null, 30, 70.55);
commit;

insert into member (id, pass,addr,phone,age,weight)
values ( 'eee' , '1234' , null, null, 40 , 60.55);
commit;
--수정 (update) : 반드시 where 절을 사용해서 수정해야함 
    --where 절에 사용되는 컬럼은 중복되지 않는 컬럼을 사용해서 수정 :primary key, unique
    --update 테이블 명 
    --set 컬럼명 = 바꿀값, 컬럼명 = 바꿁밧
    --where 조건 
select *from member;

update member 
set phone = '010-2222-2222', age = 55, weight = 90.55
where id = 'bbbb';
commit;

rollback

--update 시 중복되지 않는 컬럼을 조건으로 준 경우 
update member 
set phone = '010-3333-3333', age = 80
where pass ='1234';

update member
set phone = '010-3333-3333', age = 80
where id = 'eee';

commit;

-- delete : 반드시 where 조건을 사용해야 한다. 조건없이 삭제하면 모든 데이터가 삭제됨.
    -- 중복되지 않는 컬럼을 조건에 적용 : primary key, unique key
select * from member;

delete member
where id = 'cccc';

commit;
rollback;

--테이블 복사 (EMP)
create table emp 
as 
select * from employee;

--복사된 테이블 
select * from emp;
desc emp;
1. 값을 3 레코드 입력 , (=> 컬럼추가), 모든 값입력, null 이 허용된 컬럼에 null 값 넣기 
insert into emp 
values (8888,'jen','CLERK',1111,to_date('22/12/08' , 'YY/MM/RR'),1000,null,30);

insert into emp 
values (9999,'jen1','CLERK',2222,to_date('22/12/08' , 'YY/MM/RR'),1000,null,30);

insert into emp 
values (0000,'jen2','CLERK',3333,to_date('22/12/08' , 'YY/MM/RR'),1000,null,30);
commit;

2. update를 사용해서 데이터 수정
    영업사원드르이 보너스 300만원으로 수정 
    ward의 부서를 10번으로 수정 
    allen의 manager를 7839,월급을 1800, 입사월을 22/01/01로 수정 
select * from emp;
update emp 
set commission = 300
where job = 'SALESMAN';

update emp
set dno = 10
where ename = 'WARD';

update emp
set manager = 7839, salary = 1800, hiredate = '22/01/01'
where ename = 'ALLEN';

rollback;
commit;
3. delete : eno 7782 와 enon 6798의 레코드를 삭제 

delete emp 
where eno = 7782;

delete emp
where eno = 7698;

commit;

select * from emp;

/* Unique 제약조건 : 중복된 데이터를 넣을 수 없다. 
    - NULL을 넣을 수 있다. 1번만 넣을 수 있다. 
    - 테이블 특정 컬럼에 여러번 사용 가능 
    - 인덱스를 자동으로 생성 <=검색 성능 향상 
    - JOIN시 ON절, Where 조건 
*/

create table customer1 (
    id varchar(20) not null primary key, --오류발생, primary key : not null
    pass varchar(20) not null unique, --중복되지 않는 컬럼 
    name varchar(20) null unique, --중복되지 않는 컬럼,null허용 
    phone varchar(20) null unique,
    addr varchar(20) null 
    );
desc customer1;

insert into customer1 (id,pass,name,phone,addr)
values ('aaa','1234','홍길동','010-1111-1111','서울 종로');

select * from customer1;

--제약조건 확인하기 
select * from user_constraints
where TABLE_NAME = 'CUSTOMER1';

/*
check 제약조건 : 값을 컬럼에 넣을때 체크해서 값을 넣는다.
제약조건 이름 생성 규칙 : 테이블이름_컬럼명_제약조건유형
*/

create table emp3 (
    eno number(4) constraint emp3_eno_pk primary key,
    ename varchar2(10),
    salary number (7,2) constraints emp3_salary_CK check (salary > 0)
    );
    
--emp3 테이블에 할당된 제약조건 확인하기 
select * from user_constraints
where table_name = 'EMP3';

insert into emp3 (eno,ename,salary)
values (1111,'smith',10);

select * from emp3;

create table emp4 (
    eno number(4) constraint emp4_eno_pk primary key,
    ename varchar2(10),
    salary number (7,2) constraints emp4_salary_CK check (salary > 0),
    dno number(2) constraint emp4_dno_CK check(dno in (10,20,30,40))
    );
insert into emp4
values (2222,'SCOTT',300,10);

    );
insert into emp4
values (3333,'SCOTT',300,10);

select * from emp4;

select * from user_constraints
where table_name = 'EMP4';
commit;

drop table emp4;

rollback;

/* Foreigin key(참조키) : 다른 테이블(부모)의 primary key, unique 컬럼을 참조해서 값을 할당 
*/
select * from employee; -- dno : FK (department 테이블의 dno를 참조)

select * from department;

insert into employee
values( 8888, 'aaaa', 'aaaa', 7788 , '22/12/08', 6000, null, 40);

insert into employee
values( 9999, 'aaaa', 'aaaa', 7788 , '22/12/08', 6000, null, 40);

-- 부모 테이블 생성 : Foregine 키가 참조하는 컬람을 primary key, unique 키 컬럼을 참조함 
create table ParentTbl (
    name varchar2 (20),
    age number(3) constraint ParenTbl_age_ck check( age > 0 and age < 200 ),
    gender varchar2 (3) constraint ParentTbl_gender_CK check (gender IN ('M','W')),
    infono number constraint ParentTbL_infono_PK Primary key
    );
--부모 테이블에 값 넣기 
insert into parentTbl values('홍길동',30,'M',1);
insert into parentTbl values('강동원',40,'M',2);
insert into parentTbl values('차은우',20,'M',3);
insert into parentTbl values('서강준',30,'M',4);
insert into parentTbl values('셔누',30,'M',5);
insert into parentTbl values('문빈',30,'M',6);
commit;
select * from ParentTbl;

--자식 테이블 만들기 
create table ChildTbl (
    id varchar2(40) constraint ChildTbl_id_PK primary key,
    pw varchar2(40) ,
    infono number,
    constraint ChildTbl_infono_FK foreign key (infono) references ParentTbl(infono)
    );

-- 자식테이블에 값 넣기 

select * from ChildTbl
order by infono;

insert into ChildTbl values ('aaa','1234',1);
insert into ChildTbl values ('bbb','1234',2);
insert into ChildTbl values ('ccc','1234',3); 
insert into ChildTbl values ('ddd','1234',4); 
insert into ChildTbl values ('ccc','1234',5); -- 부모의 없는 값 넣을 수 없다.  




/*
default : 컬럼의 값을 넣지 않을때 default로 설정된 값이 기본적으로 들어간다.
    *제한 조건은 아님 
*/

create table emp5(
    eno number(4) constraints emp5_eno_PK primary key,
    ename varchar2(10),
    salary number(7,2) default 1000
    );

insert into emp5 (eno,ename,salary)
values(1111,'aaaa',5000);

insert into emp5 (eno,ename)
values(2222,'aaaa');

insert into emp5 (eno,ename,salary)
values(3333,'aaaa',default);


--테이블 삭제 
drop table member;

--원하는 테이블의 제약 조건 확인 
select * from user_constraints
where table_name = 'EMPLOYEE';