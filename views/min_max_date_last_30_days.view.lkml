view: min_max_date_last_30_days {
    derived_table: {
      sql: WITH interactions AS (SELECT DISTINCT
         CALLID AS Interaction_ID,
        'Call' AS InteractionType,
        CONCAT(CAST(CALLTYPE AS VARCHAR(25)) , '-', CAST(CALLDIRECTION AS VARCHAR(25))) AS CallType ,
        E.DEPARTMENT_DESC,
        CAST(INITIATEDDATE AS DATE) AS Date_Initiated ,
        E.EMPLOYEEID ,
        LOCALUSERID AS OwnerName ,
        E.NAME AS EmployeeName
      FROM
        RUBY.IC.CALLDETAIL_VIW CD
      INNER JOIN ruby.ch.EMPLOYEE_LOOKUP_MASTER E
      ON
        E.ICUSERID = CD.LOCALUSERID
      WHERE
          CAST(INITIATEDDATE AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',  Current_Date))
      UNION
      SELECT DISTINCT
         Case_Number Interaction_ID,
        'Case' AS InteractionType,
        NULL AS CallType,
        E.DEPARTMENT_DESC ,
        CAST(c.created_date AS date) AS Date_Initiated,
        E.EMPLOYEEID ,
        u."NAME" AS OwnerName,
        E.NAME AS EmployeeName
      FROM
        FIVETRAN_DB.SALESFORCE."CASE" c
      LEFT JOIN FIVETRAN_DB.SALESFORCE."USER" u ON
        c.OWNER_ID = u.id
      LEFT JOIN FIVETRAN_DB.PEARL_EDW_OPS.EMPLOYEE_LOOKUP_MASTER E
        ON
        (UPPER(E."NAME") = UPPER(u."NAME")
          OR UPPER(REPLACE(E.ICUSERID, '.', ' ')) = UPPER(u."NAME")
            OR UPPER(E.EMAIL) = UPPER(u.USERNAME))
        AND E."_FIVETRAN_DELETED" != 1
      WHERE
        CAST(c.created_date AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',  Current_Date))
        AND c.WRAP_UP_CODE_C NOT IN ('NULL', 'Non-Actionable')
       )
SELECT
    (TO_CHAR(TO_DATE(CONVERT_TIMEZONE('America/Los_Angeles', 'US/Pacific', CAST(MAX(interactions."DATE_INITIATED")  AS TIMESTAMP_NTZ))), 'YYYY-MM-DD')) AS "interactions.max_date_initiated",
        (TO_CHAR(TO_DATE(CONVERT_TIMEZONE('America/Los_Angeles', 'US/Pacific', CAST(MIN(interactions."DATE_INITIATED")  AS TIMESTAMP_NTZ))), 'YYYY-MM-DD')) AS "interactions.min_date_initiated"
FROM interactions
INNER JOIN "CH"."EMPLOYEE_LOOKUP_MASTER"
     AS employee_lookup_master ON (interactions."EMPLOYEEID") = (employee_lookup_master."EMPLOYEEID")
WHERE ((( interactions."DATE_INITIATED"  ) >= ((CONVERT_TIMEZONE('US/Pacific', 'America/Los_Angeles', CAST(DATEADD('day', -29, DATE_TRUNC('day', CONVERT_TIMEZONE('America/Los_Angeles', 'US/Pacific', CAST(CURRENT_TIMESTAMP() AS TIMESTAMP_NTZ)))) AS TIMESTAMP_NTZ)))) AND ( interactions."DATE_INITIATED"  ) < ((CONVERT_TIMEZONE('US/Pacific', 'America/Los_Angeles', CAST(DATEADD('day', 30, DATEADD('day', -29, DATE_TRUNC('day', CONVERT_TIMEZONE('America/Los_Angeles', 'US/Pacific', CAST(CURRENT_TIMESTAMP() AS TIMESTAMP_NTZ))))) AS TIMESTAMP_NTZ)))))) AND (employee_lookup_master."DEPARTMENT_DESC" ) = 'Customer Happiness' AND (employee_lookup_master."EMPLOYEE_STATUS" ) = 'Active'
 ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: interactions_max_date_initiated {
      type: string
      sql: ${TABLE}."interactions.max_date_initiated" ;;
    }

    dimension: interactions_min_date_initiated {
      type: string
      sql: ${TABLE}."interactions.min_date_initiated" ;;
    }

    set: detail {
      fields: [interactions_max_date_initiated, interactions_min_date_initiated]
    }
  }
