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

select * 
from employee;

--<����1> �÷� �˸��<��Ī>, commission (���ʽ�) �÷��� null�� ���� ����ϵ� �����ȣ, ����̸�, �Ի� ��¥�� ���
select eno �����ȣ, ename ����̸�, hiredate �Ի糯¥, commission ���ʽ�
from employee
where commission is null;
--<����2> dno(�μ� ��ȣ) �� 20�̰�, �Ի� ��¥�� 81��4������ ����� �̸��� ��å�� �Ի糯¥�� ���
select ename ����̸�, hiredate �Ի糯¥, job ��ý
from employee
where dno = 20 and hiredate >= '81/04/01';
--<����3> ������ ����ؼ�, �����ȣ, ����̸�, ����, ���ʽ�, ��ü ������ ���
select eno �����ȣ, ename ����̸�, salary ����, commission ���ʽ�, (salary * 12) + nvl(commission, 0)as ��ü����
from employee;
--<����4> commission �� null�� �ƴ� ������� �̸��� ���
select ename ������̸�
from employee
where commission is not null;
--<����5> manager (���޻��) - 7698 �� ����̸��� ��å�� ���.
select manager ���޻�� , ename ����̸�, manager ��å 
from employee
where manager = 7698;
--<����6> ������ 1500 �̻��̰� �μ��� 20�� ����� ����̸��� �Ի糯¥ �μ���ȣ,������ ���
select ename ����̸�, hiredate �Ի糯¥, dno �μ���ȣ, salary ���� 
from employee
where salary > 1500 or dno =20;
--<����7> �Ի� ��¥�� 81�� 4�� �̻��̰� 81�� 12�� �̸��� ����ڵ��� ��� 
select hiredate �Ի糯¥, ename ����̸�
from employee
where hiredate >='81/04/01' or hiredate < '81/12/01';
--<����8> ��å(job) salesman �̸鼭 ������ 1500�̻��̸鼭 �μ���ȣ�� 30�� ������� ���
select job ��å, salary ����, dno �μ���ȣ 
from employee
where job = 'SALESMAN' and salary  > 1500 and dno = 30;
--<����9> ������ 1500�����̸鼭 �μ���ȣ�� 20���� �ƴ� ����̸���, ���ް� �μ���ȣ�� ���
select salary ����, ename ����̸�, dno �μ���ȣ 
from employee
where salary <= 1500 and dno !=20;
--<����10> �����ȣ(eno) �� 7788, 7782�� �μ���ȣ�� �̸��� ��å�� ��� 
select dno �μ���ȣ, ename �̸�, job ��å 
from employee
where eno = 7788 or eno = 7782;

*/
select * from employee;