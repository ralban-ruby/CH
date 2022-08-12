view: salesforce_case {
     derived_table: {
      sql: SELECT *
              FROM FIVETRAN_DB.SALESFORCE.CASE C
              WHERE C.IS_DELETED <> 1
              AND CAST(C.CREATED_DATE AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',Current_Date))
               ;;
    }

    measure: case_count_distinct {
      type: count_distinct
      label: "Total Distinct Cases"
      sql: ${TABLE}."ID" ;;
      drill_fields: [case_owner_name, case_owner_title,account_name,case_number,supplied_name,supplied_email,supplied_phone,status,is_closed,closed_date_time,created_date_time]
    }




    dimension: complaint_type  {
      type: string
      sql: CASE
    WHEN (WRAP_UP_CODE_C = 'Service_Complaint')
      AND (WRAP_UP_SUB_CODES_C IN ('Response Time', 'Minor spelling issue (non-verify account)', 'Call Connect', 'Call Metrics - Answer Time', 'Call Metrics - Hold Time', 'Call Metrics - Length of call', 'Call metrics – All others', 'Call metrics – Parking', 'Call metrics – Length of call', 'No Error Found', 'Other', 'Spelling Issue', 'Ruby billing practices', 'Complaint about lack of feature', 'Customer was mistaken')) THEN 'Other'
    WHEN (WRAP_UP_CODE_C = 'Service_Complaint')
      AND (WRAP_UP_SUB_CODES_C IN ('Ruby tone', 'Pronunciation')) THEN 'Services'
    WHEN (WRAP_UP_CODE_C = 'Service_Complaint')
      AND (WRAP_UP_SUB_CODES_C IN ('Vague complaint', 'Caller did not provide helpful information')) THEN 'Customer Perception'
    WHEN (WRAP_UP_CODE_C = 'Service_Complaint')
      AND (WRAP_UP_SUB_CODES_C IN ('Red Floor')) THEN 'Call Metrics'
    WHEN (WRAP_UP_CODE_C = 'Service_Complaint')
      AND (WRAP_UP_SUB_CODES_C IN ('Solicitors/Robocalls')) THEN 'Product'
    WHEN (WRAP_UP_CODE_C = 'Service_Complaint')
      AND (WRAP_UP_SUB_CODES_C IN ('Incorrect Onboarding Expectations')) THEN 'Ruby Experience'
    WHEN (WRAP_UP_CODE_C = 'Complaint - Technology Issue')
      AND (WRAP_UP_SUB_CODES_C IN ('Activity','Integrations','Spoofing/CFBNA','Texting')) THEN 'Online Features'
    WHEN ( WRAP_UP_CODE_C='Complaint - Technology Issue')
      AND (WRAP_UP_SUB_CODES_C IN('Chatbot','Ruby Self-Service Chat'))  THEN 'Self-Serve Chat'
    WHEN (WRAP_UP_CODE_C='PureChat')
      AND ( WRAP_UP_SUB_CODES_C='Tech Complaint') THEN 'Tech Complaint'
    ELSE WRAP_UP_CODE_C
  END ;;
        }

    dimension: id {
      primary_key: yes
      type: string
      sql: ${TABLE}."ID" ;;
    }

    dimension: is_deleted {
      type: yesno
      sql: ${TABLE}."IS_DELETED" ;;
    }

    dimension: case_number {
      type: string
      sql: ${TABLE}."CASE_NUMBER" ;;
    }

    dimension: contact_id {
      type: string
      sql: ${TABLE}."CONTACT_ID" ;;
    }


    dimension: account_id {
      type: string
      sql: ${TABLE}."ACCOUNT_ID" ;;
    }

  dimension: account_name {
      sql: ${salesforce_account.name} ;;
    }

  dimension: case_owner_name {
    sql: ${employee_lookup_master.name} ;;
     }

  dimension: case_owner_title {
    sql:${employee_lookup_master.title} ;;
      }

    dimension: supplied_name {
      type: string
      sql: ${TABLE}."SUPPLIED_NAME" ;;
    }

    dimension: supplied_email {
      type: string
      sql: ${TABLE}."SUPPLIED_EMAIL" ;;
    }

    dimension: supplied_phone {
      type: string
      sql: ${TABLE}."SUPPLIED_PHONE" ;;
    }

    dimension: supplied_company {
      type: string
      sql: ${TABLE}."SUPPLIED_COMPANY" ;;
    }

    dimension: type {
      type: string
      sql: ${TABLE}."TYPE" ;;
    }

    dimension: record_type_id {
      type: string
      sql: ${TABLE}."RECORD_TYPE_ID" ;;
    }

    dimension: status {
      type: string
      sql: ${TABLE}."STATUS" ;;
    }

    dimension: reason {
      type: string
      sql: ${TABLE}."REASON" ;;
    }

    dimension: origin {
      type: string
      sql: ${TABLE}."ORIGIN" ;;
    }

    dimension: subject {
      type: string
      sql: ${TABLE}."SUBJECT" ;;
    }

    dimension: priority {
      type: string
      sql: ${TABLE}."PRIORITY" ;;
    }

    dimension: description {
      type: string
      sql: ${TABLE}."DESCRIPTION" ;;
    }

    dimension: is_closed {
      type: yesno
      sql: ${TABLE}."IS_CLOSED" ;;
    }

    dimension_group: closed_date {
      type: time
      sql: ${TABLE}."CLOSED_DATE" ;;
    }

    dimension: owner_id {
      type: string
      sql: ${TABLE}."OWNER_ID" ;;
    }

    dimension_group: created_date {
      type: time
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

    dimension: contact_phone {
      type: string
      sql: ${TABLE}."CONTACT_PHONE" ;;
    }

    dimension: contact_mobile {
      type: string
      sql: ${TABLE}."CONTACT_MOBILE" ;;
    }

    dimension: contact_email {
      type: string
      sql: ${TABLE}."CONTACT_EMAIL" ;;
    }

    dimension: contact_fax {
      type: string
      sql: ${TABLE}."CONTACT_FAX" ;;
    }

    dimension_group: last_viewed_date {
      type: time
      sql: ${TABLE}."LAST_VIEWED_DATE" ;;
    }

    dimension_group: last_referenced_date {
      type: time
      sql: ${TABLE}."LAST_REFERENCED_DATE" ;;
    }

    dimension: buddy_case_c {
      type: yesno
      sql: ${TABLE}."BUDDY_CASE_C" ;;
    }

    dimension: customer_success_selection_c {
      type: string
      sql: ${TABLE}."CUSTOMER_SUCCESS_SELECTION_C" ;;
    }

    dimension: error_notes_c {
      type: string
      sql: ${TABLE}."ERROR_NOTES_C" ;;
    }

    dimension: error_specifics_c {
      type: string
      sql: ${TABLE}."ERROR_SPECIFICS_C" ;;
    }

    dimension: error_type_c {
      type: string
      sql: ${TABLE}."ERROR_TYPE_C" ;;
    }

    dimension_group: last_response_time_c {
      type: time
      sql: ${TABLE}."LAST_RESPONSE_TIME_C" ;;
    }

    dimension: new_reply_notification_c {
      type: string
      label: "CURRENT_NEW_REPLY_NOTIFICATION_C"
      sql: ${TABLE}."NEW_REPLY_NOTIFICATION_C" ;;
    }

    dimension: ruby_receptionist_c {
      type: string
      sql: ${TABLE}."RUBY_RECEPTIONIST_C" ;;
    }

    dimension: wrap_up_code_c {
      type: string
      sql: ${TABLE}."WRAP_UP_CODE_C" ;;
    }

    dimension: wrap_up_sub_codes_c {
      type: string
      sql: ${TABLE}."WRAP_UP_SUB_CODES_C" ;;
    }

    dimension: marked_c {
      type: yesno
      sql: ${TABLE}."MARKED_C" ;;
    }

    dimension: feature_request_c {
      type: string
      sql: ${TABLE}."FEATURE_REQUEST_C" ;;
    }

    dimension: feature_request_notes_c {
      type: string
      sql: ${TABLE}."FEATURE_REQUEST_NOTES_C" ;;
    }

    dimension: first_cancel_reason_c {
      type: string
      sql: ${TABLE}."FIRST_CANCEL_REASON_C" ;;
    }

    dimension: first_reason_detail_c {
      type: string
      sql: ${TABLE}."FIRST_REASON_DETAIL_C" ;;
    }

    dimension: second_cancel_reason_c {
      type: string
      sql: ${TABLE}."SECOND_CANCEL_REASON_C" ;;
    }

    dimension: second_reason_detail_c {
      type: string
      sql: ${TABLE}."SECOND_REASON_DETAIL_C" ;;
    }

    dimension: third_cancel_reason_c {
      type: string
      sql: ${TABLE}."THIRD_CANCEL_REASON_C" ;;
    }

    dimension: third_reason_details_c {
      type: string
      sql: ${TABLE}."THIRD_REASON_DETAILS_C" ;;
    }

    dimension: mbg_exercised_c {
      type: yesno
      sql: ${TABLE}."MBG_EXERCISED_C" ;;
    }

    dimension: customer_saved_c {
      type: yesno
      sql: ${TABLE}."CUSTOMER_SAVED_C" ;;
    }

    dimension: went_to_competitor_c {
      type: yesno
      sql: ${TABLE}."WENT_TO_COMPETITOR_C" ;;
    }

    dimension: what_saved_c {
      type: string
      sql: ${TABLE}."WHAT_SAVED_C" ;;
    }

    dimension: who_saved_c {
      type: string
      sql: ${TABLE}."WHO_SAVED_C" ;;
    }

    dimension: primary_attempted_tactic_c {
      type: string
      sql: ${TABLE}."PRIMARY_ATTEMPTED_TACTIC_C" ;;
    }

    dimension: secondary_attempted_tactic_c {
      type: string
      sql: ${TABLE}."SECONDARY_ATTEMPTED_TACTIC_C" ;;
    }

    dimension: credit_applied_c {
      type: string
      sql: ${TABLE}."CREDIT_APPLIED_C" ;;
    }

    dimension: notes_c {
      type: string
      sql: ${TABLE}."NOTES_C" ;;
    }

    dimension: churn_risk_c {
      type: yesno
      sql: ${TABLE}."CHURN_RISK_C" ;;
    }

    dimension: related_customer_project_c {
      type: string
      sql: ${TABLE}."RELATED_CUSTOMER_PROJECT_C" ;;
    }

    dimension: company_kb_c {
      type: string
      sql: ${TABLE}."COMPANY_KB_C" ;;
    }

    dimension: email_kb_c {
      type: string
      sql: ${TABLE}."EMAIL_KB_C" ;;
    }

    dimension: full_name_kb_c {
      type: string
      sql: ${TABLE}."FULL_NAME_KB_C" ;;
    }

    dimension: topic_c {
      type: string
      sql: ${TABLE}."TOPIC_C" ;;
    }

    dimension_group: _fivetran_synced {
      type: time
      sql: ${TABLE}."_FIVETRAN_SYNCED" ;;
    }

    dimension: comments {
      type: string
      sql: ${TABLE}."COMMENTS" ;;
    }

    dimension: language {
      type: string
      sql: ${TABLE}."LANGUAGE" ;;
    }

    dimension: lean_data_routing_action_c {
      type: string
      sql: ${TABLE}."LEAN_DATA_ROUTING_ACTION_C" ;;
    }

    dimension: date_error_occurred_c {
      type: date
      sql: ${TABLE}."DATE_ERROR_OCCURRED_C" ;;
    }

    dimension: opened_it_ticket_c {
      type: yesno
      sql: ${TABLE}."OPENED_IT_TICKET_C" ;;
    }

    dimension: litigation_c {
      type: string
      sql: ${TABLE}."LITIGATION_C" ;;
    }

    dimension: ar_assistance_c {
      type: string
      sql: ${TABLE}."AR_ASSISTANCE_C" ;;
    }

    dimension: master_record_id {
      type: string
      sql: ${TABLE}."MASTER_RECORD_ID" ;;
    }

    dimension: opened_twilio_ticket_c {
      type: yesno
      sql: ${TABLE}."OPENED_TWILIO_TICKET_C" ;;
    }

    dimension: twilio_ticket_number_c {
      type: string
      sql: ${TABLE}."TWILIO_TICKET_NUMBER_C" ;;
    }

    dimension: it_ticket_number_c {
      type: string
      sql: ${TABLE}."IT_TICKET_NUMBER_C" ;;
    }

    dimension: rac_c {
      type: yesno
      sql: ${TABLE}."RAC_C" ;;
    }

    dimension: feature_request_summary_c {
      type: string
      sql: ${TABLE}."FEATURE_REQUEST_SUMMARY_C" ;;
    }

    dimension: customer_activation_date_age_c {
      type: number
      sql: ${TABLE}."CUSTOMER_ACTIVATION_DATE_AGE_C" ;;
    }

    dimension: product_type_c {
      type: string
      sql: ${TABLE}."PRODUCT_TYPE_C" ;;
    }

    dimension: queue_notes_c {
      type: string
      sql: ${TABLE}."QUEUE_NOTES_C" ;;
    }

    dimension: employee_age_days_c {
      type: number
      sql: ${TABLE}."EMPLOYEE_AGE_DAYS_C" ;;
    }

    dimension: voucher_case_c {
      type: yesno
      sql: ${TABLE}."VOUCHER_CASE_C" ;;
    }

    dimension: chat_transcript_c {
      type: string
      sql: ${TABLE}."CHAT_TRANSCRIPT_C" ;;
    }

    dimension: chat_error_type_c {
      type: string
      sql: ${TABLE}."CHAT_ERROR_TYPE_C" ;;
    }

    dimension: goodwill_credit_date_c {
      type: date
      sql: ${TABLE}."GOODWILL_CREDIT_DATE_C" ;;
    }

    dimension: goodwill_credit_amount_c {
      type: number
      sql: ${TABLE}."GOODWILL_CREDIT_AMOUNT_C" ;;
    }

    dimension: goodwill_credit_reason_c {
      type: string
      sql: ${TABLE}."GOODWILL_CREDIT_REASON_C" ;;
    }

    dimension: goodwill_credit_reason_other_c {
      type: string
      sql: ${TABLE}."GOODWILL_CREDIT_REASON_OTHER_C" ;;
    }

    dimension: champs_assistance_c {
      type: string
      sql: ${TABLE}."CHAMPS_ASSISTANCE_C" ;;
    }

    dimension: escalation_c {
      type: yesno
      sql: ${TABLE}."ESCALATION_C" ;;
    }

    dimension: ringdna_potential_liability_c {
      type: string
      sql: ${TABLE}."RINGDNA_POTENTIAL_LIABILITY_C" ;;
    }

    dimension: ringdna_engineering_req_number_c {
      type: string
      sql: ${TABLE}."RINGDNA_ENGINEERING_REQ_NUMBER_C" ;;
    }

    dimension: ringdna_slaviolation_c {
      type: string
      sql: ${TABLE}."RINGDNA_SLAVIOLATION_C" ;;
    }

    dimension: ringdna_product_c {
      type: string
      sql: ${TABLE}."RINGDNA_PRODUCT_C" ;;
    }

    set: detail {
      fields: [
        case_owner_name,
        case_owner_title,
        account_name,
        case_number,
        type,
        status,
        reason,
        origin,
        subject,
        priority,
        description,
        is_closed,
        closed_date_time,
        created_date_time,
        ruby_receptionist_c,
        wrap_up_code_c,
        wrap_up_sub_codes_c,
        complaint_type,
        marked_c,
        ]
    }
  }
