view: cancel {
  derived_table: {
    sql: WITH MRR_CHURN
      AS
      (
      SELECT DISTINCT
      R.CRM_ID
      ,MAX(CAST(R."Date" AS DATE)) AS MRR_Churn_Date
      FROM RUBY.MASTERDATA."MRR_Detail_RS" R
      WHERE CAST(R."Date" AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',  Current_Date)) AND "Churn" < 0
      GROUP BY R.CRM_ID
      UNION
      SELECT
      C.CRM_ID
      ,MAX(CAST(C."Date" AS DATE)) AS MRR_Churn_Date
      FROM RUBY.MASTERDATA."MRR_Detail_Chat" C
      WHERE CAST(C."Date" AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',  Current_Date)) AND "Churn" < 0
      GROUP BY C.CRM_ID
      )
      SELECT
       MC.CRM_ID
      ,MC.MRR_Churn_Date AS Max_MRR_Churn_Date
      ,SALESFORCE_CANCEL_ID
      ,SALESFORCE_ACCOUNT
      ,SALESFORCE_ACCOUNT_OWNER
      ,CUSTOMER
      ,CUSTOMER_INDUSTRY
      ,CANCEL_OWNER_EMPLOYEE_CODE
      ,CANCEL_OWNER_EMPLOYEE_ID
      ,CANCEL_OWNER_EMPLOYEE_NAME
      ,CANCEL_OWNER_FIRSTNAME
      ,CANCEL_OWNER_LASTNAME
      ,CANCEL_OWNER_LEGALNAME
      ,CANCEL_SAVED_BY_EMPLOYEE_NAME
      ,C.CUSTOMER_SAVED_C
      ,CANCEL_SAVED_BY_EMPLOYEE_CODE
      ,CANCEL_SAVED_BY_EMPLOYEE_ID
      ,CANCEL_OWNER_EMPLOYEE_STATUS
      ,CANCEL_OWNER_TITLE
      ,CANCEL_OWNER_TEAM
      ,CANCEL_OWNER_SUPERVISOR_PRIMARY
      ,CANCEL_OWNER_EMAIL
      ,CANCEL_OWNER_SAMACCOUNTNAME
      ,CANCEL_OWNER_DEPARTMENT
      ,C.CANCELLATION_EFFECTIVE_DATE_C
      ,C.PRIMARY_ATTEMPTED_TACTIC_C
      ,C.PRIMARY_CANCEL_REASON_C
      ,C.PRIMARY_REASON_DETAIL_C
      ,C.WHAT_SAVED_THIS_CUSTOMER_C
      ,C.CANCELLATION_DATE_C
      ,C.NOT_A_GOOD_FIT_C
      ,C.ANTICIPATED_RETURN_C
      ,C.ANTICIPATED_RETURN_TIMEFRAME_C
      ,C.APP_FORCE_FUNCTIONALITY_OTHER_C
      ,C.PRODUCT_CANCELLING_C
      ,C.UNCANCEL_C
      ,C.CUSTOMER_ACTIVATION_DATE_AGE_C
      ,C.WENT_TO_COMPETITOR_C
      ,C.WENT_TO_COMPETITOR_V_2_C
      ,C.SERVICE_ISSUES_C
      ,C.SERVICE_ISSUES_OTHER_C
      ,C.COMPETITOR_C
      ,C.COMPETITOR_OTHER_C
      ,SALESFORCE_USERID_CANCEL_OWNER
      ,SALESFORCE_USERNAME_CANCEL_OWNER
      ,CANCEL_CREATED_DATE
      ,C.DESIRED_APP_FORCE_FUNCTIONALITY_C
      ,C.DESIRED_INTEGRATIONS_C
      ,C.DESIRED_INTEGRATION_OTHER_C
      FROM MRR_CHURN MC
      LEFT JOIN RUBY.CH.CANCEL C ON MC.CRM_ID = C.SALESFORCE_ACCOUNT AND C.CANCEL_CREATED_DATE BETWEEN DATEADD(DAY,-60,MRR_Churn_Date) AND C.CANCEL_CREATED_DATE AND C.CANCEL_CREATED_DATE < MRR_CHURN_DATE
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: crm_id {
    type: string
    sql: ${TABLE}."CRM_ID" ;;
  }

  dimension: max_mrr_churn_date {
    type: date
    sql: ${TABLE}."MAX_MRR_CHURN_DATE" ;;
  }

  dimension: salesforce_cancel_id {
    type: string
    sql: ${TABLE}."SALESFORCE_CANCEL_ID" ;;
  }

  dimension: salesforce_account {
    type: string
    sql: ${TABLE}."SALESFORCE_ACCOUNT" ;;
  }

  dimension: salesforce_account_owner {
    type: string
    sql: ${TABLE}."SALESFORCE_ACCOUNT_OWNER" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: customer_industry {
    type: string
    sql: ${TABLE}."CUSTOMER_INDUSTRY" ;;
  }

  dimension: cancel_owner_employee_code {
    type: number
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_CODE" ;;
  }

  dimension: cancel_owner_employee_id {
    type: number
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_ID" ;;
  }

  dimension: cancel_owner_employee_name {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_NAME" ;;
  }

  dimension: cancel_owner_firstname {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_FIRSTNAME" ;;
  }

  dimension: cancel_owner_lastname {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_LASTNAME" ;;
  }

  dimension: cancel_owner_legalname {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_LEGALNAME" ;;
  }

  dimension: cancel_saved_by_employee_name {
    type: string
    sql: ${TABLE}."CANCEL_SAVED_BY_EMPLOYEE_NAME" ;;
  }

  dimension: customer_saved_c {
    type: yesno
    sql: ${TABLE}."CUSTOMER_SAVED_C" ;;
  }

  dimension: cancel_saved_by_employee_code {
    type: number
    sql: ${TABLE}."CANCEL_SAVED_BY_EMPLOYEE_CODE" ;;
  }

  dimension: cancel_saved_by_employee_id {
    type: number
    sql: ${TABLE}."CANCEL_SAVED_BY_EMPLOYEE_ID" ;;
  }

  dimension: cancel_owner_employee_status {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_EMPLOYEE_STATUS" ;;
  }

  dimension: cancel_owner_title {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_TITLE" ;;
  }

  dimension: cancel_owner_team {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_TEAM" ;;
  }

  dimension: cancel_owner_supervisor_primary {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_SUPERVISOR_PRIMARY" ;;
  }

  dimension: cancel_owner_email {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_EMAIL" ;;
  }

  dimension: cancel_owner_samaccountname {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_SAMACCOUNTNAME" ;;
  }

  dimension: cancel_owner_department {
    type: string
    sql: ${TABLE}."CANCEL_OWNER_DEPARTMENT" ;;
  }

  dimension: cancellation_effective_date_c {
    type: date
    sql: ${TABLE}."CANCELLATION_EFFECTIVE_DATE_C" ;;
  }

  dimension: primary_attempted_tactic_c {
    type: string
    sql: ${TABLE}."PRIMARY_ATTEMPTED_TACTIC_C" ;;
  }

  dimension: primary_cancel_reason_c {
    type: string
    sql: ${TABLE}."PRIMARY_CANCEL_REASON_C" ;;
  }

  dimension: primary_reason_detail_c {
    type: string
    sql: ${TABLE}."PRIMARY_REASON_DETAIL_C" ;;
  }

  dimension: what_saved_this_customer_c {
    type: string
    sql: ${TABLE}."WHAT_SAVED_THIS_CUSTOMER_C" ;;
  }

  dimension: cancellation_date_c {
    type: date
    sql: ${TABLE}."CANCELLATION_DATE_C" ;;
  }

  dimension: not_a_good_fit_c {
    type: yesno
    sql: ${TABLE}."NOT_A_GOOD_FIT_C" ;;
  }

  dimension: anticipated_return_c {
    type: date
    sql: ${TABLE}."ANTICIPATED_RETURN_C" ;;
  }

  dimension: anticipated_return_timeframe_c {
    type: string
    sql: ${TABLE}."ANTICIPATED_RETURN_TIMEFRAME_C" ;;
  }

  dimension: app_force_functionality_other_c {
    type: string
    sql: ${TABLE}."APP_FORCE_FUNCTIONALITY_OTHER_C" ;;
  }

  dimension: product_cancelling_c {
    type: string
    sql: ${TABLE}."PRODUCT_CANCELLING_C" ;;
  }

  dimension: uncancel_c {
    type: yesno
    sql: ${TABLE}."UNCANCEL_C" ;;
  }

  dimension: customer_activation_date_age_c {
    type: number
    sql: ${TABLE}."CUSTOMER_ACTIVATION_DATE_AGE_C" ;;
  }

  dimension: went_to_competitor_c {
    type: yesno
    sql: ${TABLE}."WENT_TO_COMPETITOR_C" ;;
  }

  dimension: went_to_competitor_v_2_c {
    type: string
    sql: ${TABLE}."WENT_TO_COMPETITOR_V_2_C" ;;
  }

  dimension: service_issues_c {
    type: string
    sql: ${TABLE}."SERVICE_ISSUES_C" ;;
  }

  dimension: service_issues_other_c {
    type: string
    sql: ${TABLE}."SERVICE_ISSUES_OTHER_C" ;;
  }

  dimension: competitor_c {
    type: string
    sql: ${TABLE}."COMPETITOR_C" ;;
  }

  dimension: competitor_other_c {
    type: string
    sql: ${TABLE}."COMPETITOR_OTHER_C" ;;
  }

  dimension: salesforce_userid_cancel_owner {
    type: string
    sql: ${TABLE}."SALESFORCE_USERID_CANCEL_OWNER" ;;
  }

  dimension: salesforce_username_cancel_owner {
    type: string
    sql: ${TABLE}."SALESFORCE_USERNAME_CANCEL_OWNER" ;;
  }

  dimension_group: cancel_created_date {
    type: time
    sql: ${TABLE}."CANCEL_CREATED_DATE" ;;
  }

  dimension: desired_app_force_functionality_c {
    type: string
    sql: ${TABLE}."DESIRED_APP_FORCE_FUNCTIONALITY_C" ;;
  }

  dimension: desired_integrations_c {
    type: string
    sql: ${TABLE}."DESIRED_INTEGRATIONS_C" ;;
  }

  dimension: desired_integration_other_c {
    type: string
    sql: ${TABLE}."DESIRED_INTEGRATION_OTHER_C" ;;
  }

  set: detail {
    fields: [
      crm_id,
      max_mrr_churn_date,
      salesforce_cancel_id,
      salesforce_account,
      salesforce_account_owner,
      customer,
      customer_industry,
      cancel_owner_employee_code,
      cancel_owner_employee_id,
      cancel_owner_employee_name,
      cancel_owner_firstname,
      cancel_owner_lastname,
      cancel_owner_legalname,
      cancel_saved_by_employee_name,
      customer_saved_c,
      cancel_saved_by_employee_code,
      cancel_saved_by_employee_id,
      cancel_owner_employee_status,
      cancel_owner_title,
      cancel_owner_team,
      cancel_owner_supervisor_primary,
      cancel_owner_email,
      cancel_owner_samaccountname,
      cancel_owner_department,
      cancellation_effective_date_c,
      primary_attempted_tactic_c,
      primary_cancel_reason_c,
      primary_reason_detail_c,
      what_saved_this_customer_c,
      cancellation_date_c,
      not_a_good_fit_c,
      anticipated_return_c,
      anticipated_return_timeframe_c,
      app_force_functionality_other_c,
      product_cancelling_c,
      uncancel_c,
      customer_activation_date_age_c,
      went_to_competitor_c,
      went_to_competitor_v_2_c,
      service_issues_c,
      service_issues_other_c,
      competitor_c,
      competitor_other_c,
      salesforce_userid_cancel_owner,
      salesforce_username_cancel_owner,
      cancel_created_date_time,
      desired_app_force_functionality_c,
      desired_integrations_c,
      desired_integration_other_c
    ]
  }
}
