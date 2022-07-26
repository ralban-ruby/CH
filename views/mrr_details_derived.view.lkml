view: mrr_details_derived {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }


# view: mrr_details_derived {
#   # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
        "CRM_ID",
        "Date",
        LAG("TotalBookings") OVER (PARTITION BY "CRM_ID" ORDER BY "Date") as "PrevMo_TotalBookings"
      FROM ${mrr_details_combined.SQL_TABLE_NAME}
      ;;
  }
#
#   # Define your dimensions and measures here, like this:
  dimension: PrevMo_TotalBookings {
    description: "Total bookings from the previous month"
    type: number
    sql: ${TABLE}."PrevMo_TotalBookings" ;;
  }

  dimension: CRM_ID {
    type: string
    sql: ${TABLE}."CRM_ID" ;;
  }

  dimension_group: Date {
    type: time
    sql: ${TABLE}."Date" ;;
  }

#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
}
