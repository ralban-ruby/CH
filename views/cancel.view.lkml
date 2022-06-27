view: cancel {
  sql_table_name: "CH"."CANCEL"
    ;;

  dimension_group: cancel_created {
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
    sql: ${TABLE}.CAST(${TABLE}."CANCEL_CREATED_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: cancellation_date_c {
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
    sql: ${TABLE}."CANCELLATION_DATE_C" ;;
  }

  dimension_group: cancellation_effective_date_c {
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
    sql: ${TABLE}."CANCELLATION_EFFECTIVE_DATE_C" ;;
  }

  dimension: competitor_c {
    type: string
    sql: ${TABLE}."COMPETITOR_C" ;;
  }

  dimension: customer_activation_date_age_c {
    type: number
    sql: ${TABLE}."CUSTOMER_ACTIVATION_DATE_AGE_C" ;;
  }

  dimension: customer_saved_c {
    type: yesno
    sql: ${TABLE}."CUSTOMER_SAVED_C" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: employee_code {
    type: number
    sql: ${TABLE}."EMPLOYEE_CODE" ;;
  }

  dimension: employee_id {
    type: number
    sql: ${TABLE}."EMPLOYEE_ID" ;;
  }

  dimension: employee_status {
    type: string
    sql: ${TABLE}."EMPLOYEE_STATUS" ;;
  }

  dimension: legalname {
    type: string
    sql: ${TABLE}."LEGALNAME" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: preferredfirstname {
    type: string
    sql: ${TABLE}."PREFERREDFIRSTNAME" ;;
  }

  dimension: preferredlastname {
    type: string
    sql: ${TABLE}."PREFERREDLASTNAME" ;;
  }

  dimension: primary_attempted_tactic_c {
    type: string
    sql: ${TABLE}."PRIMARY_ATTEMPTED_TACTIC_C" ;;
  }

  dimension: primary_cancel_reason_c {
    type: string
    sql: ${TABLE}."PRIMARY_CANCEL_REASON_C" ;;
  }

  dimension: primary_reason_detail_c {
    type: string
    sql: ${TABLE}."PRIMARY_REASON_DETAIL_C" ;;
  }

  dimension: product_cancelling_c {
    type: string
    sql: ${TABLE}."PRODUCT_CANCELLING_C" ;;
  }

  dimension: salesforce_account {
    type: string
    sql: ${TABLE}."SALESFORCE_ACCOUNT" ;;
  }

  dimension: salesforce_userid {
    type: string
    sql: ${TABLE}."SALESFORCE_USERID" ;;
  }

  dimension: salesforce_username {
    type: string
    sql: ${TABLE}."SALESFORCE_USERNAME" ;;
  }

  dimension: samaccountname {
    type: string
    sql: ${TABLE}."SAMACCOUNTNAME" ;;
  }

  dimension: service_issues_c {
    type: string
    sql: ${TABLE}."SERVICE_ISSUES_C" ;;
  }

  dimension: supervisor_primary {
    type: string
    sql: ${TABLE}."SUPERVISOR_PRIMARY" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: uncancel_c {
    type: yesno
    sql: ${TABLE}."UNCANCEL_C" ;;
  }

  dimension: went_to_competitor_c {
    type: yesno
    sql: ${TABLE}."WENT_TO_COMPETITOR_C" ;;
  }

  dimension: went_to_competitor_v_2_c {
    type: string
    sql: ${TABLE}."WENT_TO_COMPETITOR_V_2_C" ;;
  }

  dimension: what_saved_this_customer_c {
    type: string
    sql: ${TABLE}."WHAT_SAVED_THIS_CUSTOMER_C" ;;
  }

  dimension: who_saved_c {
    type: string
    sql: ${TABLE}."WHO_SAVED_C" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      samaccountname,
      preferredfirstname,
      salesforce_username,
      preferredlastname,
      name,
      legalname
    ]
  }
}
