view: salesforce_case_history {
     derived_table: {
      sql: SELECT row_number() over(partition by CASE_ID ,FIELD order by CREATED_DATE) AS CASE_HISTORY_RN, *
              FROM FIVETRAN_DB.SALESFORCE.CASE_HISTORY C
              WHERE C.IS_DELETED <> 1
              AND CAST(C.CREATED_DATE AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',Current_Date))
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    measure: new_reply_total {
      type: sum
      label: "Email New Replies"
      filters: [field: "New_Reply_Notification__c",new_value: "New Reply!"]
      sql: CASE WHEN ${field} = 'New_Reply_Notification__c' AND ${new_value} = 'New Reply!' THEN 1 ELSE 0 END ;;
      drill_fields: [detail*]
      }

    measure: responded_total {
      type: sum
      label: "Email Responded"
      filters: [field: "New_Reply_Notification__c",new_value: "Responded"]
      sql: CASE WHEN ${field} = 'New_Reply_Notification__c' AND ${new_value} = 'Responded' THEN 1 ELSE 0 END ;;
      drill_fields: [detail*]
      }


    dimension: case_status {
      sql: ${salesforce_case.status} ;;
      }

    dimension: case_wrap_up_code{
      sql: ${salesforce_case.wrap_up_code_c} ;;

    }

    dimension: case_history_rn {
      type: number
      sql: ${TABLE}."CASE_HISTORY_RN" ;;
      }



    dimension: id {
      type: string
      primary_key: yes
      sql: ${TABLE}."ID" ;;
    }

    dimension: is_deleted {
      type: yesno
      sql: ${TABLE}."IS_DELETED" ;;
    }

    dimension: case_number {
      sql: ${salesforce_case.case_number} ;;
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

  # dimension_group: case_close {
  #   type: time
  #   timeframes: [date]
  #   sql: ${salesforce_case.closed_date} ;;
  #   datatype: datetime
  #   convert_tz: no

  # }

    dimension: case_id {
      type: string
      sql: ${TABLE}.CASE_ID ;;
    }

    dimension: created_by_id {
      type: string
      sql: ${TABLE}."CREATED_BY_ID" ;;
    }

    dimension_group: created_date {
      type: time
      sql: ${TABLE}."CREATED_DATE" ;;
      convert_tz: no
    }

    dimension: field {
      label: "Field Value Changed"
      type: string
      sql: ${TABLE}."FIELD" ;;
    }

    dimension: old_value {
      type: string
      sql: ${TABLE}."OLD_VALUE" ;;
    }

    dimension: new_value {
      type: string
      sql: ${TABLE}."NEW_VALUE" ;;
    }

    dimension_group: _fivetran_synced {
      type: time
      sql: ${TABLE}."_FIVETRAN_SYNCED" ;;
    }

    dimension: data_type {
      type: string
      sql: ${TABLE}."DATA_TYPE" ;;
    }

    set: detail {
      fields: [
        case_number,
        case_status,
        case_wrap_up_code,
        case_owner_name,
        case_owner_title,
        account_name,
        created_date_time,
        field,
        old_value,
        new_value,
        ]
    }
  }
