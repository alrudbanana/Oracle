--table 생성 

create table myTbl2 (
    id varchar (20),
    pass varchar(20)
    );

--table 에 값 넣기 
insert into mytbl2 VALUES ('1' , '1234');
commit;

--테이블 보기 

select * from myTbl2;

drop table myTbl2;
