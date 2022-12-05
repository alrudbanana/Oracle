show user;
-- HR 계정 생성 
create user C##HR identified by 1234;
--HR에 권한 부여 
grant connect, resource to C##HR;
--Table생성 권한 부여 
alter user C##HR quota unlimited on USERS;



drop user C##HR;