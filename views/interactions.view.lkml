view: interactions {
   derived_table: {
    sql: SELECT DISTINCT
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
       ;;
  }

  measure: count {
    type: count_distinct
    sql: ${TABLE}.interaction_id ;;
    drill_fields: [detail*]
  }

  # measure: max_date_initiated {
  #   type: date
  #   sql: MAX(${TABLE}."DATE_INITIATED") ;;

  # }

  # measure: min_date_initiated {
  #   type: date
  #   sql: MIN(${TABLE}."DATE_INITIATED") ;;
  # }


dimension: start_date {
    sql: ${min_max_date_last_30_days.interactions_min_date_initiated} ;;
}

  dimension: end_date {
       sql: ${min_max_date_last_30_days.interactions_max_date_initiated} ;;
  }


 dimension: working_days  {
   type: number
   sql:  ( DATEDIFF(DAY, ${start_date}, DATEADD(DAY, 1, ${end_date}))
    - DATEDIFF(WEEK, ${start_date}, DATEADD(DAY, 1, ${end_date}))*2
    - (CASE WHEN DAYNAME(${start_date}) != 'Sun' THEN 1 ELSE 0 END)
    + (CASE WHEN DAYNAME(${end_date}) != 'Sat' THEN 1 ELSE 0 END)
    );;

 }



  dimension: interaction_id {
    type: string
    sql: ${TABLE}."INTERACTION_ID" ;;
  }

  dimension: interactiontype {
    type: string
    sql: ${TABLE}."INTERACTIONTYPE" ;;
  }

  dimension: calltype {
    type: string
    sql: ${TABLE}."CALLTYPE" ;;
  }

  dimension: department_desc {
    type: string
    sql: ${TABLE}."DEPARTMENT_DESC" ;;
  }

  dimension_group: date_initiated {
    type: time
    timeframes: [raw,date,day_of_month,day_of_week,day_of_year,time,month,month_name,month_num,quarter,quarter_of_year,week,week_of_year]
    sql: ${TABLE}."DATE_INITIATED" ;;
  }

  dimension: employeeid {
    type: number
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: ownername {
    type: string
    sql: ${TABLE}."OWNERNAME" ;;
  }

  dimension: employeename {
    type: string
    sql: ${TABLE}."EMPLOYEENAME" ;;
          }

  dimension: interaction_owner_title {
    sql:${employee_lookup_master.title} ;;
    }

  dimension: salesforce_case_wrap_up_code_c {
       sql: ${salesforce_case.wrap_up_code_c} ;;
    }

  dimension: salesforce_case_wrap_up_sub_code_c {
      sql:${salesforce_case.wrap_up_sub_codes_c} ;;
  }



  dimension: salesforce_case_wrap_up{
    type: string
    sql:COALESCE(CONCAT(CAST(${salesforce_case_wrap_up_code_c} AS VARCHAR(50)) , '-', CAST(${salesforce_case_wrap_up_sub_code_c} AS VARCHAR(50))),${salesforce_case_wrap_up_code_c}) ;;
  }

  dimension: interaction_case_call_type {
    label: "Interaction Description"
    type: string
    sql: CASE
          WHEN ${TABLE}."INTERACTIONTYPE" = 'Call' THEN ${calltype}
          WHEN ${TABLE}."INTERACTIONTYPE" = 'Case' THEN  ${salesforce_case_wrap_up}
          ELSE NULL END ;;
  }




  set: detail {
    fields: [
      interaction_id,
      interactiontype,
      interaction_case_call_type,
      department_desc,
      date_initiated_date,
      employeeid,
      ownername,
      interaction_owner_title
    ]
  }
}
