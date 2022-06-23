view: hively_csat {
  sql_table_name: "CH"."HIVELY_CSAT"
    ;;

  dimension: bonus {
    type: string
    sql: ${TABLE}."BONUS" ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}."COMMENT" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: employeecode {
    type: number
    sql: ${TABLE}."EMPLOYEECODE" ;;
  }

  dimension: fromemail {
    type: string
    sql: ${TABLE}."FROMEMAIL" ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}."IP" ;;
  }

  dimension: member {
    type: string
    sql: ${TABLE}."MEMBER" ;;
  }

  dimension: points {
    type: number
    sql: ${TABLE}."POINTS" ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}."PUBLIC" ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}."RATING" ;;
  }

  dimension_group: ratingcreateddate {
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
    sql: ${TABLE}."RATINGCREATEDDATE" ;;
  }

  dimension: ratingid {
    type: number
    value_format_name: id
    sql: ${TABLE}."RATINGID" ;;
  }

  dimension: repeats {
    type: number
    sql: ${TABLE}."REPEATS" ;;
  }

  dimension: requested {
    type: string
    sql: ${TABLE}."REQUESTED" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension: ticket {
    type: string
    sql: ${TABLE}."TICKET" ;;
  }

  dimension: userid {
    type: string
    sql: ${TABLE}."USERID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
