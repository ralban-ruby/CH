view: salesforce_case_hist_last {
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
    salesforce_case_history.CASE_ID  AS case_id,
    salesforce_case_history.FIELD  AS field,
    MAX(salesforce_case_history.CASE_HISTORY_RN ) AS max_rn_field
FROM salesforce_case
LEFT JOIN salesforce_case_history ON (salesforce_case.ID) = (salesforce_case_history.CASE_ID)
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


  dimension: case_id {
    type: string
    sql: ${TABLE}."CASE_ID" ;;
  }

  dimension: field {
    type: string
    sql: ${TABLE}."FIELD" ;;
  }

  dimension: max_rn_field {
    type: number
    sql: ${TABLE}."MAX_RN_FIELD" ;;
  }

  set: detail {
    fields: [case_id, field, max_rn_field]
  }
}
