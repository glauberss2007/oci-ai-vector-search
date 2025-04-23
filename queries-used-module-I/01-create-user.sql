alter session set container=freepdb1;

create user glauber identified by 123
default tablespace users
quota UNLIMITED on users;

grant db_developer_role to glauber;
