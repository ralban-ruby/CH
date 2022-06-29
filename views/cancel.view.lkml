view: cancel {
  sql_table_name: "CH"."CANCEL"
    ;;
  drill_fields: [salesforce_cancel_id]

  dimension: salesforce_cancel_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."SALESFORCE_CANCEL_ID" ;;
  }

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
    sql: CAST(${TABLE}."CANCEL_CREATED_DATE" AS TIMESTAMP_NTZ) ;;
   }

  dimension: cancel_owner_department {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_DEPARTMENT" ;;
  }

  dimension: cancel_owner_email {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_EMAIL" ;;
  }

  dimension: cancel_owner_employee_code {
    type: number
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_CODE" ;;
  }

  dimension: cancel_owner_employee_id {
    type: number
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_ID" ;;
  }

  dimension: cancel_owner_employee_name {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_NAME" ;;
  }

  dimension: cancel_owner_employee_status {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_STATUS" ;;
  }

  dimension: cancel_owner_firstname {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_FIRSTNAME" ;;
  }

  dimension: cancel_owner_lastname {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_LASTNAME" ;;
  }

  dimension: cancel_owner_legalname {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_LEGALNAME" ;;
  }

  dimension: cancel_owner_samaccountname {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_SAMACCOUNTNAME" ;;
  }

  dimension: cancel_owner_supervisor_primary {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_SUPERVISOR_PRIMARY" ;;
  }

  dimension: cancel_owner_team {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_TEAM" ;;
  }

  dimension: cancel_owner_title {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_TITLE" ;;
  }

  dimension: cancel_saved_by_employee_code {
    type: number
    sql: ${TABLE}."CANCEL_SAVED_BY_EMPLOYEE_CODE" ;;
  }

  dimension: cancel_saved_by_employee_id {
    type: number
    sql: ${TABLE}."CANCEL_SAVED_BY_EMPLOYEE_ID" ;;
  }

  dimension: cancel_saved_by_employee_name {
    type: string
    sql: ${TABLE}."CANCEL_SAVED_BY_EMPLOYEE_NAME" ;;
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

  dimension: salesforce_account {
    type: string
    sql: ${TABLE}."SALESFORCE_ACCOUNT" ;;
  }

  dimension: salesforce_account_owner {
    type: string
    sql: ${TABLE}."SALESFORCE_ACCOUNT_OWNER" ;;
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

  dimension: cancel_save_value {
    type: number
    sql: ${TABLE}."CUSTOMER_SAVED_C" ;;
  }


  measure: count_cancel {
    label: "Total Cancels"
    type: count
    filters: [customer_saved_c: "0"]
    drill_fields: [customer,
      salesforce_account_owner,
      cancel_owner_employee_name,
      cancel_owner_title,
      cancellation_date_c_date,
      cancellation_effective_date_c_date,
      primary_attempted_tactic_c,
      primary_cancel_reason_c,
      product_cancelling_c,
      service_issues_c,
      went_to_competitor_v_2_c,
      not_a_good_fit_c,
      anticipated_return_c_date,]
  }

  measure: count_saves {
    label: "Total Cancel Saves"
    type: sum
    filters: [customer_saved_c: "1"]
    sql: ${cancel_save_value}::int;;
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      customer,
      salesforce_account_owner,
      cancel_owner_employee_name,
      cancel_owner_title,
      cancellation_date_c_date,
      cancellation_effective_date_c_date,
      primary_attempted_tactic_c,
      primary_cancel_reason_c,
      product_cancelling_c,
      service_issues_c,
      went_to_competitor_v_2_c,
      cancel_saved_by_employee_name,
      what_saved_this_customer_c,
      not_a_good_fit_c,
      anticipated_return_c_date,

    ]
  }
}
