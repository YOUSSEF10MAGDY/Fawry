insert into bank (Bank_Name)values ('ABC Bank');

insert into branch(Branch_Name,Branch_Address,Bank_ID)values ('Cairo','Nasr City',  1),
                                                             ('Alexandria','Smouha',  1);

insert into customer (customer_name, national_id, phone) values     ('Ahmed Ali', '29801010012345', '01011112222'),
                                                                    ('Sara Mohamed', '30101020067890', '01133334444');

insert into account (Account_ID, Account_Type, Balance, Customer_ID, Branch_ID) values('A101', 'Savings', 5000, 1, 1),
                                                                                      ('A102', 'Current', 12000, 1, 1),
                                                                                      ('A103', 'Savings', 8000, 2, 2);

INSERT INTO transaction (Transaction_ID, Transaction_Type, Transaction_Amount, Account_ID) VALUES
                                                                                               ('T001', 'Deposit',    1000, 'A101'),
                                                                                               ('T002', 'Withdrawal',  500, 'A101'),
                                                                                               ('T003', 'Deposit',    2000, 'A102'),
                                                                                               ('T004', 'Deposit',    1500, 'A103');
INSERT INTO LOAN (Loan_ID, Loan_Amount, Customer_ID) VALUES
    ('L01', 15000, 1);



update account
set Balance =Balance+1000
where Account_ID ='A101';

DELETE FROM TRANSACTION
WHERE Transaction_ID = 'T002';

delete from customer where Customer_ID=1;

