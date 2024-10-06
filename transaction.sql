create database trans;
use trans;
create table balance(
account_id int primary key,
account_name varchar(200) not null,
balance decimal(10,2) not null
);
insert into balance(account_id,account_name,balance) values
(1,"Shoisob",10000.00),(2,"Jahid",5000.00),
(3,"Debi",100000.00),(4,"antu",50000.00);
select *from balance;
drop table balance
start transaction;
update balance set balance =balance+10000 where account_id=2;
update balance set balance =balance+10000/0 where account_id=;
select 'Transaction failed' as message;
rollback;
commit;
