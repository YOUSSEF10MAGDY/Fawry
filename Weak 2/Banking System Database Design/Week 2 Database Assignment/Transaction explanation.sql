START TRANSACTION ;
UPDATE account SET Balance=Balance-100 WHERE Account_ID='A101';
UPDATE account SET Balance=Balance+100 WHERE Account_ID='A102';

COMMIT ;

# ACID properties:
#
# 1-->Atomicity
# "يا كل الخطوات اللي جوه الـ Transaction تنجح مع بعض، يا اما ولا خطوة  تتنفذ"
#
# 2---> Consistency
#
# "الداتا لازم تفضل سليمة وماشية على الشروط اللي  هنحطها قبل وبعد"
#
# 3---> Isolation
#
# "كل عملية شغالة في لوحدها ومفيش تداخل"
#
#
# 4----> Durability
#
#
# "التغييرات اللي تمت بنجاح بتفضل محفوظة بشكل دائم"
#
