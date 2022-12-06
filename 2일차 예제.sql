select * from employee;

--1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, �޿�, �λ�� �޿��� ����ϼ���. 
select ename ����̸�, salary �޿�, salary + 300 as �λ�ȱ޿�
from employee;

--2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. 
    --���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�. 
select ename ����̸�, salary �޿�, salary * 12 + 100 + nvl(commission,0) as �����Ѽ���
from employee
order by �����Ѽ��� desc;

--3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���. 
select ename ����̸�, salary �޿�
from employee
order by salary desc

--4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���. 
select eno �����ȣ, ename ����̸� , dno �μ���ȣ 
from employee
where eno = 7788;

--5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���. 
select ename ����̸�, salary �޿� 
from employee
where salary < 2000 or salary>3000; 

--6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�
select ename ����̸�, job ��å, hiredate �Ի��� 
from employee
where '1981/02/20' <= hiredate and '1981/05/01'  >= hiredate ;

--7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�. 
select ename ����̸�, dno �μ���ȣ 
from employee
where 20 <= dno or 30 >=dno 
order by ename desc;

--8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���. 
select ename ����̸�, salary �޿�, dno �μ���ȣ
from employee 
where (salary > 2000 and salary < 3000) or (dno > 20 and dno < 30)
order by ename;

--9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ��� : _ ,  %)
select ename ����̸�, hiredate �Ի��� 

--10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.
select * from employee;
select ename, job
from employee 
where manager is null;
--11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿��� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
select ename ����̸�, salary �޿�, commission ���ʽ� 
from employee 
where commission is not null
order by salary desc ,  commission desc;
--12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.
select ename ����̸� ,  
    instr(ename , 'R' ) as ����°r
from employee
where instr(ename, 'R') != 0;

--13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
select ename ����̸� 
from employee
where ename like '%A%E';
--14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭 
    --�޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
select ename ����̸�, job ������, salary �޿� 
from employee
where (job = 'CLERK' or job = 'SALESMAN') and (salary not in (1600,950,1300));

--15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.  
select ename ����̸�, salary �޿�, commission ���ʽ� 
from employee 
where commission >= 500;


 �Ϸ�ð� : 3�� 45�б��� �Ϸ�, p.jangwoo@gmail.com 

