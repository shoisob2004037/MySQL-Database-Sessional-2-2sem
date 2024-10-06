start transaction;
update balance set balance =balance-10000 where account_id=2;
update balance set balance =balance-100000 where account_id=3;
update balance set balance =balance+10000/0 where account_id=1;
commit;           
rollback;

START TRANSACTION;
UPDATE balance SET balance = balance + 5000 WHERE account_id = 1;

DO SLEEP(2);
UPDATE balance SET balance = balance - 5000 WHERE account_id = 2;


START TRANSACTION;
UPDATE balance SET balance = balance - 5000 WHERE account_id = 2;

DO SLEEP(2);
UPDATE balance SET balance = balance + 5000 WHERE account_id = 1;
