view: fact_adherence_occurrences {
  sql_table_name: "RUBY"."CALABRIO"."FACT_ADHERENCE_OCCURRENCES"
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
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATE" ;;
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

  dimension: end_time {
    type: date_time
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

  dimension: start_time {
    type: date_time
    sql: ${TABLE}."Start Time" ;;
  }

  dimension: team {
    label: "Manager"
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension: ukey {
    type: string
    primary_key: yes
    sql: ${TABLE}."UKEY" ;;
  }

  dimension: work_time {
    type: number
    sql: ${TABLE}."Work Time" ;;
  }

  dimension: Effective_Through_Date {
    type: string
    sql: ${TABLE}."EFFECTIVE THROUGH DATE" ;;
  }

  dimension: Hours {
    type: number
    sql: ${TABLE}."Contract Time"/60;;
    value_format: "#.00;(#.00)"
  }


  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_occurrences {
    type: sum
    sql: ${TABLE}."OCCURRENCE";;
  }

  measure: sum_hours {
    type: sum
    value_format_name: decimal_2
    sql: ${TABLE}."Contract Time"/60 ;;
  }
}
