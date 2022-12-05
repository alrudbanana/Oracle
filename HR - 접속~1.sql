
--��� ���̺� ��� �ϱ� 
select * from tab;

--���̺��� ���� Ȯ���ϱ� 
    --select : ����ϱ� �ڵ� 
    /*
    select �÷��� 
    from ���̺��̸� 
    
    */
-- 1. emplyee ���̺��� ��� �÷��� ����϶�.
    -- �ٷ���(�����) �� ���� ������ ���� 
select * 
from employee;

--2.Department ��� 
select * 
from department;

--3. salgrade ���̺��� ��� �÷�(�ʵ�,��ƼƼ)�� ���
    -- �Ǹ� ������ �����ϴ� ���̺�. 
select * 
from salgrade;

-- =========================================================================
-- �� ���̺��� ������ �÷� ���� 
-- 1. employee ���̺� 
select * from employee;
/*
    ENO : �����ȣ 
    ENAME : �����
    JOB : ��å 
    MANAGER : ��� 
    HIREDATE :  �Ի��� 
    SALARY : ������ ����
    COMMISSION : ���ʽ� 
    DNO : �μ���ȣ 
*/
-- 2.�μ� �����������ϴ� ���̺� 
select * from department;
/*
    DNO: �μ� ��ȣ 
    DNAME: �μ��� 
    LOC: �μ��� ��ġ
*/

--3.���� ������ �����ϴ� ���̺� 
Select * from salgrade;

/*
    GRADE : ���� <--������ ���� 
    LOSAL : ���� ���� ���� 
    HISAL: : ���� ���� ���� 
*/
---------------------------
--select : �����ض� 
--�÷� , �ʵ�, ��ƼƼ 
--���ڵ� : �� �÷��� �� �� : 1����
--���ڵ��: ���ڵ���� ���� 
select * 
from employee;

--Ư�� �÷��� ����ϱ�
select eno
from employee; 

--Ư�� �÷� ������ ����ϱ� (�ϳ��� Į���� ���� ��� , �� ����)
select salary, ename,salary
from employee;

--��� �÷� ����ϱ� (Ư���÷� ������ ��µ� ����) 
select eno, eno, ename, job, manager,hiredate,salary,commission,dno
from employee;

--Ư�� Į���� ��½� ������ ����ϱ� 
select eno, ename, salary, ename, ename
from employee;

-- ���̺��� ���� Ȯ�� �ϱ� : ���̺��� �÷����� Ȯ��
DESCRIBE employee;
DESC employee;


--�÷��� ��Ī���� ����ϱ� ( as ��Ī )
select eno as �����ȣ, ename as �����, job as ��å 
from employee;

--employee ���̺��� ��� Į���� ��Ī���� ����ϱ� 
select eno �����ȣ, ename �����, job ��å, manager �����ȣ,
   hiredate �Ի���, salary "��#��", commission ���ʽ�, dno "�μ� ��ȣ"
    from employee;

--������ ����Ͽ� ����ϱ� : Where
--���� �߿� 

select * 
from employee
where eno = 7499; --������ ����ؼ� ��� �� ���, eno �÷��� ���� 7499]

desc employee; -- <==employee ���̺��� ������ Ȯ��

--���� ��½� : number ������ Ÿ���� ���� ''���� ��� 
--  number�̿��� ������ Ÿ���� '' : char, varchar, date 

select * from employee
where job = 'MANAGER'; -- Job (varchar2), ���� �����ö��� ��ҹ��ڸ� ����
    --job 
desc employee;

--�μ� ��ȣ�� 20���� ��� �÷��� ����ض� 
select * from employee
where dno = 20;

--<����>
--salary (����) 2000���� �̻��� ����ڸ� ��� �÷� ��� 
--�̸��� CLARK�� ������� ���޸� ��� 
--�����ȣ(ENO) �� 7788�� ������� �̸��� �Ի� ��¥�� ��� <==�÷��̸��� ��Ī���� ��� 

--1
select * from employee
where salary >= 2000;

--2
select salary ���� ,ename �����, eno �����ȣ 
from employee
where ename = 'CLARK';

--3
select ename �����, hiredate �Ի���,eno �����ȣ 
from employee
where eno = 7788;

--select ���� ��ü ���� --
select --�÷��� �� * (����÷�) , (�÷�����) 
from --  ���̺� ��, ���̸� 
-- ================�ʼ�
where -- ����
group by   --Ư�� �÷��� ������ ���� �׷��� 
Having -- group by ���� ���� ����� ����ó�� 
Order by -- �����ؼ� ��� �� Į��, asc : �������� ����, desc ; �������� ���� (���ϸ�����)

select dno
from employee;

select distinct dno �μ���ȣ
--distinct : �ߺ��� ���� ���� �� ���, �ٸ� �÷��� ���ÿ� �ۼ� �� ���� �߻�  
from employee;


select 
distinct dno,eno --�����߻� , �ϳ��� �÷��� ���� ���� 
from employee;

--�÷��� ������ ���� : �÷����� ������, alias(��Ī) �ؼ� ���
select eno, ename, salary as ���� , salary * 12 as ����, commission
from employee;

--��ü ���� ���ϱ� ���� * 12 + ���ʽ� = ��ü ���� 
-- null ���� �ִ� ��� = ó���� �ȵǸ� ��ü �� null. 
-- null �� ����(+,-,*,/)�� �ϰԵǸ� ��ü�� NULL 
select eno, ename, salary, commission, salary * 12 as ����, (salary * 12) + commission as ��ü����
from employee;

 -- ��ü ������ ����� �� null �� �� Į���� 0���� ���� �� ������ �����ؾ��Ѵ�. 
    -- nvl �Լ� : null �� �� �÷��� �ٸ� ������ ��ȯ�ؼ� ó�����ִ� �Լ� 
    -- nvl (commission, 0) <== commission �÷��� null �� 0���� �����ؼ� ó���ض� 

select eno, ename, salary, commission, salary * 12 as ����, (salary * 12) + nvl(commission, 0) as ��ü����
from employee;

--null�� �� �÷��� ����ϱ� <== ���� 
select *
from employee
where commission is not null;

-- where ���ǿ��� and, or ����ϱ� 

-- �μ� ��ȣ�� 20���� ��� �÷� ��� 
select * 
from employee
where dno = 20 or salary > = 2000;

select *
from employee 
where dno = 20 and salary <=1500;

-- job (��å) Manager�̸鼭 ������ 2000�̻��� ����ڸ� ��� 
select *
from employee 
where job = 'MANAGER' and salary >=2000;
