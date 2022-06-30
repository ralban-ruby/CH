view: Connections {
  derived_table: {
    sql: SELECT
        emp.EMPLOYEEID ,
        emp."NAME" AS EmployeeName,
        T.CONNECTION_TYPE_C ,
        T.subject,
        T.STATUS ,
        CAST(T.CREATED_DATE AS DATE) AS Created_Date,
        CAST(T.ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE ,
        CAST(T.completed_date_time AS DATE) AS completed_date_time ,
        T.OWNER_ID ,
        COALESCE(T.ACCOUNT_C,T.ACCOUNT_ID) AS ACCOUNT,
        A."NAME" AS Account_Name
      FROM
        FIVETRAN_DB.SALESFORCE.TASK T
      LEFT JOIN FIVETRAN_DB.SALESFORCE."USER" u ON
        T.OWNER_ID = u.id
      LEFT JOIN FIVETRAN_DB.PEARL_EDW_OPS.EMPLOYEE_LOOKUP_MASTER emp ON
        u."NAME"  = emp."NAME"
        AND emp."_FIVETRAN_DELETED" !=1
      LEFT JOIN FIVETRAN_DB.SALESFORCE."ACCOUNT" A
        ON A.ID=COALESCE(T.ACCOUNT_C,T.ACCOUNT_ID)
      WHERE
        1 = 1
        AND T.is_deleted != 1
        AND T.TYPE_CH_C = 'Connection'
        AND emp.DEPARTMENT_DESC='Customer Happiness'
        AND CAST(T.Created_Date AS DATE) >= '1/1/2021'
       ;;
  }

  dimension: employeeid {
    type: number
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: employeename {
    type: string
    sql: ${TABLE}."EMPLOYEENAME" ;;
  }

  dimension: connection_type_c {
    type: string
    sql: ${TABLE}."CONNECTION_TYPE_C" ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."SUBJECT" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: created_date {
    type: date
    sql: ${TABLE}."CREATED_DATE" ;;
  }

  dimension: activity_date {
    type: date
    sql: ${TABLE}."ACTIVITY_DATE" ;;
  }

  dimension: completed_date_time {
    type: date
    sql: ${TABLE}."COMPLETED_DATE_TIME" ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}."OWNER_ID" ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}."ACCOUNT" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [employeeid,employeename,connection_type_c,account_name]
}
  set: detail {
    fields: [
      employeeid,
      employeename,
      connection_type_c,
      subject,
      status,
      created_date,
      activity_date,
      completed_date_time,
      owner_id,
      account,
      account_name
    ]
  }
}
