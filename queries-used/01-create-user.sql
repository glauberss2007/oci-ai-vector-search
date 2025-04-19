alter session set container=freepdb1;

create user glauber identified by 123
default tablespace users
quota UNLIMITED on users;

grant SYSDBA to glauber;