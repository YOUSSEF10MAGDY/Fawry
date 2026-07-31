select c.Customer_Name Name,
       count(distinct a.Account_ID) NumberOfAccounts,
       sum(a.Balance) TotalBalance,
       avg(a.Balance) AvgBalance,
       b.Branch_Name,
       sum(t.TransactionCount) TransactionCount
from customer c
join account a on c.Customer_ID =a.Customer_ID
join branch b on a.Branch_ID =b.Branch_ID
left join (
    select Account_ID,count(Transaction_ID) TransactionCount
        from transaction
        group by Account_ID
    )t on a.Account_ID = t.Account_ID
group by c.Customer_Name,b.Branch_Name;