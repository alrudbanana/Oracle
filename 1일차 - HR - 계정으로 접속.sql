show user;


--1. HR �������� ���� Ȯ�� : resource : ���̺� ����, ����, ����
show user; 

--2. ���̺� ����, �����ݷб����� �ϳ��� ��ɾ ���� 
create table myTbl2 (
    id varchar2 (20),
    pass varchar2 (20)
    );

--3. ���̺��� �� �ֱ� : commmit (�����϶�) 
insert into myTbl2 values ( '1', '1234');
commit;    --DB�� ���������� �����϶�. (Insert, Update, Delete �������� ���)


--4. ���̺��� ���� ����ϱ� 
select * from myTbl2;

--5. ���̺� �����ϱ� 

drop table myTbl2;

-- ���� ������ Oracle���� Ȯ�� 
select * from v$version;

--������ datbase �� �����ϴ� ��� ���̺� ���� 
select * from table;
