CREATE  View CUSTOMER_ACCOUNT_SUMMARY AS
SELECT
    c.Customer_ID Id,
    c.Customer_Name  Name,
    COUNT(a.Account_ID)      AS Num_Accounts,
    SUM(CASE WHEN a.Account_Type = 'Savings' THEN a.Balance ELSE 0 END) AS Savings_Balance,
    SUM(CASE WHEN a.Account_Type = 'Current' THEN a.Balance ELSE 0 END) AS Current_Balance
FROM CUSTOMER c
         LEFT JOIN ACCOUNT a ON c.Customer_ID = a.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name;

SELECT * FROM CUSTOMER_ACCOUNT_SUMMARY;