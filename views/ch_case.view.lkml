view: ch_case {
  sql_table_name: "CH"."CH_CASE"
    ;;

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: case_age_days {
    type: number
    sql: ${TABLE}."CASE_AGE_DAYS" ;;
  }

  dimension: case_number {
    type: string
    sql: ${TABLE}."CASE_NUMBER" ;;
  }

  dimension: case_owner {
    type: string
    sql: ${TABLE}."CASE_OWNER" ;;
  }

  dimension: caseid {
    type: string
    sql: ${TABLE}."CASEID" ;;
  }

  dimension_group: closed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CAST(${TABLE}."CLOSED_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: complaint_type {
    type: string
    sql: ${TABLE}."COMPLAINT_TYPE" ;;
  }

  dimension_group: createdate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREATEDATE" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}."DIVISION" ;;
  }

  dimension: employee_code {
    type: number
    sql: ${TABLE}."EMPLOYEE_CODE" ;;
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: error_notes_c {
    type: string
    sql: ${TABLE}."ERROR_NOTES_C" ;;
  }

  dimension: errors {
    type: number
    sql: ${TABLE}."ERRORS" ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}."IS_CLOSED" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: new_reply_notification_c {
    type: string
    sql: ${TABLE}."NEW_REPLY_NOTIFICATION_C" ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}."ORIGIN" ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}."OWNER_ID" ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}."PRIORITY" ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}."REASON" ;;
  }

  dimension: rollup_description {
    type: string
    sql: ${TABLE}."ROLLUP_DESCRIPTION" ;;
  }

  dimension: service_complaints {
    type: number
    sql: ${TABLE}."SERVICE_COMPLAINTS" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."SUBJECT" ;;
  }

  dimension: t_actionable_cases {
    type: number
    sql: ${TABLE}."T_ACTIONABLE_CASES" ;;
  }

  dimension: technology_complaint {
    type: number
    sql: ${TABLE}."TECHNOLOGY_COMPLAINT" ;;
  }

  dimension: technology_complaints {
    type: number
    sql: ${TABLE}."TECHNOLOGY_COMPLAINTS" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: total_cases {
    type: number
    sql: ${TABLE}."TOTAL_CASES" ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}."USERNAME" ;;
  }

  dimension: wrap_up_code_c {
    type: string
    sql: ${TABLE}."WRAP_UP_CODE_C" ;;
  }

  dimension: wrap_up_sub_codes_c {
    type: string
    sql: ${TABLE}."WRAP_UP_SUB_CODES_C" ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name, username, name]
  }
}
