select * from ACCOUNT where Balance > 6000;

select * from ACCOUNT
where Account_Type = 'Savings' and Balance > 5000;

select * from TRANSACTION
where Transaction_Type = 'Deposit' or Transaction_Amount > 1500;

select * from ACCOUNT where Account_Type in ('Savings', 'Current');

select * from TRANSACTION
where Transaction_Amount BETWEEN 500 and 2000;

select * from CUSTOMER where Customer_Name like 'A%';

select * from LOAN where Loan_Amount is null ;

select * from ACCOUNT order BY Balance desc;

select distinct Account_Type FROM ACCOUNT;

select * from TRANSACTION order BY Transaction_Amount desc limit 3;



select COUNT(*) as total_accounts from ACCOUNT;

select SUM(Balance) as total_balance from ACCOUNT;

select AVG(Transaction_Amount) as avg_txn from TRANSACTION;

select MIN(Balance) as min_balance, MAX(Balance) as max_balance from ACCOUNT;


select Customer_ID, COUNT(*) as num_accounts
from ACCOUNT
GROUP BY Customer_ID
HAVING COUNT(*) > 1;



select c.Customer_Name, a.Account_ID, a.Balance
from CUSTOMER c
         inner join ACCOUNT a ON c.Customer_ID = a.Customer_ID;

select c.Customer_Name, l.Loan_ID, l.Loan_Amount
from CUSTOMER c
         left join LOAN l ON c.Customer_ID = l.Customer_ID;

select a.Account_ID, t.Transaction_ID
from TRANSACTION t
         right join ACCOUNT a ON t.Account_ID = a.Account_ID;

select c.Customer_Name, a.Account_ID
from CUSTOMER c left join ACCOUNT a ON c.Customer_ID = a.Customer_ID
union

select c.Customer_Name, a.Account_ID
from CUSTOMER c right join ACCOUNT a ON c.Customer_ID = a.Customer_ID;

select a1.Account_ID as acc1, a2.Account_ID as acc2, a1.Branch_ID
from ACCOUNT a1
         join ACCOUNT a2
              ON a1.Branch_ID = a2.Branch_ID AND a1.Account_ID < a2.Account_ID;



select b.Branch_Name, at.Account_Type
from BRANCH b
         CROSS join (select distinct Account_Type from ACCOUNT) as at;










