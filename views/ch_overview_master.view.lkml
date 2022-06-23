view: ch_overview_master {
  sql_table_name: "CH"."CH_OVERVIEW_MASTER"
    ;;

  dimension: answeredrate {
    type: number
    sql: ${TABLE}."ANSWEREDRATE" ;;
  }

  dimension: cases_per_cher {
    type: number
    sql: ${TABLE}."CASES_PER_CHER" ;;
  }

  dimension: champ_supp_percent {
    type: number
    sql: ${TABLE}."CHAMP_SUPP_PERCENT" ;;
  }

  dimension: champ_support {
    type: number
    sql: ${TABLE}."CHAMP_SUPPORT" ;;
  }

  dimension: connections {
    type: number
    sql: ${TABLE}."CONNECTIONS" ;;
  }

  dimension: csat {
    type: number
    sql: ${TABLE}."CSAT" ;;
  }

  dimension: errors {
    type: number
    sql: ${TABLE}."ERRORS" ;;
  }

  dimension: errors_percent {
    type: number
    sql: ${TABLE}."ERRORS_PERCENT" ;;
  }

  dimension_group: month {
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
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: serv_complaints_percent {
    type: number
    sql: ${TABLE}."SERV_COMPLAINTS_PERCENT" ;;
  }

  dimension: service_complaints {
    type: number
    sql: ${TABLE}."SERVICE_COMPLAINTS" ;;
  }

  dimension: t_actionable_cases {
    type: number
    sql: ${TABLE}."T_ACTIONABLE_CASES" ;;
  }

  dimension: tech_complaints_percent {
    type: number
    sql: ${TABLE}."TECH_COMPLAINTS_PERCENT" ;;
  }

  dimension: technology_complaints {
    type: number
    sql: ${TABLE}."TECHNOLOGY_COMPLAINTS" ;;
  }

  dimension: total_cases {
    type: number
    sql: ${TABLE}."TOTAL_CASES" ;;
  }

  dimension: unique_rhc_visitors {
    type: number
    sql: ${TABLE}."UNIQUE_RHC_VISITORS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
