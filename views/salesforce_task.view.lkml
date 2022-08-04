view: salesforce_task {
      derived_table: {
      sql: SELECT T.*,A.NAME
           FROM FIVETRAN_DB.SALESFORCE.TASK T
          LEFT JOIN FIVETRAN_DB.SALESFORCE."ACCOUNT" A
        ON A.ID=COALESCE(T.ACCOUNT_C,T.ACCOUNT_ID)
           WHERE T.IS_DELETED <> 1 AND A.IS_DELETED <> 1
          AND CAST(T.CREATED_DATE AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',Current_Date))
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }


  measure:due_today  {
    type: sum
    sql: CASE WHEN ${status} = 'Open' AND CAST(${activity_date_date} AS DATE) = ${today_date} THEN 1 ELSE 0 END ;;
  }

  measure: completed_today {
    type: sum
    sql: CASE WHEN ${status} = 'Completed' AND CAST(${completed_date_time_date} AS DATE) = ${today_date} AND CAST(${activity_date_date} AS DATE) = ${today_date}  THEN 1 ELSE 0 END ;;

  }

  measure: followupcall_completion_rate_today {
    type: number
    value_format_name: percent_1
    sql: ${completed_today} / NULLIF(${due_today},0) ;;

   }


    dimension: id {
      type: string
      sql: ${TABLE}."ID" ;;
    }

    dimension: who_id {
      type: string
      sql: ${TABLE}."WHO_ID" ;;
    }

    dimension: what_id {
      type: string
      sql: ${TABLE}."WHAT_ID" ;;
    }

    dimension: who_count {
      type: number
      sql: ${TABLE}."WHO_COUNT" ;;
    }

    dimension: what_count {
      type: number
      sql: ${TABLE}."WHAT_COUNT" ;;
    }

    dimension: subject {
      type: string
      sql: ${TABLE}."SUBJECT" ;;
    }

    dimension:account_name {
      type: string
      sql: ${TABLE}.NAME ;;

    }

    dimension_group: activity_date {
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
      sql: ${TABLE}."ACTIVITY_DATE" ;;
    }

    dimension: status {
      type: string
      sql: ${TABLE}."STATUS" ;;
    }

    dimension: priority {
      type: string
      sql: ${TABLE}."PRIORITY" ;;
    }

    dimension: is_high_priority {
      type: yesno
      sql: ${TABLE}."IS_HIGH_PRIORITY" ;;
    }

    dimension: owner_id {
      type: string
      sql: ${TABLE}."OWNER_ID" ;;
    }

    dimension: description {
      type: string
      sql: ${TABLE}."DESCRIPTION" ;;
    }

    dimension: type {
      type: string
      sql: ${TABLE}."TYPE" ;;
    }

    dimension: is_deleted {
      type: yesno
      sql: ${TABLE}."IS_DELETED" ;;
    }

    dimension: account_id {
      type: string
      sql: ${TABLE}."ACCOUNT_ID" ;;
    }

    dimension: is_closed {
      type: yesno
      sql: ${TABLE}."IS_CLOSED" ;;
    }

    dimension_group: created_date {
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
      datatype: datetime
      sql: ${TABLE}."CREATED_DATE" ;;
    }

    dimension: created_by_id {
      type: string
      sql: ${TABLE}."CREATED_BY_ID" ;;
    }

    dimension_group: last_modified_date {
      type: time
      sql: ${TABLE}."LAST_MODIFIED_DATE" ;;
    }

    dimension: last_modified_by_id {
      type: string
      sql: ${TABLE}."LAST_MODIFIED_BY_ID" ;;
    }

    dimension_group: system_modstamp {
      type: time
      sql: ${TABLE}."SYSTEM_MODSTAMP" ;;
    }

    dimension: call_duration_in_seconds {
      type: number
      sql: ${TABLE}."CALL_DURATION_IN_SECONDS" ;;
    }

    dimension: call_type {
      type: string
      sql: ${TABLE}."CALL_TYPE" ;;
    }

    dimension: call_disposition {
      type: string
      sql: ${TABLE}."CALL_DISPOSITION" ;;
    }

    dimension: call_object {
      type: string
      sql: ${TABLE}."CALL_OBJECT" ;;
    }

    dimension_group: reminder_date_time {
      type: time
      sql: ${TABLE}."REMINDER_DATE_TIME" ;;
    }

    dimension: is_reminder_set {
      type: yesno
      sql: ${TABLE}."IS_REMINDER_SET" ;;
    }

    dimension: recurrence_activity_id {
      type: string
      sql: ${TABLE}."RECURRENCE_ACTIVITY_ID" ;;
    }

    dimension: is_recurrence {
      type: yesno
      sql: ${TABLE}."IS_RECURRENCE" ;;
    }

    dimension: recurrence_start_date_only {
      type: date
      sql: ${TABLE}."RECURRENCE_START_DATE_ONLY" ;;
    }

    dimension: recurrence_end_date_only {
      type: date
      sql: ${TABLE}."RECURRENCE_END_DATE_ONLY" ;;
    }

    dimension: recurrence_time_zone_sid_key {
      type: string
      sql: ${TABLE}."RECURRENCE_TIME_ZONE_SID_KEY" ;;
    }

    dimension: recurrence_type {
      type: string
      sql: ${TABLE}."RECURRENCE_TYPE" ;;
    }

    dimension: recurrence_interval {
      type: number
      sql: ${TABLE}."RECURRENCE_INTERVAL" ;;
    }

    dimension: recurrence_day_of_week_mask {
      type: number
      sql: ${TABLE}."RECURRENCE_DAY_OF_WEEK_MASK" ;;
    }

    dimension: recurrence_day_of_month {
      type: number
      sql: ${TABLE}."RECURRENCE_DAY_OF_MONTH" ;;
    }

    dimension: recurrence_instance {
      type: string
      sql: ${TABLE}."RECURRENCE_INSTANCE" ;;
    }

    dimension: recurrence_month_of_year {
      type: string
      sql: ${TABLE}."RECURRENCE_MONTH_OF_YEAR" ;;
    }

    dimension: recurrence_regenerated_type {
      type: string
      sql: ${TABLE}."RECURRENCE_REGENERATED_TYPE" ;;
    }

    dimension: task_subtype {
      type: string
      sql: ${TABLE}."TASK_SUBTYPE" ;;
    }

    dimension: olsa_contact_id_c {
      type: string
      sql: ${TABLE}."OLSA_CONTACT_ID_C" ;;
    }

    dimension: olsa_guid_c {
      type: string
      sql: ${TABLE}."OLSA_GUID_C" ;;
    }

    dimension: olsa_company_c {
      type: string
      sql: ${TABLE}."OLSA_COMPANY_C" ;;
    }

    dimension: olsa_company_phone_c {
      type: string
      sql: ${TABLE}."OLSA_COMPANY_PHONE_C" ;;
    }

    dimension: call_result_c {
      type: string
      sql: ${TABLE}."CALL_RESULT_C" ;;
    }

    dimension: olsa_website_c {
      type: string
      sql: ${TABLE}."OLSA_WEBSITE_C" ;;
    }

    dimension: olsa_fax_c {
      type: string
      sql: ${TABLE}."OLSA_FAX_C" ;;
    }

    dimension: olsa_street_c {
      type: string
      sql: ${TABLE}."OLSA_STREET_C" ;;
    }

    dimension: olsa_city_c {
      type: string
      sql: ${TABLE}."OLSA_CITY_C" ;;
    }

    dimension: olsa_state_c {
      type: string
      sql: ${TABLE}."OLSA_STATE_C" ;;
    }

    dimension: olsa_billing_contact_c {
      type: string
      sql: ${TABLE}."OLSA_BILLING_CONTACT_C" ;;
    }

    dimension: olsa_greeting_c {
      type: string
      sql: ${TABLE}."OLSA_GREETING_C" ;;
    }

    dimension: scheduled_c {
      type: yesno
      sql: ${TABLE}."SCHEDULED_C" ;;
    }

    dimension: olsa_how_did_you_hear_about_us_c {
      type: string
      sql: ${TABLE}."OLSA_HOW_DID_YOU_HEAR_ABOUT_US_C" ;;
    }

    dimension: olsa_are_you_an_active_client_c {
      type: yesno
      sql: ${TABLE}."OLSA_ARE_YOU_AN_ACTIVE_CLIENT_C" ;;
    }

    dimension: olsa_what_does_your_organization_do_c {
      type: string
      sql: ${TABLE}."OLSA_WHAT_DOES_YOUR_ORGANIZATION_DO_C" ;;
    }

    dimension: olsa_billing_plan_selection_c {
      type: string
      sql: ${TABLE}."OLSA_BILLING_PLAN_SELECTION_C" ;;
    }

    dimension: olsa_billing_street_c {
      type: string
      sql: ${TABLE}."OLSA_BILLING_STREET_C" ;;
    }

    dimension: olsa_billing_city_c {
      type: string
      sql: ${TABLE}."OLSA_BILLING_CITY_C" ;;
    }

    dimension: olsa_billing_state_c {
      type: string
      sql: ${TABLE}."OLSA_BILLING_STATE_C" ;;
    }

    dimension: olsa_billing_zip_c {
      type: string
      sql: ${TABLE}."OLSA_BILLING_ZIP_C" ;;
    }

    dimension: olsa_promo_code_c {
      type: string
      sql: ${TABLE}."OLSA_PROMO_CODE_C" ;;
    }

    dimension: olsa_accepts_terms_and_conditions_c {
      type: yesno
      sql: ${TABLE}."OLSA_ACCEPTS_TERMS_AND_CONDITIONS_C" ;;
    }

    dimension: save_and_continue_url_c {
      type: string
      sql: ${TABLE}."SAVE_AND_CONTINUE_URL_C" ;;
    }

    dimension: save_and_continue_expiration_c {
      type: date
      sql: ${TABLE}."SAVE_AND_CONTINUE_EXPIRATION_C" ;;
    }

    dimension: olsa_billing_credit_card_token_c {
      type: string
      sql: ${TABLE}."OLSA_BILLING_CREDIT_CARD_TOKEN_C" ;;
    }

    dimension: olsa_contact_guid_c {
      type: string
      sql: ${TABLE}."OLSA_CONTACT_GUID_C" ;;
    }

    dimension: olsa_first_name_c {
      type: string
      sql: ${TABLE}."OLSA_FIRST_NAME_C" ;;
    }

    dimension: olsa_last_name_c {
      type: string
      sql: ${TABLE}."OLSA_LAST_NAME_C" ;;
    }

    dimension: olsa_email_c {
      type: string
      sql: ${TABLE}."OLSA_EMAIL_C" ;;
    }

    dimension: olsa_zip_c {
      type: string
      sql: ${TABLE}."OLSA_ZIP_C" ;;
    }

    dimension_group: olsa_create_date_c {
      type: time
      sql: ${TABLE}."OLSA_CREATE_DATE_C" ;;
    }

    dimension_group: olsa_last_updated_c {
      type: time
      sql: ${TABLE}."OLSA_LAST_UPDATED_C" ;;
    }

    dimension: olsa_referring_client_c {
      type: string
      sql: ${TABLE}."OLSA_REFERRING_CLIENT_C" ;;
    }

    dimension: status_c {
      type: string
      sql: ${TABLE}."STATUS_C" ;;
    }

    dimension: name_first_last_c {
      type: string
      sql: ${TABLE}."NAME_FIRST_LAST_C" ;;
    }

    dimension: name_of_rp_c {
      type: string
      sql: ${TABLE}."NAME_OF_RP_C" ;;
    }

    dimension: name_of_bp_c {
      type: string
      sql: ${TABLE}."NAME_OF_BP_C" ;;
    }

    dimension: published_s_c {
      type: string
      sql: ${TABLE}."PUBLISHED_S_C" ;;
    }

    dimension: prl_address_c {
      type: string
      sql: ${TABLE}."PRL_ADDRESS_C" ;;
    }

    dimension: website_c {
      type: string
      sql: ${TABLE}."WEBSITE_C" ;;
    }

    dimension: fax_number_c {
      type: string
      sql: ${TABLE}."FAX_NUMBER_C" ;;
    }

    dimension: company_c {
      type: string
      sql: ${TABLE}."COMPANY_C" ;;
    }

    dimension: phone_number_c {
      type: string
      sql: ${TABLE}."PHONE_NUMBER_C" ;;
    }

    dimension: email_c {
      type: string
      sql: ${TABLE}."EMAIL_C" ;;
    }

    dimension: partnership_engagement_handoff_c {
      type: yesno
      sql: ${TABLE}."PARTNERSHIP_ENGAGEMENT_HANDOFF_C" ;;
    }

    dimension: in_progress_c {
      type: yesno
      sql: ${TABLE}."IN_PROGRESS_C" ;;
    }

    dimension: time_zone_c {
      type: string
      sql: ${TABLE}."TIME_ZONE_C" ;;
    }

    dimension: account_c {
      type: string
      sql: ${TABLE}."ACCOUNT_C" ;;
    }

    dimension: added_to_wo_w_log_c {
      type: string
      sql: ${TABLE}."ADDED_TO_WO_W_LOG_C" ;;
    }

    dimension: case_c {
      type: string
      sql: ${TABLE}."CASE_C" ;;
    }

    dimension: connection_type_c {
      type: string
      sql: ${TABLE}."CONNECTION_TYPE_C" ;;
    }

    dimension: contact_c {
      type: string
      sql: ${TABLE}."CONTACT_C" ;;
    }

    dimension: notes_ch_c {
      type: string
      sql: ${TABLE}."NOTES_CH_C" ;;
    }

    dimension: scheduled_date_c {
      type: date
      sql: ${TABLE}."SCHEDULED_DATE_C" ;;
    }

    dimension: scheduled_time_c {
      type: string
      sql: ${TABLE}."SCHEDULED_TIME_C" ;;
    }

    dimension: update_at_c {
      type: string
      sql: ${TABLE}."UPDATE_AT_C" ;;
    }

    dimension: type_ch_c {
      type: string
      sql: ${TABLE}."TYPE_CH_C" ;;
    }

    dimension: pc_event_id_c {
      type: string
      sql: ${TABLE}."PC_EVENT_ID_C" ;;
    }

    dimension: pc_task_id_c {
      type: string
      sql: ${TABLE}."PC_TASK_ID_C" ;;
    }

    dimension: pc_comments_c {
      type: string
      sql: ${TABLE}."PC_COMMENTS_C" ;;
    }

    dimension: lead_phone_lookup_c {
      type: string
      sql: ${TABLE}."LEAD_PHONE_LOOKUP_C" ;;
    }

    dimension: opportunity_phone_lookup_for_lex_c {
      type: string
      sql: ${TABLE}."OPPORTUNITY_PHONE_LOOKUP_FOR_LEX_C" ;;
    }

    dimension_group: _fivetran_synced {
      type: time
      sql: ${TABLE}."_FIVETRAN_SYNCED" ;;
    }

    dimension_group: completed_date_time {
      type: time
      sql: ${TABLE}."COMPLETED_DATE_TIME" ;;
    }

    dimension: record_type_id {
      type: string
      sql: ${TABLE}."RECORD_TYPE_ID" ;;
    }

    dimension: ringdna_call_hour_of_day_agent_c {
      type: number
      sql: ${TABLE}."RINGDNA_CALL_HOUR_OF_DAY_AGENT_C" ;;
    }

    dimension_group: ringdna_call_start_time_c {
      type: time
      sql: ${TABLE}."RINGDNA_CALL_START_TIME_C" ;;
    }

    dimension: ringdna_call_duration_c {
      type: number
      sql: ${TABLE}."RINGDNA_CALL_DURATION_C" ;;
    }

    dimension: ringdna_called_back_c {
      type: yesno
      sql: ${TABLE}."RINGDNA_CALLED_BACK_C" ;;
    }

    dimension: ringdna_call_flow_c {
      type: string
      sql: ${TABLE}."RINGDNA_CALL_FLOW_C" ;;
    }

    dimension: ringdna_queue_hold_time_c {
      type: number
      sql: ${TABLE}."RINGDNA_QUEUE_HOLD_TIME_C" ;;
    }

    dimension: ringdna_voicemail_c {
      type: yesno
      sql: ${TABLE}."RINGDNA_VOICEMAIL_C" ;;
    }

    dimension: rdnacadence_sequence_action_c {
      type: string
      sql: ${TABLE}."RDNACADENCE_SEQUENCE_ACTION_C" ;;
    }

    dimension: ringdna_call_rating_c {
      type: number
      sql: ${TABLE}."RINGDNA_CALL_RATING_C" ;;
    }

    dimension: ringdna_call_direction_c {
      type: string
      sql: ${TABLE}."RINGDNA_CALL_DIRECTION_C" ;;
    }

    dimension: ringdna_call_hour_of_day_local_c {
      type: number
      sql: ${TABLE}."RINGDNA_CALL_HOUR_OF_DAY_LOCAL_C" ;;
    }

    dimension: ringdna_call_disposition_c {
      type: string
      sql: ${TABLE}."RINGDNA_CALL_DISPOSITION_C" ;;
    }

    dimension: ringdna_local_presence_num_c {
      type: string
      sql: ${TABLE}."RINGDNA_LOCAL_PRESENCE_NUM_C" ;;
    }

    dimension: ringdna_automated_voicemail_used_c {
      type: string
      sql: ${TABLE}."RINGDNA_AUTOMATED_VOICEMAIL_USED_C" ;;
    }

    dimension: ringdna_from_number_c {
      type: string
      sql: ${TABLE}."RINGDNA_FROM_NUMBER_C" ;;
    }

    dimension: ringdna_keywords_c {
      type: string
      sql: ${TABLE}."RINGDNA_KEYWORDS_C" ;;
    }

    dimension: ringdna_call_recording_url_c {
      type: string
      sql: ${TABLE}."RINGDNA_CALL_RECORDING_URL_C" ;;
    }

    dimension: ringdna_meeting_id_c {
      type: string
      sql: ${TABLE}."RINGDNA_MEETING_ID_C" ;;
    }

    dimension: ringdna_no_answer_number_used_c {
      type: yesno
      sql: ${TABLE}."RINGDNA_NO_ANSWER_NUMBER_USED_C" ;;
    }

    dimension: ringdna_created_by_ring_dna_c {
      type: yesno
      sql: ${TABLE}."RINGDNA_CREATED_BY_RING_DNA_C" ;;
    }

    dimension: ringdna_local_presence_c {
      type: yesno
      sql: ${TABLE}."RINGDNA_LOCAL_PRESENCE_C" ;;
    }

    dimension: ringdna_call_status_c {
      type: string
      sql: ${TABLE}."RINGDNA_CALL_STATUS_C" ;;
    }

    dimension: ringdna_supervisor_notes_c {
      type: string
      sql: ${TABLE}."RINGDNA_SUPERVISOR_NOTES_C" ;;
    }

    dimension: ringdna_automated_voicemail_c {
      type: yesno
      sql: ${TABLE}."RINGDNA_AUTOMATED_VOICEMAIL_C" ;;
    }

    dimension: ringdna_abandoned_call_c {
      type: yesno
      sql: ${TABLE}."RINGDNA_ABANDONED_CALL_C" ;;
    }

    dimension: ringdna_to_number_c {
      type: string
      sql: ${TABLE}."RINGDNA_TO_NUMBER_C" ;;
    }

    dimension: ringdna_initiating_record_id_c {
      type: string
      sql: ${TABLE}."RINGDNA_INITIATING_RECORD_ID_C" ;;
    }

    dimension: ringdna_host_id_c {
      type: string
      sql: ${TABLE}."RINGDNA_HOST_ID_C" ;;
    }

    dimension: ringdna_automated_voicemail_link_c {
      type: string
      sql: ${TABLE}."RINGDNA_AUTOMATED_VOICEMAIL_LINK_C" ;;
    }

    dimension: ringdna_queue_c {
      type: string
      sql: ${TABLE}."RINGDNA_QUEUE_C" ;;
    }

    dimension: proactive_type_c {
      type: string
      sql: ${TABLE}."PROACTIVE_TYPE_C" ;;
    }

    dimension: csm_intro_c {
      type: yesno
      sql: ${TABLE}."CSM_INTRO_C" ;;
    }

    dimension: upgrade_results_c {
      type: string
      sql: ${TABLE}."UPGRADE_RESULTS_C" ;;
    }

    dimension: call_result_csm_c {
      type: string
      sql: ${TABLE}."CALL_RESULT_CSM_C" ;;
    }

    dimension: la_test_c {
      type: string
      sql: ${TABLE}."LA_TEST_C" ;;
    }

    dimension: calendly_invitee_uuid_c {
      type: string
      sql: ${TABLE}."CALENDLY_INVITEE_UUID_C" ;;
    }

    dimension: calendly_is_rescheduled_c {
      type: yesno
      sql: ${TABLE}."CALENDLY_IS_RESCHEDULED_C" ;;
    }

    dimension: is_archived {
      type: yesno
      sql: ${TABLE}."IS_ARCHIVED" ;;
    }

    dimension: cross_sell_results_c {
      type: string
      sql: ${TABLE}."CROSS_SELL_RESULTS_C" ;;
    }

    dimension: ringdna_conversation_c {
      type: string
      sql: ${TABLE}."RINGDNA_CONVERSATION_C" ;;
    }

    dimension: handoff_no_reason_c {
      type: string
      sql: ${TABLE}."HANDOFF_NO_REASON_C" ;;
    }

    dimension: handoff_c {
      type: string
      sql: ${TABLE}."HANDOFF_C" ;;
    }

    dimension: handoff_notes_c {
      type: string
      sql: ${TABLE}."HANDOFF_NOTES_C" ;;
    }

    dimension: salesforce_account_coalesce{
      label: "Salesforce Account"
      type: string
      sql: COALESCE(${account_c},${account_id}) ;;


    }


  dimension_group: today {

    type: time

    hidden: no

    timeframes: [day_of_month, month, month_num, date, raw]

    sql: current_date;;
    }







    set: detail {
      fields: [
        account_name,
        subject,
        activity_date_date,
        status,
        priority,
        is_high_priority,
        description,
        type,
        is_closed,
        created_date_date,
        reminder_date_time_time,
        case_c,
        notes_ch_c,
        scheduled_date_c,
        scheduled_time_c,
        type_ch_c,
        completed_date_time_time,
            ]

    }
  }
