select * from myTbl;
 insert into myTbl values ('1','1234');
 commit
 
 select * from myTbl;
 
show user;
 
 --�� �� �ּ� : ���α׷����� �ؼ� ���� �ʴ� ���� 
 /*
 ������ �ּ� 
 */
 
 --1. HR ���� ���� :  12���� ���� ������ ���� �� ������ �տ� C##�� �ٿ����Ѵ�.
 -- HR : ������, ��ȣ : 1324
 create user C##HR identified by 1234;
 
 --2. HR ������ ���� �ο�  : 12���� ���� ������ ������ ������ �տ� C##�� �ٿ����Ѵ�.
    -- system �������� ������ ����â���� ����� ����Ѵ�.
 /*connect: ���ݿ��� Db�� ������ �� �ִ� ���� 
   resource: ��ü(resource)- Table, index, view, store procedure, triger, function �� ���� , ����,�����ϴ� ������ �ο�

*/
grant connect, resource to C##HR;

-- 3. ���̺� �����̽��� ����� ���� �ο� 
    -- USERS ���̺� �����̽��� ��뷮�� ���������� ����� �� �ֵ��� ������ �ο�
    -- ���̺� ���� �Է��ϴ� ���� �ο� 
alter user C##HR quota unlimited on USERS;

-- 4.HR ���� ���� - ���� ������ �Ǿ��ִ� ��� ������ �ȵ�. ������ ���� ���� �� ��������
drop user C##HR;


show user;


