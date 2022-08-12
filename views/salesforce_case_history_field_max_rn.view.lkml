
view: salesforce_case_history_field_max_rn {
  derived_table: {
    sql: WITH salesforce_case AS (SELECT *
              FROM FIVETRAN_DB.SALESFORCE.CASE C
              WHERE C.IS_DELETED <> 1
              AND CAST(C.CREATED_DATE AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',Current_Date))
               )
  ,  salesforce_case_history AS (SELECT row_number() over(partition by CASE_ID ,FIELD order by CREATED_DATE) AS CASE_HISTORY_RN, *
              FROM FIVETRAN_DB.SALESFORCE.CASE_HISTORY C
              WHERE C.IS_DELETED <> 1
              AND CAST(C.CREATED_DATE AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',Current_Date))
               )
SELECT
    salesforce_case_history."CASE_ID"  AS "salesforce_case_history.case_id",
    salesforce_case_history."FIELD"  AS "salesforce_case_history.field",
    MAX(salesforce_case_history.CASE_HISTORY_RN ) AS "salesforce_case_history.max_rn_field"
FROM salesforce_case
LEFT JOIN salesforce_case_history ON (salesforce_case."ID") = (salesforce_case_history."CASE_ID")
GROUP BY
    1,
    2
ORDER BY
    3 DESC
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: salesforce_case_history_case_id {
    type: string
    sql: ${TABLE}."salesforce_case_history.case_id" ;;
  }

  dimension: salesforce_case_history_field {
    type: string
    sql: ${TABLE}."salesforce_case_history.field" ;;
  }

  dimension: salesforce_case_history_max_rn_field {
    type: number
    sql: ${TABLE}."salesforce_case_history.max_rn_field" ;;
  }

  set: detail {
    fields: [salesforce_case_history_case_id, salesforce_case_history_field, salesforce_case_history_max_rn_field]
  }
}
