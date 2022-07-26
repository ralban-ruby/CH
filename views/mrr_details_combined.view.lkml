view: mrr_details_combined {
  derived_table: {
    sql: SELECT CONCAT('1_', ROW_NUMBER() OVER(ORDER BY "Date")) AS primary_key,
                *,
                LAG("Upsell",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_upsell_bookings,
                LAG("Churn",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_churn_bookings,
                LAG("NewBookings",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_new_bookings,
                LAG("ReturnBookings",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_return_bookings,
                LAG("Downsell",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_downsell_bookings,
                LAG("TotalBookings",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_total_bookings,
                'RS' AS service_type
         FROM "RUBY"."MASTERDATA"."MRR_Detail_RS"

      UNION ALL

      SELECT CONCAT('2_', ROW_NUMBER() OVER(ORDER BY "Date")) AS primary_key,
      *,
      LAG("Upsell",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_upsell_bookings,
      LAG("Churn",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_churn_bookings,
      LAG("NewBookings",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_new_bookings,
      LAG("ReturnBookings",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_return_bookings,
      LAG("Downsell",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_downsell_bookings,
      LAG("TotalBookings",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "Date") AS previous_month_total_bookings,
      'Chat' AS service_type
      FROM "RUBY"."MASTERDATA"."MRR_Detail_Chat"

      UNION ALL

      SELECT CONCAT('3_', ROW_NUMBER() OVER(ORDER BY "EFFECTIVE_DATE")) AS primary_key,
      "CRM_ID","NAME","COHORT_DATE" ,"INDUSTRY" ,"EFFECTIVE_DATE" ,"UPSELL" ,"CHURN",
      NULL,NULL,"SALESREP" ,"CSM" ,"TOTAL_BOOKINGS" ,"NEW_BOOKINGS", "RETURN_BOOKINGS","DOWNSELL", '' AS "ACCOUNT_MANAGER",

      LAG("UPSELL",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "EFFECTIVE_DATE") AS previous_month_upsell_bookings,
      LAG("CHURN",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "EFFECTIVE_DATE") AS previous_month_churn_bookings,
      LAG("NEW_BOOKINGS",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "EFFECTIVE_DATE") AS previous_month_new_bookings,
      LAG("RETURN_BOOKINGS",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "EFFECTIVE_DATE") AS previous_month_return_bookings,
      LAG("DOWNSELL",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "EFFECTIVE_DATE") AS previous_month_downsell_bookings,
      LAG("TOTAL_BOOKINGS",1,NULL) OVER(PARTITION BY CRM_ID ORDER BY "EFFECTIVE_DATE") AS previous_month_total_bookings,
      'GH' AS service_type
      FROM "RUBY"."MASTERDATA"."GH_MRR_DETAIL"
      ;;
  }
  drill_fields:[crm_id,COUNT_crmid]

  dimension: primary_key {
    type: string
    primary_key: yes
    sql:${TABLE}."PRIMARY_KEY" ;;
  }

  dimension: crm_id {
    type: string
    sql: ${TABLE}."CRM_ID" ;;
    drill_fields: [crm_id, crm_name,industry]
  }

  dimension: name {
    type: string
    sql: ${TABLE}."Name" ;;
    link: {
      label: "Link To Account Dashboard: {{ value }} "
      url: "https://rubyreceptionists.cloud.looker.com/dashboards/13?CRM%20Name={{ account.crm_name | encode_url }}"
      icon_url: "https://www.google.com/s2/favicons?domain=https://www.ruby.com/"
    }
    html:
      <a href="https://rubyreceptionists.cloud.looker.com/dashboards/13?CRM%20Name={{ account.crm_name._value | encode_url }}">{{ value }}</a>;;
  }


  dimension: crm_name {
    type: string
    sql: CONCAT(CONCAT(${TABLE}."Name",' - '),${TABLE}."CRM_ID") ;;
  }


  dimension: cohort {
    type: date
    convert_tz: no
    sql: ${TABLE}."Cohort" ;;
  }



  dimension: cohort_date_sort {
    type: string
    sql: case
           when to_date(${cohort}) <= '1/1/2018' then trunc(to_date(${cohort}), 'YEAR')
          else trunc(to_date(${cohort}), 'MONTH')
         end;;
  }


  dimension: mrr_band {
    type: number
    sql:  CASE
        WHEN ${total_bookings} BETWEEN '20.00' AND '155.02' THEN 0
        WHEN ${total_bookings} BETWEEN '155.03' AND '251.99' THEN .1
        WHEN ${total_bookings} BETWEEN '252.00' AND '313.64' THEN .2
        WHEN ${total_bookings} BETWEEN '313.65' AND '407.36' THEN .3
        WHEN ${total_bookings} BETWEEN '407.37' AND '560.10' THEN .4
        WHEN ${total_bookings} BETWEEN '560.11' AND '674.92' THEN .5
        WHEN ${total_bookings} BETWEEN '674.93' AND '1005.03' THEN .6
        WHEN ${total_bookings} BETWEEN '1005.04' AND '1467.99' THEN .7
        WHEN ${total_bookings} BETWEEN '1468.00' AND '2469.74' THEN .8
        WHEN ${total_bookings} BETWEEN '2469.75' AND '7320.99' THEN .9
        WHEN ${total_bookings} BETWEEN '7321.00' AND '20000.00' THEN 1
        ELSE '0'
    END;;
  }



  dimension: industry {
    type: string
    sql: ${TABLE}."Industry" ;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}."Date" ;;
  }

  dimension: upsell {
    type: number
    sql: ${TABLE}."Upsell" ;;
  }

  dimension: churn {
    type: number
    sql: ${TABLE}."Churn" ;;
  }

  dimension: sales_credit {
    type: number
    sql: ${TABLE}."SalesCredit" ;;
  }

  dimension: retention_credit {
    type: number
    sql: ${TABLE}."RetentionCredit" ;;
  }

  dimension: sales_rep {
    type: string
    sql: ${TABLE}."SalesRep" ;;
  }

  dimension: csm {
    type: string
    sql: ${TABLE}."CSM" ;;
    link: {
      label: "Link To CSM Dashboard: {{ value }} "
      url: "/dashboards/11?CSM={{ value | encode_url }}"
      icon_url: "https://www.google.com/s2/favicons?domain=https://www.ruby.com/"
    }
  }

  dimension: account_manager {
    type: string
    sql: ${TABLE}."ACCOUNT_MANAGER" ;;
  }
  dimension: total_bookings {
    type: number
    sql: ${TABLE}."TotalBookings" ;;
  }

  dimension: new_bookings {
    type: number
    sql: ${TABLE}."NewBookings" ;;
  }

  dimension: return_bookings {
    type: number
    sql: ${TABLE}."ReturnBookings" ;;
  }

  dimension: downsell {
    type: number
    sql: ${TABLE}."Downsell" ;;
  }

  dimension: previous_month_upsell_bookings {
    view_label: "Previous Month MRR Details"
    type: number
    sql: ${TABLE}."PREVIOUS_MONTH_UPSELL_BOOKINGS" ;;
  }

  dimension: previous_month_churn_bookings {
    view_label: "Previous Month MRR Details"
    type: number
    sql: ${TABLE}."PREVIOUS_MONTH_CHURN_BOOKINGS" ;;
  }

  dimension: previous_month_new_bookings {
    view_label: "Previous Month MRR Details"
    type: number
    sql: ${TABLE}."PREVIOUS_MONTH_NEW_BOOKINGS" ;;
  }

  dimension: previous_month_return_bookings {
    view_label: "Previous Month MRR Details"
    type: number
    sql: ${TABLE}."PREVIOUS_MONTH_RETURN_BOOKINGS" ;;
  }

  dimension: previous_month_downsell_bookings {
    view_label: "Previous Month MRR Details"
    type: number
    sql: ${TABLE}."PREVIOUS_MONTH_DOWNSELL_BOOKINGS" ;;
  }

  dimension: previous_month_total_bookings {
    view_label: "Previous Month MRR Details"
    type: number
    sql: ${TABLE}."PREVIOUS_MONTH_TOTAL_BOOKINGS" ;;
  }

  dimension: service_type {
    type: string
    sql: ${TABLE}."SERVICE_TYPE" ;;
  }

  measure: count_new_bookings {
    group_label: "Logo Counts"
    type: count
    filters: [new_bookings: "!=0"]
  }

  measure: count_return_bookings {
    group_label: "Logo Counts"
    type: count
    filters: [return_bookings: "!=0"]
  }

  measure: count_churn_bookings {
    group_label: "Logo Counts"
    type: count
    filters: [churn: "!=0"]
  }

  measure: count_churn_bookings_gh {
    hidden: yes
    type: count
    filters: [churn: "!=0", service_type: "GH"]
  }

  measure: count_upsell_bookings {
    group_label: "Logo Counts"
    type: count
    filters: [upsell: "!=0"]
  }

  measure: count_downsell_bookings {
    group_label: "Logo Counts"
    type: count
    filters: [downsell: "!=0"]
  }

  measure: count_total_bookings {
    group_label: "Logo Counts"
    type: count
    filters: [total_bookings: "!=0"]
  }

  measure: count_previous_month_total_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "Logo Counts"
    type: count
    filters: [previous_month_total_bookings: "!=0"]
  }

  measure: count_previous_month_total_bookings_gh {
    hidden:  yes
    type: count
    filters: [previous_month_total_bookings: "!=0", service_type: "GH"]
  }

  measure: count_previous_month_new_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "Logo Counts"
    type: count
    filters: [previous_month_new_bookings: "!=0"]
  }

  measure: count_previous_month_upsell_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "Logo Counts"
    type: count
    filters: [previous_month_upsell_bookings: "!=0"]
  }

  measure: count_previous_month_downsell_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "Logo Counts"
    type: count
    filters: [previous_month_downsell_bookings: "!=0"]
  }

  measure: count_previous_month_churn_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "Logo Counts"
    type: count
    filters: [previous_month_churn_bookings: "!=0"]
  }

  measure: count_previous_month_return_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "Logo Counts"
    type: count
    filters: [previous_month_return_bookings: "!=0"]
  }

  measure: SUM_total_bookings {
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${total_bookings} ;;
  }

  measure: SUM_downsell {
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${downsell};;
  }

  measure: SUM_downsell_rs {
    hidden: yes
    type: sum
    filters: [service_type: "RS"]
    sql: ${downsell};;
  }

  measure: SUM_downsell_chat {
    hidden: yes
    type: sum
    filters: [service_type: "Chat"]
    sql: ${downsell};;
  }

  measure: SUM_churn {
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${churn} ;;
  }

  measure: SUM_churn_rs {
    hidden: yes
    type: sum
    filters: [service_type: "RS"]
    sql: ${churn};;
  }

  measure: SUM_churn_chat {
    hidden: yes
    type: sum
    filters: [service_type: "Chat"]
    sql: ${churn};;
  }


  measure: SUM_new_bookings {
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${new_bookings};;
  }

  measure: SUM_return_bookings {
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${return_bookings};;
  }

  measure: SUM_upsell_bookings {
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${upsell};;
  }


  measure: SUM_upsell_bookings_rs {
    hidden: yes
    type: sum
    filters: [service_type: "RS"]
    sql: ${upsell};;
  }

  measure: SUM_upsell_bookings_chat {
    hidden: yes
    type: sum
    filters: [service_type: "Chat"]
    sql: ${upsell};;
  }


  measure: SUM_retention_credits {
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${retention_credit}*(-1);;
  }

  measure: SUM_previous_month_total_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${previous_month_total_bookings} ;;
  }

  measure: SUM_previous_month_total_bookings_rs {
    hidden: yes
    type: sum
    filters: [service_type: "RS"]
    sql: ${previous_month_total_bookings};;
  }

  measure: SUM_previous_month_total_bookings_chat {
    hidden: yes
    type: sum
    filters: [service_type: "Chat"]
    sql: ${previous_month_total_bookings};;
  }


  measure: SUM_previous_month_new_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${previous_month_new_bookings} ;;
  }

  measure: SUM_previous_month_churn_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${previous_month_churn_bookings} ;;
  }

  measure: SUM_previous_month_upsell_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${previous_month_upsell_bookings} ;;
  }

  measure: SUM_previous_month_downsell_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${previous_month_downsell_bookings} ;;
  }

  measure: SUM_previous_month_return_bookings {
    view_label: "Previous Month MRR Details"
    group_label: "MRR Sums"
    value_format_name: usd_0
    type: sum
    sql: ${previous_month_return_bookings} ;;
  }

  measure: SUM_PrevMo_TotalBookings {
    value_format_name: usd_0
    type: sum
    #sql: ${TABLE}."PrevMo_TotalBookings" ;;
    sql: ${mrr_details_derived.PrevMo_TotalBookings} ;;
  }

  measure: gross_retention {
    label: "Gross Rentention"
    group_label: "Retention Metrics"
    type: number
    value_format_name: percent_2
    sql: 1+((${SUM_downsell}+${SUM_churn})/NULLIF(${SUM_previous_month_total_bookings},0)) ;;
  }

  measure: net_retention {
    group_label: "Retention Metrics"
    type: number
    value_format_name: percent_2
    sql: 1+((${SUM_downsell}+${SUM_churn}+ ${SUM_upsell_bookings})/NULLIF(${SUM_previous_month_total_bookings},0)) ;;
  }

  measure: net_retention_rs {
    group_label: "Retention Metrics"
    type: number
    value_format_name: percent_2
    sql: 1+((${SUM_downsell_rs}+${SUM_churn_rs}+ ${SUM_upsell_bookings_rs})/NULLIF(${SUM_previous_month_total_bookings_rs},0));;
  }

  measure: net_retention_chat {
    group_label: "Retention Metrics"
    type: number
    value_format_name: percent_2
    sql: 1+((${SUM_downsell_chat}+${SUM_churn_chat}+ ${SUM_upsell_bookings_chat})/NULLIF(${SUM_previous_month_total_bookings_chat},0));;
  }

  measure: logo_retention {
    group_label: "Retention Metrics"
    type: number
    value_format_name: percent_2
    sql: 1-((${count_churn_bookings})/NULLIF(${count_previous_month_total_bookings},0)) ;;
  }

  measure: logo_retention_gh {
    group_label: "Retention Metrics"
    type: number
    value_format_name: percent_2
    sql: 1-((${count_churn_bookings_gh})/NULLIF(${count_previous_month_total_bookings_gh},0));;
  }

  measure: average_MRR_per_new_logo {
    group_label: "Averages"
    type: number
    value_format_name: usd_0
    sql: ${SUM_new_bookings}/NULLIF(${count_new_bookings},0) ;;
  }

  measure: average_MRR_per_return_logo {
    group_label: "Averages"
    type: number
    value_format_name: usd_0
    sql: ${SUM_return_bookings}/NULLIF(${count_return_bookings},0) ;;
  }

  measure: average_MRR_per_churn_logo {
    group_label: "Averages"
    type: number
    value_format_name: usd_0
    sql: ${SUM_churn}/NULLIF(${count_churn_bookings},0) ;;
  }

  measure: average_MRR_per_downsell_logo {
    group_label: "Averages"
    type: number
    value_format_name: usd_0
    sql: ${SUM_downsell}/NULLIF(${count_downsell_bookings},0) ;;
  }

  measure: average_MRR_per_upsell_logo {
    group_label: "Averages"
    type: number
    value_format_name: usd_0
    sql: ${SUM_upsell_bookings}/NULLIF(${count_upsell_bookings},0) ;;
  }

  measure: average_MRR_per_logo {
    group_label: "Averages"
    type: number
    value_format_name: usd_0
    sql: ${SUM_total_bookings}/NULLIF(${count_total_bookings},0) ;;
  }

  measure: Total_MRR_precent_of_previous_month {
    group_label: "Month over Month Ratios"
    type: number
    value_format_name: percent_2
    sql: ${SUM_total_bookings}/NULLIF(${SUM_previous_month_total_bookings},0) ;;
  }

  measure: New_booking_MRR_precent_of_previous_month {
    group_label: "Month over Month Ratios"
    type: number
    value_format_name: percent_2
    sql: ${SUM_new_bookings}/NULLIF(${SUM_previous_month_total_bookings},0) ;;
  }

  measure: Upsell_MRR_precent_of_previous_month {
    group_label: "Month over Month Ratios"
    type: number
    value_format_name: percent_2
    sql: ${SUM_upsell_bookings}/NULLIF(${SUM_previous_month_total_bookings},0) ;;
  }

  measure: Downsell_MRR_precent_of_previous_month {
    group_label: "Month over Month Ratios"
    type: number
    value_format_name: percent_2
    sql: (-1)*${SUM_downsell}/NULLIF(${SUM_previous_month_total_bookings},0) ;;
  }

  measure: Churn_MRR_precent_of_previous_month {
    group_label: "Month over Month Ratios"
    type: number
    value_format_name: percent_2
    sql: (-1)*${SUM_churn}/NULLIF(${SUM_previous_month_total_bookings},0) ;;
  }

  measure: Return_MRR_precent_of_previous_month {
    group_label: "Month over Month Ratios"
    type: number
    value_format_name: percent_2
    sql: ${SUM_return_bookings}/NULLIF(${SUM_previous_month_total_bookings},0) ;;
  }

  measure: Retention_credits_precent_of_total_MRR {
    group_label: "Sales/Retention Discount Metrics"
    type: number
    value_format_name: percent_2
    sql: ${SUM_retention_credits}/NULLIF(${SUM_total_bookings},0) ;;
  }

  measure: Gross_retention {
    label: "Gross Retention (Rebecca)"
    type: number
    value_format_name: percent_2
    sql: 1+((${SUM_downsell}+${SUM_churn})/NULLIF(${SUM_PrevMo_TotalBookings},0)) ;;
  }

  measure: total_credits_applied {
    value_format_name: usd
    type: sum
    sql: COALESCE(${retention_credit},0) +  COALESCE(${sales_credit},0)  ;;
  }

  measure: record_count {
    type: count
    description: "portfolio size"
  }

  measure: total_mrr_collected_since_save_event {
    value_format_name: usd_0
    type: number
    sql: SUM(CASE WHEN ${date_date} > ${cancel_churn.cancel_req_created_date} AND ${cancel_churn.customer_saved_c} = 'Yes' THEN ${total_bookings} ELSE 0 END) ;;
  }

  measure: service_type_count {
    hidden: yes
    type: count_distinct
    sql: ${service_type} ;;
  }

  measure: has_multiple_services {
    type: yesno
    description: "Does this customer have nonzero Total Bookings for both Receptionist and Chat services? Note: This field will not work when RS and Chat are split out in separate rows or columns, as it is a grouped measure."
    sql: (${service_type_count} >= 2) AND (${SUM_total_bookings} != 0) AND (${SUM_total_bookings} IS NOT NULL);;
  }
  measure: COUNT_crmid {
    type: count_distinct
    sql: ${TABLE}."CRM_ID" ;;
    drill_fields: [crm_id, crm_name]
  }

  set: detail {
    fields: [
      crm_id,
      name,
      industry,
      date_date,
      upsell,
      churn,
      sales_credit,
      retention_credit,
      sales_rep,
      csm,
      total_bookings,
      new_bookings,
      return_bookings,
      downsell,
      service_type
    ]
  }
}
