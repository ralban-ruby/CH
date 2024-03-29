view: cancel_request {
  sql_table_name: "CH"."CANCEL_REQUEST"
    ;;

  dimension_group: anticipated_return_c {
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
    sql: ${TABLE}."ANTICIPATED_RETURN_C" ;;
  }

  dimension: anticipated_return_timeframe_c {
    type: string
    sql: ${TABLE}."ANTICIPATED_RETURN_TIMEFRAME_C" ;;
  }

  dimension: app_force_functionality_other_c {
    type: string
    sql: ${TABLE}."APP_FORCE_FUNCTIONALITY_OTHER_C" ;;
  }

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

  dimension: cancel_owner_employee_code {
    type: number
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_CODE" ;;
  }

  dimension: cancel_owner_employee_id {
    type: number
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_ID" ;;
  }

  dimension: cancel_req_owner_name {
    type: string
    sql: ${TABLE}."CANCEL_REQ_OWNER_NAME" ;;
  }

  dimension: cancel_save_owner_name {
    type: string
    sql: ${TABLE}."CANCEL_SAVE_OWNER_NAME" ;;
  }

  dimension: cancel_saved_by_employee_code {
    type: number
    sql: ${TABLE}."CANCEL_SAVED_BY_EMPLOYEE_CODE" ;;
  }

  dimension: cancel_saved_by_employee_id {
    type: number
    sql: ${TABLE}."CANCEL_SAVED_BY_EMPLOYEE_ID" ;;
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

  dimension: competitor_other_c {
    type: string
    sql: ${TABLE}."COMPETITOR_OTHER_C" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: customer_activation_date_age_c {
    type: number
    sql: ${TABLE}."CUSTOMER_ACTIVATION_DATE_AGE_C" ;;
  }

  dimension: customer_industry {
    type: string
    sql: ${TABLE}."CUSTOMER_INDUSTRY" ;;
  }

  dimension: customer_saved_c {
    type: yesno
    sql: ${TABLE}."CUSTOMER_SAVED_C" ;;
  }

  dimension: desired_app_force_functionality_c {
    type: string
    sql: ${TABLE}."DESIRED_APP_FORCE_FUNCTIONALITY_C" ;;
  }

  dimension: desired_integration_other_c {
    type: string
    sql: ${TABLE}."DESIRED_INTEGRATION_OTHER_C" ;;
  }

  dimension: desired_integrations_c {
    type: string
    sql: ${TABLE}."DESIRED_INTEGRATIONS_C" ;;
  }

  dimension: not_a_good_fit_c {
    type: yesno
    sql: ${TABLE}."NOT_A_GOOD_FIT_C" ;;
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

  dimension: rn {
    type: number
    sql: ${TABLE}."RN" ;;
  }

  dimension: salesforce_account {
    type: string
    sql: ${TABLE}."SALESFORCE_ACCOUNT" ;;
  }

  dimension: salesforce_account_owner {
    type: string
    sql: ${TABLE}."SALESFORCE_ACCOUNT_OWNER" ;;
  }

  dimension: salesforce_cancel_id {
    type: string
    sql: ${TABLE}."SALESFORCE_CANCEL_ID" ;;
  }

  dimension: salesforce_userid_cancel_owner {
    type: string
    sql: ${TABLE}."SALESFORCE_USERID_CANCEL_OWNER" ;;
  }

  dimension: salesforce_username_cancel_owner {
    type: string
    sql: ${TABLE}."SALESFORCE_USERNAME_CANCEL_OWNER" ;;
  }

  dimension: service_issues_c {
    type: string
    sql: ${TABLE}."SERVICE_ISSUES_C" ;;
  }

  dimension: service_issues_other_c {
    type: string
    sql: ${TABLE}."SERVICE_ISSUES_OTHER_C" ;;
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

  measure: count {
    type: count
    drill_fields: [cancel_req_owner_name, cancel_save_owner_name]
  }
}
