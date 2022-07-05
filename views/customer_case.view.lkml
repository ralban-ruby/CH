view: customer_case {
     derived_table: {
      sql: SELECT
               C.ID AS CASE_ID
              ,C.CASE_NUMBER
              ,C.SUPPLIED_NAME
              ,C.SUPPLIED_COMPANY
              ,C.ACCOUNT_ID  AS SALESFORCE_ACCOUNT
              ,C.STATUS
              ,C.REASON
              ,C.ORIGIN
              ,C.SUBJECT
              ,C.PRIORITY
              ,C.DESCRIPTION
              ,C.IS_CLOSED
              ,C.CLOSED_DATE
              ,C.CREATED_DATE
              ,C.OWNER_ID
              ,C.CUSTOMER_SUCCESS_SELECTION_C
              ,C.BUDDY_CASE_C
              ,C.ERROR_NOTES_C
              ,C.ERROR_TYPE_C
              ,C.LAST_RESPONSE_TIME_C
              ,C.NEW_REPLY_NOTIFICATION_C
              ,C.WRAP_UP_CODE_C
              ,C.WRAP_UP_SUB_CODES_C
              ,C.MARKED_C
              FROM FIVETRAN_DB.SALESFORCE."CASE" C
              WHERE CAST(C.CREATED_DATE AS DATE) >= dateadd(YEAR,-3,date_trunc('MONTH',  Current_Date))
              AND C.IS_DELETED <> 1
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: case_id {
      type: string
      sql: ${TABLE}."CASE_ID" ;;
    }

    dimension: case_number {
      type: string
      sql: ${TABLE}."CASE_NUMBER" ;;
    }

    dimension: supplied_name {
      type: string
      sql: ${TABLE}."SUPPLIED_NAME" ;;
    }

    dimension: supplied_company {
      type: string
      sql: ${TABLE}."SUPPLIED_COMPANY" ;;
    }

    dimension: salesforce_account {
      type: string
      sql: ${TABLE}."SALESFORCE_ACCOUNT" ;;
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

    dimension_group: created_date {
      type: time
      sql: ${TABLE}."CREATED_DATE" ;;
    }

    dimension: owner_id {
      type: string
      sql: ${TABLE}."OWNER_ID" ;;
    }

    dimension: customer_success_selection_c {
      type: string
      sql: ${TABLE}."CUSTOMER_SUCCESS_SELECTION_C" ;;
    }

    dimension: buddy_case_c {
      type: yesno
      sql: ${TABLE}."BUDDY_CASE_C" ;;
    }

    dimension: error_notes_c {
      type: string
      sql: ${TABLE}."ERROR_NOTES_C" ;;
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
      sql: ${TABLE}."NEW_REPLY_NOTIFICATION_C" ;;
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

        set: detail {
      fields: [
        case_id,
        case_number,
        supplied_name,
        supplied_company,
        salesforce_account,
        status,
        reason,
        origin,
        subject,
        priority,
        description,
        is_closed,
        closed_date_time,
        created_date_time,
        owner_id,
        customer_success_selection_c,
        buddy_case_c,
        error_notes_c,
        error_type_c,
        last_response_time_c_time,
        new_reply_notification_c,
        wrap_up_code_c,
        wrap_up_sub_codes_c,
        marked_c
      ]
    }
  }
