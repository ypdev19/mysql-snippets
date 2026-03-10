/*
===============================================================================
Snippet Name: Conditional Aggregation
-------------------------------------------------------------------------------
Description:
This query generates a summarized count of records grouped by a categorical field using conditional aggregation.

In this snippet example, we will count by a category It counts how many records belong to a category, 
in this case, each contact type within a specific medical office.

This uses SUM + CASE, which is ANSI SQL compliant and portable across most database systems.
===============================================================================
*/

/*
Use Case Example:
-----------------

Table: medical_office
-------------------
id | name 
-------------------
1  | office 1    
2  | office 2           

Table: contact_type
-------------------
id | name 
-------------------
1  | phone call    
2  |    sms         
3  |   whatsapp    


Table: medical_call
------------------------------------------------------------
id | id_medical_office | id_contact_type  | creation_date
------------------------------------------------------------
1  |       1           |        1         | 2024-01-01
2  |       1           |        2         | 2024-01-01
3  |       1           |        3         | 2024-01-02
4  |       1           |        1         | 2024-01-02
5  |       2           |        1         | 2024-01-02

*/


/*
Query Explanation:
------------------
- The FROM clause reads data from `medical_call`.
- The WHERE clause filters records belonging to a specific medical_office
  and limits results to selected contact types.
- SUM(CASE WHEN ...) performs conditional aggregation:
    * Returns 1 when the condition is true.
    * Returns 0 otherwise.
    * SUM adds all matching rows.
- Each SUM expression creates an aggregated metric column.
*/

SELECT 
    SUM(CASE WHEN id_contact_type = 1 THEN 1 ELSE 0 END) AS phone_call,
    SUM(CASE WHEN id_contact_type = 2 THEN 1 ELSE 0 END) AS sms,
    SUM(CASE WHEN id_contact_type = 3 THEN 1 ELSE 0 END) AS whatsapp
FROM medical_call
WHERE id_medical_office = 1
AND id_contact_type IN (1,2,3);

/*
Explanation:
- Row 5 is ignored because id_medical_office ≠ 1.
- Remaining rows are counted by contact type.

Expected Output:
----------------
phone_call | sms | whatsapp
-----------|-----|---------
   2       |  1  |    1

*/
