view: cancel_churn {
  sql_table_name: "CH"."CANCEL_CHURN"
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

  dimension: cancel_owner_employee_code {
    type: number
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_CODE" ;;
  }

  dimension: cancel_owner_employee_id {
    type: number
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_ID" ;;
  }

  dimension_group: cancel_req_created {
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
    convert_tz: no
    datatype:date
    sql: CAST(${TABLE}."CANCEL_REQ_CREATED_DATE" AS DATE) ;;
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

  dimension: churn_mrr_product {
    type: string
    sql: ${TABLE}."CHURN_MRR_PRODUCT" ;;
  }

  dimension: competitor_c {
    type: string
    sql: ${TABLE}."COMPETITOR_C" ;;
  }

  dimension: competitor_other_c {
    type: string
    sql: ${TABLE}."COMPETITOR_OTHER_C" ;;
  }

  dimension: crm_id {
    type: string
    sql: ${TABLE}."CRM_ID" ;;
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

  dimension: future_bookings_after_cancel_req {
    type: number
    sql: ${TABLE}."FUTURE_BOOKINGS_AFTER_CANCEL_REQ" ;;
  }

  dimension: future_bookings_after_churn_amt {
    type: number
    sql: ${TABLE}."FUTURE_BOOKINGS_AFTER_CHURN_AMT" ;;
  }

  dimension_group: last_booking {
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
    sql: CAST(${TABLE}."LAST_BOOKING_DATE" AS DATE) ;;
  }

  dimension: mrr_churn_amt {
    type: number
    sql: ${TABLE}."MRR_CHURN_AMT" ;;
  }

  dimension_group: mrr_churn {
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
    sql: CAST(${TABLE}."MRR_CHURN_DATE" AS DATE) ;;
  }

  dimension: mrr_lifetime_bookings_amt {
    type: number
    sql: ${TABLE}."MRR_LIFETIME_BOOKINGS_AMT" ;;
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

  dimension: requested_product_cancel {
    type: string
    sql: ${TABLE}."REQUESTED_PRODUCT_CANCEL" ;;
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

  dimension: cancel_req_owner_name {
    type: string
    sql: ${TABLE}."CANCEL_REQ_OWNER_NAME" ;;
  }

  dimension: cancel_save_owner_name {
    type: string
    sql: ${TABLE}."CANCEL_SAVE_OWNER_NAME" ;;
  }

  dimension: last_book_before_churn_d
  {
    type: number
    sql:  CASE WHEN ${last_booking_date}  < ${mrr_churn_date} THEN 1 ELSE 0 END ;;
  }

  dimension: cancelled_account_reception_product
  {
    type: number
    sql: CASE WHEN ${requested_product_cancel}  = 'Reception' AND ${mrr_churn_amt} < 0 AND ${last_book_before_churn_d} = 1 AND ${customer_saved_c} <> 1 AND ${uncancel_c} <> 1 THEN 1 ELSE 0 END ;;
  }

  dimension: cancelled_account_chat_product
  {
    type: number
    sql: CASE WHEN ${requested_product_cancel}  = 'Chat' AND ${mrr_churn_amt} < 0 AND ${last_book_before_churn_d} = 1 AND ${customer_saved_c} <> 1 AND ${uncancel_c} <> 1 THEN 1 ELSE 0 END ;;
  }

  dimension: cancelled_account
  {
    type: number
    sql: CASE WHEN ${mrr_churn_amt} < 0 AND ${last_book_before_churn_d} = 1 AND ${customer_saved_c} <> 1 AND ${uncancel_c} <> 1 THEN 1 ELSE 0 END ;;
  }

  dimension: cancel_save_reception_product
  {
    type: number
    sql: CASE WHEN ${requested_product_cancel}  = 'Reception' AND ${customer_saved_c} = 1 AND ${cancel_req_created_date} <= ${last_booking_date} THEN 1 ELSE 0 END ;;
  }

  dimension: cancel_save_chat_product
  {
    type: number
    sql: CASE WHEN ${requested_product_cancel}  = 'Chat' AND ${customer_saved_c} = 1 AND ${cancel_req_created_date} <= ${last_booking_date} THEN 1 ELSE 0 END ;;
  }

  dimension:cancel_req_booking_flag
  {
    type: number
    sql: CASE WHEN ${cancel_req_created_date} <= ${last_booking_date} THEN 1 ELSE 0 END ;;
  }

  dimension:  cancel_request_no_churn_yet_opp{
   type: number
   sql: CASE WHEN  (${mrr_churn_amt} = 0 OR ${mrr_churn_amt} IS NULL)  AND ${cancel_req_booking_flag} = 1 AND ${customer_saved_c} <> 1 AND ${uncancel_c} <> 1 THEN 1 ELSE 0 END ;;
  drill_fields: [customer,cancel_req_created_date,requested_product_cancel,mrr_churn_date,cancellation_effective_date_c_date,last_booking_date,primary_cancel_reason_c,cancel_req_owner_name]
    }


  measure: sum_cancelled_reception_product {
    type: sum
    label: "Cancelled Reception"
     filters: [cancelled_account_reception_product: "1"]
     sql:  CASE WHEN ${requested_product_cancel}  = 'Reception' AND ${mrr_churn_amt} < 0 AND ${last_book_before_churn_d} = 1 AND ${customer_saved_c} <> 1 AND ${uncancel_c} <> 1 THEN 1 ELSE 0 END ;;
     drill_fields: [customer,cancel_req_created_date,requested_product_cancel,mrr_churn_date,cancellation_effective_date_c_date,last_booking_date,primary_cancel_reason_c,cancel_req_owner_name]
  }

  measure: sum_cancelled_chat_product {
    type: sum
    label: "Cancelled Chat"
    filters: [cancelled_account_chat_product: "1"]
    sql:  CASE WHEN ${requested_product_cancel}  = 'Chat' AND ${mrr_churn_amt} < 0 AND ${last_book_before_churn_d} = 1 AND ${customer_saved_c} <> 1 AND ${uncancel_c} <> 1 THEN 1 ELSE 0 END ;;
    drill_fields: [customer,cancel_req_created_date,requested_product_cancel,mrr_churn_date,cancellation_effective_date_c_date,last_booking_date,primary_cancel_reason_c,cancel_req_owner_name]
  }

  measure: sum_cancelsave_reception_product {
    type: sum
    label: "Cancelled Save Reception"
    filters: [cancel_save_reception_product: "1"]
    sql:CASE WHEN ${requested_product_cancel}  = 'Reception' AND ${customer_saved_c} = 1 AND ${cancel_req_created_date} <= ${last_booking_date} THEN 1 ELSE 0 END ;;
    drill_fields: [customer,cancel_req_created_date,requested_product_cancel,mrr_churn_date,cancellation_effective_date_c_date,last_booking_date,primary_cancel_reason_c,cancel_req_owner_name,cancel_save_owner_name]
  }

  measure: sum_cancelledsave_chat_product {
    type: sum
    label: "Cancel Save Chat"
    filters: [cancel_save_chat_product: "1"]
    sql:  CASE WHEN ${requested_product_cancel}  = 'Chat' AND ${customer_saved_c} = 1 AND ${cancel_req_created_date} <= ${last_booking_date} THEN 1 ELSE 0 END ;;
    drill_fields: [customer,cancel_req_created_date,requested_product_cancel,mrr_churn_date,cancellation_effective_date_c_date,last_booking_date,primary_cancel_reason_c,cancel_req_owner_name,cancel_save_owner_name]
  }

  measure: sum_cancelrequest_nochurn_opp {
    type: sum
    label: "Cancelled Request No Churn Yet"
    filters: [cancel_request_no_churn_yet_opp: "1"]
    sql:  CASE WHEN  (${mrr_churn_amt} = 0 OR ${mrr_churn_amt} IS NULL)  AND ${cancel_req_booking_flag} = 1 AND ${customer_saved_c} <> 1 AND ${uncancel_c} <> 1 THEN 1 ELSE 0 END ;;
    drill_fields: [customer,cancel_req_created_date,requested_product_cancel,mrr_churn_date,cancellation_effective_date_c_date,last_booking_date,primary_cancel_reason_c,primary_reason_detail_c,primary_attempted_tactic_c,cancel_req_owner_name]
  }

  measure: count_distinct_cancelled_accounts {
    type:  count_distinct
    label: "Cancelled Accounts"
    sql:  ${TABLE}."CRM_ID"  ;;
    filters:   [mrr_churn_amt:"<0",last_book_before_churn_d:"=1",customer_saved_c: "-1",uncancel_c: "-1" ]
    drill_fields: [customer,cancel_req_created_date,requested_product_cancel,mrr_churn_date,cancellation_effective_date_c_date,last_booking_date,primary_cancel_reason_c,cancel_req_owner_name]
  }

  measure: count_distinct_cancel_save_accounts {
    type:  count_distinct
    label: "Cancel Saved Accounts"
    sql:  ${TABLE}."CRM_ID"  ;;
    filters:   [cancel_req_booking_flag:"=1",customer_saved_c: "1" ]
    drill_fields: [customer,cancel_req_created_date,requested_product_cancel,mrr_churn_date,cancellation_effective_date_c_date,last_booking_date,primary_cancel_reason_c,cancel_req_owner_name]
  }

  measure: count_distinct_cancel_requested_accounts {
    type:  count_distinct
    label: "Cancel Requested Accounts"
    sql:  ${TABLE}."CRM_ID"  ;;
    drill_fields: [customer,cancel_req_created_date,requested_product_cancel,mrr_churn_date,cancellation_effective_date_c_date,last_booking_date,primary_cancel_reason_c,cancel_req_owner_name]
  }



}
