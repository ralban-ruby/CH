view: fact_adherence_occurrences {
  sql_table_name: "CALABRIO"."FACT_ADHERENCE_OCCURRENCES"
    ;;

  dimension: absence {
    type: string
    sql: ${TABLE}."ABSENCE" ;;
  }

  dimension: absence_time {
    type: number
    sql: ${TABLE}."Absence Time" ;;
  }

  dimension: contract_time {
    type: number
    sql: ${TABLE}."Contract Time" ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}."DATE" ;;
  }

  dimension_group: effective_through {
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
    sql: ${TABLE}."EFFECTIVE THROUGH DATE" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: employee_code {
    type: number
    sql: ${TABLE}."EMPLOYEE_CODE" ;;
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}."End Time" ;;
  }

  dimension: occurrence {
    type: number
    sql: ${TABLE}."OCCURRENCE" ;;
  }

  dimension: over_time {
    type: number
    sql: ${TABLE}."Over Time" ;;
  }

  dimension: paid_time {
    type: number
    sql: ${TABLE}."Paid Time" ;;
  }

  dimension: person {
    type: string
    sql: ${TABLE}."PERSON" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."PERSON_ID" ;;
  }

  dimension: scheduled_ready_time {
    type: number
    sql: ${TABLE}."Scheduled Ready Time" ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}."Start Time" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension: ukey {
    type: string
    sql: ${TABLE}."UKEY" ;;
  }

  dimension: work_time {
    type: number
    sql: ${TABLE}."Work Time" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
