view: cancel_c {
  sql_table_name: "SALESFORCE"."CANCEL_C"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: _fivetran_synced {
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
    sql: ${TABLE}.CAST(${TABLE}."_FIVETRAN_SYNCED" AS TIMESTAMP_NTZ) ;;
  }

  dimension: account_c {
    type: string
    sql: ${TABLE}."ACCOUNT_C" ;;
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

  dimension: cancellation_channel_c {
    type: string
    sql: ${TABLE}."CANCELLATION_CHANNEL_C" ;;
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

  dimension: contact_c {
    type: string
    sql: ${TABLE}."CONTACT_C" ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}."CREATED_BY_ID" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.CAST(${TABLE}."CREATED_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: credit_applied_c {
    type: string
    sql: ${TABLE}."CREDIT_APPLIED_C" ;;
  }

  dimension: customer_activation_date_age_c {
    type: number
    sql: ${TABLE}."CUSTOMER_ACTIVATION_DATE_AGE_C" ;;
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

  dimension: if_not_rp_has_rp_been_notified_c {
    type: string
    sql: ${TABLE}."IF_NOT_RP_HAS_RP_BEEN_NOTIFIED_C" ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}."IS_DELETED" ;;
  }

  dimension: is_rp_c {
    type: yesno
    sql: ${TABLE}."IS_RP_C" ;;
  }

  dimension_group: last_activity {
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
    sql: ${TABLE}."LAST_ACTIVITY_DATE" ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}."LAST_MODIFIED_BY_ID" ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.CAST(${TABLE}."LAST_MODIFIED_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: last_referenced {
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
    sql: ${TABLE}.CAST(${TABLE}."LAST_REFERENCED_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: last_viewed {
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
    sql: ${TABLE}.CAST(${TABLE}."LAST_VIEWED_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: may_return_c {
    type: yesno
    sql: ${TABLE}."MAY_RETURN_C" ;;
  }

  dimension: may_return_v_2_c {
    type: string
    sql: ${TABLE}."MAY_RETURN_V_2_C" ;;
  }

  dimension: mbg_exercised_c {
    type: string
    sql: ${TABLE}."MBG_EXERCISED_C" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: not_a_good_fit_c {
    type: yesno
    sql: ${TABLE}."NOT_A_GOOD_FIT_C" ;;
  }

  dimension: notes_c {
    type: string
    sql: ${TABLE}."NOTES_C" ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}."OWNER_ID" ;;
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

  dimension: primary_reason_other_c {
    type: string
    sql: ${TABLE}."PRIMARY_REASON_OTHER_C" ;;
  }

  dimension: product_cancelling_c {
    type: string
    sql: ${TABLE}."PRODUCT_CANCELLING_C" ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}."RECORD_TYPE_ID" ;;
  }

  dimension: retention_steps_taken_c {
    type: string
    sql: ${TABLE}."RETENTION_STEPS_TAKEN_C" ;;
  }

  dimension: second_reason_detail_c {
    type: string
    sql: ${TABLE}."SECOND_REASON_DETAIL_C" ;;
  }

  dimension: secondary_attempted_tactic_c {
    type: string
    sql: ${TABLE}."SECONDARY_ATTEMPTED_TACTIC_C" ;;
  }

  dimension: secondary_cancel_reason_c {
    type: string
    sql: ${TABLE}."SECONDARY_CANCEL_REASON_C" ;;
  }

  dimension: service_issues_c {
    type: string
    sql: ${TABLE}."SERVICE_ISSUES_C" ;;
  }

  dimension: service_issues_other_c {
    type: string
    sql: ${TABLE}."SERVICE_ISSUES_OTHER_C" ;;
  }

  dimension_group: system_modstamp {
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
    sql: ${TABLE}.CAST(${TABLE}."SYSTEM_MODSTAMP" AS TIMESTAMP_NTZ) ;;
  }

  dimension: tertiary_cancel_reason_c {
    type: string
    sql: ${TABLE}."TERTIARY_CANCEL_REASON_C" ;;
  }

  dimension: tertiary_reason_detail_c {
    type: string
    sql: ${TABLE}."TERTIARY_REASON_DETAIL_C" ;;
  }

  dimension: uncancel_c {
    type: yesno
    sql: ${TABLE}."UNCANCEL_C" ;;
  }

  dimension: was_customer_called_c {
    type: string
    sql: ${TABLE}."WAS_CUSTOMER_CALLED_C" ;;
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

  dimension: which_competitor_c {
    type: string
    sql: ${TABLE}."WHICH_COMPETITOR_C" ;;
  }

  dimension: who_saved_c {
    type: string
    sql: ${TABLE}."WHO_SAVED_C" ;;
  }

  dimension: winback_email_notif_sent_c {
    type: yesno
    sql: ${TABLE}."WINBACK_EMAIL_NOTIF_SENT_C" ;;
  }

  dimension: x_30_day_notice_c {
    type: string
    sql: ${TABLE}."X_30_DAY_NOTICE_C" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  measure: Total_Cancel_Save {
    type: count
    filters: [customer_saved_c: "1"]
  }

}
