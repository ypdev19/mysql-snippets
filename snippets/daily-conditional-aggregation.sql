/*
===============================================================================
Snippet Name: Daily Aggregation with Conditional
-------------------------------------------------------------------------------
Description:
This query aggregates contact activity per day, counting different contact
types and translating the weekday name from English to Spanish.

Uses ANSI SQL conditional aggregation for better compatibility and clarity.

(This is a query I extracted some years ago from a freelance job and thought could be of use in the future)
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
----------------------------------------------------------------
1  |       1        |        1         | 2017-06-26 10:00:00
2  |       1        |        2         | 2017-06-26 12:00:00
3  |       1        |        3         | 2017-06-26 15:00:00
4  |       1        |        1         | 2017-06-27 09:00:00
5  |       1        |        3         | 2017-06-27 11:00:00

*/

/*
Query Explanation:
------------------
- DATE(creation_date) removes the time portion and keeps only the date.
- GROUP BY groups all records occurring on the same day.
- SUM(CASE WHEN ...) calculates totals per contact type.
- DAYNAME() extracts the weekday name.
- CASE translates weekday names into Spanish.
- WHERE filters by medical_office, contact types, and date range.
- ORDER BY sorts results chronologically.
*/

SELECT 
    DATE(creation_date) AS callDate,

    SUM(CASE WHEN id_contact_type = 1 THEN 1 ELSE 0 END) AS phone_call,
    SUM(CASE WHEN id_contact_type = 2 THEN 1 ELSE 0 END) AS sms,
    SUM(CASE WHEN id_contact_type = 3 THEN 1 ELSE 0 END) AS whatsapp,

    CASE DAYNAME(creation_date)
        WHEN 'Monday' THEN 'Lunes'
        WHEN 'Tuesday' THEN 'Martes'
        WHEN 'Wednesday' THEN 'Miercoles'
        WHEN 'Thursday' THEN 'Jueves'
        WHEN 'Friday' THEN 'Viernes'
        WHEN 'Saturday' THEN 'Sabado'
        WHEN 'Sunday' THEN 'Domingo'
    END AS callDay

FROM medical_call

WHERE id_medical_office = 1
AND id_contact_type IN (1,2,3)
AND creation_date >= '2017-06-26'
AND creation_date <= '2017-07-04'

GROUP BY callDate
ORDER BY callDate ASC;


/*
Explanation:
- Records are grouped by date.
- Each day shows totals per contact type.
- Day names are translated into Spanish.

Expected Output:
------------------------------------------------
callDate    | phone_call | sms   | whatsapp | callDay
------------|------------|-------|----------|--------
2017-06-26  | 1          | 1     | 1        | Lunes
2017-06-27  | 1          | 0     | 1        | Martes

*/
