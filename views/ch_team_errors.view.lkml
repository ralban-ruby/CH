view: ch_team_errors {
  derived_table: {
    sql: SELECT
        CASEID,
        CASE_NUMBER,
        CREATEDATE ,
        STATUS ,
        IS_CLOSED ,
        CLOSEDDATE ,
        CASE_OWNER ,
        ACCOUNT_NAME ,
        WRAP_UP_CODE_C,
        WRAP_UP_SUB_CODES_C ,
        ERROR_TYPE_C ,
        ERROR_NOTES_C ,
        RECEPTIONIST_NAME
      FROM
        RUBY.CH.CH_CASE c
      WHERE
        1 = 1
        AND (c.WRAP_UP_CODE_C = 'CS Error')
        AND T_ACTIONABLE_CASES = 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [receptionist_name,case_number,createdate_date,case_owner,account_name,wrap_up_code_c,error_type_c,error_notes_c]
  }

  dimension: caseid {
    type: string
    sql: ${TABLE}."CASEID" ;;
  }

  dimension: case_number {
    type: string
    sql: ${TABLE}."CASE_NUMBER" ;;
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

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}."IS_CLOSED" ;;
  }

  dimension_group: closeddate {
    type: time
    sql: ${TABLE}."CLOSEDDATE" ;;
  }

  dimension: case_owner {
    type: string
    sql: ${TABLE}."CASE_OWNER" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: wrap_up_code_c {
    type: string
    sql: ${TABLE}."WRAP_UP_CODE_C" ;;
  }

  dimension: wrap_up_sub_codes_c {
    type: string
    sql: ${TABLE}."WRAP_UP_SUB_CODES_C" ;;
  }

  dimension: error_type_c {
    type: string
    sql: ${TABLE}."ERROR_TYPE_C" ;;
  }

  dimension: error_notes_c {
    type: string
    sql: ${TABLE}."ERROR_NOTES_C" ;;
  }

  dimension: receptionist_name {
    type: string
    sql: ${TABLE}."RECEPTIONIST_NAME" ;;
  }

  set: detail {
    fields: [
      caseid,
      case_number,
      createdate_date,
      status,
      is_closed,
      closeddate_time,
      case_owner,
      account_name,
      wrap_up_code_c,
      wrap_up_sub_codes_c,
      error_type_c,
      error_notes_c,
      receptionist_name
    ]
  }
}
