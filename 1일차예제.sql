show user;
-- HR ���� ���� 
create user C##HR identified by 1234;
--HR�� ���� �ο� 
grant connect, resource to C##HR;
--Table���� ���� �ο� 
alter user C##HR quota unlimited on USERS;



drop user C##HR;