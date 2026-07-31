create database  banking_system_db;
use banking_system_db;

create table BANK(
                     Bank_ID INT PRIMARY KEY  AUTO_INCREMENT,
                     Bank_Name varchar(50) NOT NULL unique
);

create table BRANCH (
                        Branch_ID int primary key auto_increment,
                        Branch_Name varchar(50) not null ,
                        Branch_Address varchar(100) not null ,
                        Bank_ID int not null ,
                        foreign key(Bank_ID) references BANK(Bank_ID)
);

create table CUSTOMER (
                          Customer_ID     int PRIMARY KEY auto_increment,
                          Customer_Name   varchar(100) NOT NULL,
                          National_ID     varchar(20) NOT NULL unique,
                          Phone           varchar(20) NOT NULL
);

create table ACCOUNT (
                         Account_ID varchar(50) primary key,
                         Account_Type varchar(50) not null check (Account_Type in ('Savings','Current') ),
                         Balance decimal(10,2) not null default 0 check ( Balance>=0 ),
                         Customer_ID int not null ,
                         foreign key (Customer_ID) references CUSTOMER(Customer_ID),
                         Branch_ID  int not null,
                         foreign key (Branch_ID)references BRANCH(Branch_ID)
);
create table TRANSACTION (
                             Transaction_ID varchar(50) not null primary key ,
                             Transaction_Type varchar(50) not null check ( Transaction_Type in ('Deposit','Withdrawal')),
                             Transaction_Amount decimal (12,2) not null  check ( Transaction_Amount>0 ),
                             Transaction_Date  date NOT NULL DEFAULT (CURRENT_DATE),
                             Account_ID    varchar(10) NOT NULL,
                             foreign key  (Account_ID) references ACCOUNT(Account_ID)

);
create table LOAN (
                      Loan_ID varchar(10) PRIMARY KEY,
                      Loan_Amount decimal(12,2) not null check  (Loan_Amount > 0),
                      Customer_ID int not null ,
                      foreign key (Customer_ID) references CUSTOMER(Customer_ID)
);


alter table CUSTOMER add  address varchar(100);

alter  table  CUSTOMER modify address varchar(200);

alter table CUSTOMER change column  address  Home_Address varchar(200);

alter  table  customer drop column  Home_Address;

alter table branch drop foreign key branch_ibfk_1;

alter  table  branch add foreign key  (Bank_ID)references bank(Bank_ID);

drop table bank;

truncate TABLE TRANSACTION;

drop TABLE IF EXISTS LOAN;



