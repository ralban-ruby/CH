view: salesforce_account {
    derived_table: {
      sql: SELECT * FROM FIVETRAN_DB.SALESFORCE."ACCOUNT"
              WHERE IS_DELETED <> 1
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: id {
      type: string
      sql: ${TABLE}."ID" ;;
    }

    dimension: is_deleted {
      type: yesno
      sql: ${TABLE}."IS_DELETED" ;;
    }

    dimension: master_record_id {
      type: string
      sql: ${TABLE}."MASTER_RECORD_ID" ;;
    }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
    link: {
      label: "Link To Account Dashboard: {{ value }} "
      url: "https://rubyreceptionists.cloud.looker.com/dashboards/13?CRM%20Name={{ salesforce_account.crm_name | encode_url }}"
      icon_url: "https://www.google.com/s2/favicons?domain=https://www.ruby.com/"
    }
    html:
      <a href="https://rubyreceptionists.cloud.looker.com/dashboards/13?CRM%20Name={{ salesforce_account.crm_name._value | encode_url }}">{{ value }}</a>;;
  }

  dimension: crm_name {
    type: string
    sql: CONCAT(CONCAT(${TABLE}.name,' - '),${TABLE}.id) ;;
  }

  dimension: type {
      type: string
      sql: ${TABLE}."TYPE" ;;
    }

    dimension: record_type_id {
      type: string
      sql: ${TABLE}."RECORD_TYPE_ID" ;;
    }

    dimension: parent_id {
      type: string
      sql: ${TABLE}."PARENT_ID" ;;
    }

    dimension: billing_street {
      type: string
      sql: ${TABLE}."BILLING_STREET" ;;
    }

    dimension: billing_city {
      type: string
      sql: ${TABLE}."BILLING_CITY" ;;
    }

    dimension: billing_state {
      type: string
      sql: ${TABLE}."BILLING_STATE" ;;
    }

    dimension: billing_postal_code {
      type: string
      sql: ${TABLE}."BILLING_POSTAL_CODE" ;;
    }

    dimension: billing_country {
      type: string
      sql: ${TABLE}."BILLING_COUNTRY" ;;
    }

    dimension: billing_latitude {
      type: number
      sql: ${TABLE}."BILLING_LATITUDE" ;;
    }

    dimension: billing_longitude {
      type: number
      sql: ${TABLE}."BILLING_LONGITUDE" ;;
    }

    dimension: billing_geocode_accuracy {
      type: string
      sql: ${TABLE}."BILLING_GEOCODE_ACCURACY" ;;
    }

    dimension: shipping_street {
      type: string
      sql: ${TABLE}."SHIPPING_STREET" ;;
    }

    dimension: shipping_city {
      type: string
      sql: ${TABLE}."SHIPPING_CITY" ;;
    }

    dimension: shipping_state {
      type: string
      sql: ${TABLE}."SHIPPING_STATE" ;;
    }

    dimension: shipping_postal_code {
      type: string
      sql: ${TABLE}."SHIPPING_POSTAL_CODE" ;;
    }

    dimension: shipping_country {
      type: string
      sql: ${TABLE}."SHIPPING_COUNTRY" ;;
    }

    dimension: shipping_latitude {
      type: number
      sql: ${TABLE}."SHIPPING_LATITUDE" ;;
    }

    dimension: shipping_longitude {
      type: number
      sql: ${TABLE}."SHIPPING_LONGITUDE" ;;
    }

    dimension: shipping_geocode_accuracy {
      type: string
      sql: ${TABLE}."SHIPPING_GEOCODE_ACCURACY" ;;
    }

    dimension: phone {
      type: string
      sql: ${TABLE}."PHONE" ;;
    }

    dimension: website {
      type: string
      sql: ${TABLE}."WEBSITE" ;;
    }

    dimension: photo_url {
      type: string
      sql: ${TABLE}."PHOTO_URL" ;;
    }

    dimension: industry {
      type: string
      sql: ${TABLE}."INDUSTRY" ;;
    }

    dimension: number_of_employees {
      type: number
      sql: ${TABLE}."NUMBER_OF_EMPLOYEES" ;;
    }

    dimension: description {
      type: string
      sql: ${TABLE}."DESCRIPTION" ;;
    }

    dimension: owner_id {
      type: string
      sql: ${TABLE}."OWNER_ID" ;;
    }

    dimension_group: created_date {
      type: time
      sql: ${TABLE}."CREATED_DATE" ;;
    }

    dimension: created_by_id {
      type: string
      sql: ${TABLE}."CREATED_BY_ID" ;;
    }

    dimension_group: last_modified_date {
      type: time
      sql: ${TABLE}."LAST_MODIFIED_DATE" ;;
    }

    dimension: last_modified_by_id {
      type: string
      sql: ${TABLE}."LAST_MODIFIED_BY_ID" ;;
    }

    dimension_group: system_modstamp {
      type: time
      sql: ${TABLE}."SYSTEM_MODSTAMP" ;;
    }

    dimension: last_activity_date {
      type: date
      sql: ${TABLE}."LAST_ACTIVITY_DATE" ;;
    }

    dimension_group: last_viewed_date {
      type: time
      sql: ${TABLE}."LAST_VIEWED_DATE" ;;
    }

    dimension_group: last_referenced_date {
      type: time
      sql: ${TABLE}."LAST_REFERENCED_DATE" ;;
    }

    dimension: jigsaw_company_id {
      type: string
      sql: ${TABLE}."JIGSAW_COMPANY_ID" ;;
    }

    dimension: ais_id_c {
      type: number
      sql: ${TABLE}."AIS_ID_C" ;;
    }

    dimension: plan_owner_c {
      type: string
      sql: ${TABLE}."PLAN_OWNER_C" ;;
    }

    dimension: plan_owner_id_c {
      type: number
      sql: ${TABLE}."PLAN_OWNER_ID_C" ;;
    }

    dimension: marketing_phone_c {
      type: string
      sql: ${TABLE}."MARKETING_PHONE_C" ;;
    }

    dimension: pharmacy_benefit_manager_c {
      type: string
      sql: ${TABLE}."PHARMACY_BENEFIT_MANAGER_C" ;;
    }

    dimension: specialty_pharmacy_c {
      type: string
      sql: ${TABLE}."SPECIALTY_PHARMACY_C" ;;
    }

    dimension: geo_service_area_c {
      type: string
      sql: ${TABLE}."GEO_SERVICE_AREA_C" ;;
    }

    dimension: aliases_c {
      type: string
      sql: ${TABLE}."ALIASES_C" ;;
    }

    dimension: provider_sponsored_c {
      type: yesno
      sql: ${TABLE}."PROVIDER_SPONSORED_C" ;;
    }

    dimension: blues_c {
      type: yesno
      sql: ${TABLE}."BLUES_C" ;;
    }

    dimension: public_exchanges_c {
      type: yesno
      sql: ${TABLE}."PUBLIC_EXCHANGES_C" ;;
    }

    dimension: coop_c {
      type: yesno
      sql: ${TABLE}."COOP_C" ;;
    }

    dimension: medicare_only_c {
      type: yesno
      sql: ${TABLE}."MEDICARE_ONLY_C" ;;
    }

    dimension: medicaid_only_c {
      type: yesno
      sql: ${TABLE}."MEDICAID_ONLY_C" ;;
    }

    dimension: commercial_only_c {
      type: yesno
      sql: ${TABLE}."COMMERCIAL_ONLY_C" ;;
    }

    dimension: total_medical_c {
      type: number
      sql: ${TABLE}."TOTAL_MEDICAL_C" ;;
    }

    dimension: total_fully_funded_c {
      type: number
      sql: ${TABLE}."TOTAL_FULLY_FUNDED_C" ;;
    }

    dimension: commercial_risk_c {
      type: number
      sql: ${TABLE}."COMMERCIAL_RISK_C" ;;
    }

    dimension: total_group_risk_c {
      type: number
      sql: ${TABLE}."TOTAL_GROUP_RISK_C" ;;
    }

    dimension: large_group_risk_c {
      type: number
      sql: ${TABLE}."LARGE_GROUP_RISK_C" ;;
    }

    dimension: small_group_risk_c {
      type: number
      sql: ${TABLE}."SMALL_GROUP_RISK_C" ;;
    }

    dimension: individual_non_group_c {
      type: number
      sql: ${TABLE}."INDIVIDUAL_NON_GROUP_C" ;;
    }

    dimension: medicare_supplement_c {
      type: number
      sql: ${TABLE}."MEDICARE_SUPPLEMENT_C" ;;
    }

    dimension: public_sector_risk_c {
      type: number
      sql: ${TABLE}."PUBLIC_SECTOR_RISK_C" ;;
    }

    dimension: total_medicare_advantage_c {
      type: number
      sql: ${TABLE}."TOTAL_MEDICARE_ADVANTAGE_C" ;;
    }

    dimension: medicare_ccp_c {
      type: number
      sql: ${TABLE}."MEDICARE_CCP_C" ;;
    }

    dimension: medicare_cost_c {
      type: number
      sql: ${TABLE}."MEDICARE_COST_C" ;;
    }

    dimension: medicare_pffs_c {
      type: number
      sql: ${TABLE}."MEDICARE_PFFS_C" ;;
    }

    dimension: pace_program_c {
      type: number
      sql: ${TABLE}."PACE_PROGRAM_C" ;;
    }

    dimension: dual_eligibles_c {
      type: number
      sql: ${TABLE}."DUAL_ELIGIBLES_C" ;;
    }

    dimension: medicaid_hmo_risk_c {
      type: number
      sql: ${TABLE}."MEDICAID_HMO_RISK_C" ;;
    }

    dimension: medicaid_ffs_risk_c {
      type: number
      sql: ${TABLE}."MEDICAID_FFS_RISK_C" ;;
    }

    dimension: schip_c {
      type: number
      sql: ${TABLE}."SCHIP_C" ;;
    }

    dimension: other_unspecified_risk_c {
      type: number
      sql: ${TABLE}."OTHER_UNSPECIFIED_RISK_C" ;;
    }

    dimension: total_self_funded_c {
      type: number
      sql: ${TABLE}."TOTAL_SELF_FUNDED_C" ;;
    }

    dimension: other_c {
      type: number
      sql: ${TABLE}."OTHER_C" ;;
    }

    dimension: fehbp_c {
      type: number
      sql: ${TABLE}."FEHBP_C" ;;
    }

    dimension: medicare_part_d_c {
      type: number
      sql: ${TABLE}."MEDICARE_PART_D_C" ;;
    }

    dimension: aco_id_c {
      type: number
      sql: ${TABLE}."ACO_ID_C" ;;
    }

    dimension: aco_launch_date_c {
      type: date
      sql: ${TABLE}."ACO_LAUNCH_DATE_C" ;;
    }

    dimension: health_plan_affiliates_sponsors_c {
      type: string
      sql: ${TABLE}."HEALTH_PLAN_AFFILIATES_SPONSORS_C" ;;
    }

    dimension: provider_affiliates_sponsors_c {
      type: string
      sql: ${TABLE}."PROVIDER_AFFILIATES_SPONSORS_C" ;;
    }

    dimension: sector_c {
      type: string
      sql: ${TABLE}."SECTOR_C" ;;
    }

    dimension: aco_type_c {
      type: string
      sql: ${TABLE}."ACO_TYPE_C" ;;
    }

    dimension: owner_id_c {
      type: number
      sql: ${TABLE}."OWNER_ID_C" ;;
    }

    dimension: subsidiary_name_c {
      type: string
      sql: ${TABLE}."SUBSIDIARY_NAME_C" ;;
    }

    dimension: subsidiary_city_c {
      type: string
      sql: ${TABLE}."SUBSIDIARY_CITY_C" ;;
    }

    dimension: subsidiary_state_c {
      type: string
      sql: ${TABLE}."SUBSIDIARY_STATE_C" ;;
    }

    dimension: legal_entity_name_c {
      type: string
      sql: ${TABLE}."LEGAL_ENTITY_NAME_C" ;;
    }

    dimension: marketing_name_c {
      type: string
      sql: ${TABLE}."MARKETING_NAME_C" ;;
    }

    dimension: plan_design_c {
      type: string
      sql: ${TABLE}."PLAN_DESIGN_C" ;;
    }

    dimension: contract_renewal_date_c {
      type: date
      sql: ${TABLE}."CONTRACT_RENEWAL_DATE_C" ;;
    }

    dimension: discount_type_c {
      type: string
      sql: ${TABLE}."DISCOUNT_TYPE_C" ;;
    }

    dimension: discount_percentage_c {
      type: number
      sql: ${TABLE}."DISCOUNT_PERCENTAGE_C" ;;
    }

    dimension: discount_amount_c {
      type: number
      sql: ${TABLE}."DISCOUNT_AMOUNT_C" ;;
    }

    dimension: partner_since_c {
      type: date
      sql: ${TABLE}."PARTNER_SINCE_C" ;;
    }

    dimension: promo_code_c {
      type: string
      sql: ${TABLE}."PROMO_CODE_C" ;;
    }

    dimension: feature_request_c {
      type: string
      sql: ${TABLE}."FEATURE_REQUEST_C" ;;
    }

    dimension: partner_type_c {
      type: string
      sql: ${TABLE}."PARTNER_TYPE_C" ;;
    }

    dimension: did_c {
      type: string
      sql: ${TABLE}."DID_C" ;;
    }

    dimension: most_recent_olsa_submit_c {
      type: date
      sql: ${TABLE}."MOST_RECENT_OLSA_SUBMIT_C" ;;
    }

    dimension: time_zone_c {
      type: string
      sql: ${TABLE}."TIME_ZONE_C" ;;
    }

    dimension: prl_customer_id_c {
      type: number
      sql: ${TABLE}."PRL_CUSTOMER_ID_C" ;;
    }

    dimension: contact_c {
      type: string
      sql: ${TABLE}."CONTACT_C" ;;
    }

    dimension: cancel_date_c {
      type: date
      sql: ${TABLE}."CANCEL_DATE_C" ;;
    }

    dimension: end_date_c {
      type: date
      sql: ${TABLE}."END_DATE_C" ;;
    }

    dimension: prl_id_c {
      type: number
      sql: ${TABLE}."PRL_ID_C" ;;
    }

    dimension: prl_company_id_c {
      type: number
      sql: ${TABLE}."PRL_COMPANY_ID_C" ;;
    }

    dimension: prl_customer_guid_c {
      type: string
      sql: ${TABLE}."PRL_CUSTOMER_GUID_C" ;;
    }

    dimension: prl_company_guid_c {
      type: string
      sql: ${TABLE}."PRL_COMPANY_GUID_C" ;;
    }

    dimension: cancel_note_c {
      type: string
      sql: ${TABLE}."CANCEL_NOTE_C" ;;
    }

    dimension: reach_c {
      type: number
      sql: ${TABLE}."REACH_C" ;;
    }

    dimension: status_c {
      type: string
      sql: ${TABLE}."STATUS_C" ;;
    }

    dimension: partner_won_date_c {
      type: date
      sql: ${TABLE}."PARTNER_WON_DATE_C" ;;
    }

    dimension_group: olsa_started_c {
      type: time
      sql: ${TABLE}."OLSA_STARTED_C" ;;
    }

    dimension: of_employees_c {
      type: string
      sql: ${TABLE}."OF_EMPLOYEES_C" ;;
    }

    dimension: of_employees_range_c {
      type: string
      sql: ${TABLE}."OF_EMPLOYEES_RANGE_C" ;;
    }

    dimension: business_need_c {
      type: string
      sql: ${TABLE}."BUSINESS_NEED_C" ;;
    }

    dimension: business_need_score_c {
      type: number
      sql: ${TABLE}."BUSINESS_NEED_SCORE_C" ;;
    }

    dimension: business_size_c {
      type: string
      sql: ${TABLE}."BUSINESS_SIZE_C" ;;
    }

    dimension: business_size_score_c {
      type: number
      sql: ${TABLE}."BUSINESS_SIZE_SCORE_C" ;;
    }

    dimension: call_volume_c {
      type: string
      sql: ${TABLE}."CALL_VOLUME_C" ;;
    }

    dimension: call_volume_score_c {
      type: number
      sql: ${TABLE}."CALL_VOLUME_SCORE_C" ;;
    }

    dimension: cancel_reason_c {
      type: string
      sql: ${TABLE}."CANCEL_REASON_C" ;;
    }

    dimension: customer_activation_date_c {
      type: date
      sql: ${TABLE}."CUSTOMER_ACTIVATION_DATE_C" ;;
    }

    dimension: customer_status_c {
      type: string
      sql: ${TABLE}."CUSTOMER_STATUS_C" ;;
    }

    dimension: main_company_phone_number_c {
      type: string
      sql: ${TABLE}."MAIN_COMPANY_PHONE_NUMBER_C" ;;
    }

    dimension_group: original_close_date_c {
      type: time
      sql: ${TABLE}."ORIGINAL_CLOSE_DATE_C" ;;
    }

    dimension: original_lead_source_c {
      type: string
      sql: ${TABLE}."ORIGINAL_LEAD_SOURCE_C" ;;
    }

    dimension: original_lead_source_detail_c {
      type: string
      sql: ${TABLE}."ORIGINAL_LEAD_SOURCE_DETAIL_C" ;;
    }

    dimension: partnership_c {
      type: string
      sql: ${TABLE}."PARTNERSHIP_C" ;;
    }

    dimension: primary_industry_c {
      type: string
      sql: ${TABLE}."PRIMARY_INDUSTRY_C" ;;
    }

    dimension: revenue_c {
      type: string
      sql: ${TABLE}."REVENUE_C" ;;
    }

    dimension: revenue_range_c {
      type: string
      sql: ${TABLE}."REVENUE_RANGE_C" ;;
    }

    dimension: sales_sharepoint_created_date_c {
      type: date
      sql: ${TABLE}."SALES_SHAREPOINT_CREATED_DATE_C" ;;
    }

    dimension: progress_c {
      type: string
      sql: ${TABLE}."PROGRESS_C" ;;
    }

    dimension: sic_code_c {
      type: string
      sql: ${TABLE}."SIC_CODE_C" ;;
    }

    dimension: sic_description_c {
      type: string
      sql: ${TABLE}."SIC_DESCRIPTION_C" ;;
    }

    dimension: timeline_c {
      type: string
      sql: ${TABLE}."TIMELINE_C" ;;
    }

    dimension: timeline_score_c {
      type: number
      sql: ${TABLE}."TIMELINE_SCORE_C" ;;
    }

    dimension: duns_c {
      type: string
      sql: ${TABLE}."DUNS_C" ;;
    }

    dimension: progress_notes_c {
      type: string
      sql: ${TABLE}."PROGRESS_NOTES_C" ;;
    }

    dimension: lead_source_c {
      type: string
      sql: ${TABLE}."LEAD_SOURCE_C" ;;
    }

    dimension: lead_source_detail_c {
      type: string
      sql: ${TABLE}."LEAD_SOURCE_DETAIL_C" ;;
    }

    dimension: churn_risk_c {
      type: yesno
      sql: ${TABLE}."CHURN_RISK_C" ;;
    }

    dimension: how_heard_c {
      type: string
      sql: ${TABLE}."HOW_HEARD_C" ;;
    }

    dimension: how_heard_detail_c {
      type: string
      sql: ${TABLE}."HOW_HEARD_DETAIL_C" ;;
    }

    dimension: budget_c {
      type: string
      sql: ${TABLE}."BUDGET_C" ;;
    }

    dimension: authority_c {
      type: string
      sql: ${TABLE}."AUTHORITY_C" ;;
    }

    dimension: test_account_c {
      type: yesno
      sql: ${TABLE}."TEST_ACCOUNT_C" ;;
    }

    dimension: agent_id_c {
      type: string
      sql: ${TABLE}."AGENT_ID_C" ;;
    }

    dimension: pc_customer_id_c {
      type: string
      sql: ${TABLE}."PC_CUSTOMER_ID_C" ;;
    }

    dimension: sales_c {
      type: string
      sql: ${TABLE}."SALES_C" ;;
    }

    dimension: customer_success_manager_c {
      type: string
      sql: ${TABLE}."CUSTOMER_SUCCESS_MANAGER_C" ;;
    }

    dimension: onboarding_c {
      type: string
      sql: ${TABLE}."ONBOARDING_C" ;;
    }

    dimension: chat_brand_c {
      type: string
      sql: ${TABLE}."CHAT_BRAND_C" ;;
    }

    dimension: pc_acct_number_c {
      type: string
      sql: ${TABLE}."PC_ACCT_NUMBER_C" ;;
    }

    dimension: child_cancel_reason_c {
      type: string
      sql: ${TABLE}."CHILD_CANCEL_REASON_C" ;;
    }

    dimension: no_sales_c {
      type: yesno
      sql: ${TABLE}."NO_SALES_C" ;;
    }

    dimension: current_plan_start_prl_c {
      type: date
      sql: ${TABLE}."CURRENT_PLAN_START_PRL_C" ;;
    }

    dimension: current_plan_description_prl_c {
      type: string
      sql: ${TABLE}."CURRENT_PLAN_DESCRIPTION_PRL_C" ;;
    }

    dimension: current_plan_detail_id_prl_c {
      type: string
      sql: ${TABLE}."CURRENT_PLAN_DETAIL_ID_PRL_C" ;;
    }

    dimension: current_plan_minutes_prl_c {
      type: number
      sql: ${TABLE}."CURRENT_PLAN_MINUTES_PRL_C" ;;
    }

    dimension: last_payment_amt_prl_c {
      type: number
      sql: ${TABLE}."LAST_PAYMENT_AMT_PRL_C" ;;
    }

    dimension: last_payment_date_prl_c {
      type: date
      sql: ${TABLE}."LAST_PAYMENT_DATE_PRL_C" ;;
    }

    dimension: pc_chat_brand_c {
      type: string
      sql: ${TABLE}."PC_CHAT_BRAND_C" ;;
    }

    dimension: pc_account_id_number_c {
      type: string
      sql: ${TABLE}."PC_ACCOUNT_ID_NUMBER_C" ;;
    }

    dimension: account_executive_c {
      type: string
      sql: ${TABLE}."ACCOUNT_EXECUTIVE_C" ;;
    }

    dimension: account_name_ex_id_c {
      type: string
      sql: ${TABLE}."ACCOUNT_NAME_EX_ID_C" ;;
    }

    dimension: actual_monthly_recurring_revenue_c {
      type: number
      sql: ${TABLE}."ACTUAL_MONTHLY_RECURRING_REVENUE_C" ;;
    }

    dimension: address_2_c {
      type: string
      sql: ${TABLE}."ADDRESS_2_C" ;;
    }

    dimension: auto_pay_off_reason_c {
      type: string
      sql: ${TABLE}."AUTO_PAY_OFF_REASON_C" ;;
    }

    dimension: billing_contact_c {
      type: string
      sql: ${TABLE}."BILLING_CONTACT_C" ;;
    }

    dimension: billing_day_c {
      type: string
      sql: ${TABLE}."BILLING_DAY_C" ;;
    }

    dimension: chat_performance_report_email_1_c {
      type: string
      sql: ${TABLE}."CHAT_PERFORMANCE_REPORT_EMAIL_1_C" ;;
    }

    dimension: chat_performance_report_email_2_c {
      type: string
      sql: ${TABLE}."CHAT_PERFORMANCE_REPORT_EMAIL_2_C" ;;
    }

    dimension: facebook_project_c {
      type: string
      sql: ${TABLE}."FACEBOOK_PROJECT_C" ;;
    }

    dimension: first_charge_date_c {
      type: date
      sql: ${TABLE}."FIRST_CHARGE_DATE_C" ;;
    }

    dimension: google_project_c {
      type: string
      sql: ${TABLE}."GOOGLE_PROJECT_C" ;;
    }

    dimension: next_steps_date_c {
      type: date
      sql: ${TABLE}."NEXT_STEPS_DATE_C" ;;
    }

    dimension: next_steps_c {
      type: string
      sql: ${TABLE}."NEXT_STEPS_C" ;;
    }

    dimension: pc_auto_pay_off_c {
      type: yesno
      sql: ${TABLE}."PC_AUTO_PAY_OFF_C" ;;
    }

    dimension: partnership_discount_c {
      type: string
      sql: ${TABLE}."PARTNERSHIP_DISCOUNT_C" ;;
    }

    dimension: product_type_c {
      type: string
      sql: ${TABLE}."PRODUCT_TYPE_C" ;;
    }

    dimension: send_getting_started_video_c {
      type: yesno
      sql: ${TABLE}."SEND_GETTING_STARTED_VIDEO_C" ;;
    }

    dimension: stripe_customer_token_c {
      type: string
      sql: ${TABLE}."STRIPE_CUSTOMER_TOKEN_C" ;;
    }

    dimension: website_project_c {
      type: string
      sql: ${TABLE}."WEBSITE_PROJECT_C" ;;
    }

    dimension: stripe_card_token_c {
      type: string
      sql: ${TABLE}."STRIPE_CARD_TOKEN_C" ;;
    }

    dimension: pc_region_c {
      type: string
      sql: ${TABLE}."PC_REGION_C" ;;
    }

    dimension: first_invoice_created_c {
      type: yesno
      sql: ${TABLE}."FIRST_INVOICE_CREATED_C" ;;
    }

    dimension: web_project_legacy_acct_c {
      type: string
      sql: ${TABLE}."WEB_PROJECT_LEGACY_ACCT_C" ;;
    }

    dimension: zuora_active_c {
      type: string
      sql: ${TABLE}."ZUORA_ACTIVE_C" ;;
    }

    dimension: zuora_customer_priority_c {
      type: string
      sql: ${TABLE}."ZUORA_CUSTOMER_PRIORITY_C" ;;
    }

    dimension: zuora_numberof_locations_c {
      type: number
      sql: ${TABLE}."ZUORA_NUMBEROF_LOCATIONS_C" ;;
    }

    dimension: zuora_slaexpiration_date_c {
      type: date
      sql: ${TABLE}."ZUORA_SLAEXPIRATION_DATE_C" ;;
    }

    dimension: zuora_slaserial_number_c {
      type: string
      sql: ${TABLE}."ZUORA_SLASERIAL_NUMBER_C" ;;
    }

    dimension: zuora_sla_c {
      type: string
      sql: ${TABLE}."ZUORA_SLA_C" ;;
    }

    dimension: zuora_upsell_opportunity_c {
      type: string
      sql: ${TABLE}."ZUORA_UPSELL_OPPORTUNITY_C" ;;
    }

    dimension: pco_id_c {
      type: string
      sql: ${TABLE}."PCO_ID_C" ;;
    }

    dimension: partnership_percent_c {
      type: string
      sql: ${TABLE}."PARTNERSHIP_PERCENT_C" ;;
    }

    dimension: chat_onboarding_owner_c {
      type: string
      sql: ${TABLE}."CHAT_ONBOARDING_OWNER_C" ;;
    }

    dimension: chat_csm_c {
      type: string
      sql: ${TABLE}."CHAT_CSM_C" ;;
    }

    dimension_group: co_r_date_c {
      type: time
      sql: ${TABLE}."CO_R_DATE_C" ;;
    }

    dimension: co_r_duration_c {
      type: number
      sql: ${TABLE}."CO_R_DURATION_C" ;;
    }

    dimension_group: mql_date_c {
      type: time
      sql: ${TABLE}."MQL_DATE_C" ;;
    }

    dimension: mql_duration_c {
      type: number
      sql: ${TABLE}."MQL_DURATION_C" ;;
    }

    dimension_group: new_lead_date_c {
      type: time
      sql: ${TABLE}."NEW_LEAD_DATE_C" ;;
    }

    dimension: new_lead_duration_c {
      type: number
      sql: ${TABLE}."NEW_LEAD_DURATION_C" ;;
    }

    dimension: original_active_c {
      type: date
      sql: ${TABLE}."ORIGINAL_ACTIVE_C" ;;
    }

    dimension: original_converted_c {
      type: date
      sql: ${TABLE}."ORIGINAL_CONVERTED_C" ;;
    }

    dimension: original_passive_c {
      type: date
      sql: ${TABLE}."ORIGINAL_PASSIVE_C" ;;
    }

    dimension_group: sql_date_c {
      type: time
      sql: ${TABLE}."SQL_DATE_C" ;;
    }

    dimension: grasshopper_customer_c {
      type: yesno
      sql: ${TABLE}."GRASSHOPPER_CUSTOMER_C" ;;
    }

    dimension: grasshopper_data_c {
      type: string
      sql: ${TABLE}."GRASSHOPPER_DATA_C" ;;
    }

    dimension: cloudingo_agent_bar_c {
      type: string
      sql: ${TABLE}."CLOUDINGO_AGENT_BAR_C" ;;
    }

    dimension: cloudingo_agent_bas_c {
      type: number
      sql: ${TABLE}."CLOUDINGO_AGENT_BAS_C" ;;
    }

    dimension: cloudingo_agent_bav_c {
      type: string
      sql: ${TABLE}."CLOUDINGO_AGENT_BAV_C" ;;
    }

    dimension: cloudingo_agent_brdi_c {
      type: string
      sql: ${TABLE}."CLOUDINGO_AGENT_BRDI_C" ;;
    }

    dimension: cloudingo_agent_btz_c {
      type: string
      sql: ${TABLE}."CLOUDINGO_AGENT_BTZ_C" ;;
    }

    dimension: cloudingo_agent_sar_c {
      type: string
      sql: ${TABLE}."CLOUDINGO_AGENT_SAR_C" ;;
    }

    dimension: cloudingo_agent_sas_c {
      type: number
      sql: ${TABLE}."CLOUDINGO_AGENT_SAS_C" ;;
    }

    dimension: cloudingo_agent_sav_c {
      type: string
      sql: ${TABLE}."CLOUDINGO_AGENT_SAV_C" ;;
    }

    dimension: cloudingo_agent_srdi_c {
      type: string
      sql: ${TABLE}."CLOUDINGO_AGENT_SRDI_C" ;;
    }

    dimension: cloudingo_agent_stz_c {
      type: string
      sql: ${TABLE}."CLOUDINGO_AGENT_STZ_C" ;;
    }

    dimension: most_recent_activation_c {
      type: date
      sql: ${TABLE}."MOST_RECENT_ACTIVATION_C" ;;
    }

    dimension: not_the_right_fit_c {
      type: yesno
      sql: ${TABLE}."NOT_THE_RIGHT_FIT_C" ;;
    }

    dimension: database_source_c {
      type: string
      sql: ${TABLE}."DATABASE_SOURCE_C" ;;
    }

    dimension: grass_hopper_billing_anniversary_c {
      type: date
      sql: ${TABLE}."GRASS_HOPPER_BILLING_ANNIVERSARY_C" ;;
    }

    dimension: gh_cohort_c {
      type: string
      sql: ${TABLE}."GH_COHORT_C" ;;
    }

    dimension: cohort_date_c {
      type: date
      sql: ${TABLE}."COHORT_DATE_C" ;;
    }

    dimension: first_date_c {
      type: date
      sql: ${TABLE}."FIRST_DATE_C" ;;
    }

    dimension: gclid_c {
      type: string
      sql: ${TABLE}."GCLID_C" ;;
    }

    dimension: last_campaign_c {
      type: string
      sql: ${TABLE}."LAST_CAMPAIGN_C" ;;
    }

    dimension: last_date_c {
      type: date
      sql: ${TABLE}."LAST_DATE_C" ;;
    }

    dimension: last_touch_c {
      type: string
      sql: ${TABLE}."LAST_TOUCH_C" ;;
    }

    dimension: utm_campaign_c {
      type: string
      sql: ${TABLE}."UTM_CAMPAIGN_C" ;;
    }

    dimension: utm_content_c {
      type: string
      sql: ${TABLE}."UTM_CONTENT_C" ;;
    }

    dimension: utm_medium_c {
      type: string
      sql: ${TABLE}."UTM_MEDIUM_C" ;;
    }

    dimension: utm_term_c {
      type: string
      sql: ${TABLE}."UTM_TERM_C" ;;
    }

    dimension: utm_vertical_c {
      type: string
      sql: ${TABLE}."UTM_VERTICAL_C" ;;
    }

    dimension: initial_contact_c {
      type: string
      sql: ${TABLE}."INITIAL_CONTACT_C" ;;
    }

    dimension_group: _fivetran_synced {
      type: time
      sql: ${TABLE}."_FIVETRAN_SYNCED" ;;
    }

    dimension: industry_c {
      type: string
      sql: ${TABLE}."INDUSTRY_C" ;;
    }

    dimension: hipaa_c {
      type: yesno
      sql: ${TABLE}."HIPAA_C" ;;
    }

    dimension: sub_industry_c {
      type: string
      sql: ${TABLE}."SUB_INDUSTRY_C" ;;
    }

    dimension: pendo_csm_2_c {
      type: string
      sql: ${TABLE}."PENDO_CSM_2_C" ;;
    }

    dimension: robocall_feature_c {
      type: yesno
      sql: ${TABLE}."ROBOCALL_FEATURE_C" ;;
    }

    dimension: last_mobile_app_login_c {
      type: date
      sql: ${TABLE}."LAST_MOBILE_APP_LOGIN_C" ;;
    }

    dimension: of_add_lines_c {
      type: number
      sql: ${TABLE}."OF_ADD_LINES_C" ;;
    }

    dimension: x_24_7_feature_c {
      type: yesno
      sql: ${TABLE}."X_24_7_FEATURE_C" ;;
    }

    dimension: ported_feature_c {
      type: yesno
      sql: ${TABLE}."PORTED_FEATURE_C" ;;
    }

    dimension: ruby_assist_c {
      type: yesno
      sql: ${TABLE}."RUBY_ASSIST_C" ;;
    }

    dimension: outbound_texts_c {
      type: yesno
      sql: ${TABLE}."OUTBOUND_TEXTS_C" ;;
    }

    dimension: last_force_login_c {
      type: date
      sql: ${TABLE}."LAST_FORCE_LOGIN_C" ;;
    }

    dimension: csm_referer_c {
      type: string
      sql: ${TABLE}."CSM_REFERER_C" ;;
    }

    dimension: csm_name_lookup_pendo_c {
      type: string
      sql: ${TABLE}."CSM_NAME_LOOKUP_PENDO_C" ;;
    }

    dimension: is_live_chat_customer_c {
      type: yesno
      sql: ${TABLE}."IS_LIVE_CHAT_CUSTOMER_C" ;;
    }

    dimension: activity_metric_id {
      type: string
      sql: ${TABLE}."ACTIVITY_METRIC_ID" ;;
    }

    dimension: referrer_sfdc_account_id_c {
      type: string
      sql: ${TABLE}."REFERRER_SFDC_ACCOUNT_ID_C" ;;
    }

    dimension: referring_email_c {
      type: string
      sql: ${TABLE}."REFERRING_EMAIL_C" ;;
    }

    dimension: referring_name_c {
      type: string
      sql: ${TABLE}."REFERRING_NAME_C" ;;
    }

    dimension: covid_19_c {
      type: yesno
      sql: ${TABLE}."COVID_19_C" ;;
    }

    dimension: lean_data_reporting_total_marketing_touches_c {
      type: number
      sql: ${TABLE}."LEAN_DATA_REPORTING_TOTAL_MARKETING_TOUCHES_C" ;;
    }

    dimension: lean_data_reporting_total_leads_and_contacts_c {
      type: number
      sql: ${TABLE}."LEAN_DATA_REPORTING_TOTAL_LEADS_AND_CONTACTS_C" ;;
    }

    dimension: lean_data_reporting_has_opportunity_c {
      type: yesno
      sql: ${TABLE}."LEAN_DATA_REPORTING_HAS_OPPORTUNITY_C" ;;
    }

    dimension: lean_data_search_c {
      type: string
      sql: ${TABLE}."LEAN_DATA_SEARCH_C" ;;
    }

    dimension_group: lean_data_reporting_last_marketing_touch_date_c {
      type: time
      sql: ${TABLE}."LEAN_DATA_REPORTING_LAST_MARKETING_TOUCH_DATE_C" ;;
    }

    dimension: lean_data_reporting_customer_c {
      type: yesno
      sql: ${TABLE}."LEAN_DATA_REPORTING_CUSTOMER_C" ;;
    }

    dimension: lean_data_routing_action_c {
      type: string
      sql: ${TABLE}."LEAN_DATA_ROUTING_ACTION_C" ;;
    }

    dimension: lean_data_reporting_total_sales_touches_c {
      type: number
      sql: ${TABLE}."LEAN_DATA_REPORTING_TOTAL_SALES_TOUCHES_C" ;;
    }

    dimension: lean_data_reporting_recent_marketing_touches_c {
      type: number
      sql: ${TABLE}."LEAN_DATA_REPORTING_RECENT_MARKETING_TOUCHES_C" ;;
    }

    dimension: lean_data_reporting_target_account_c {
      type: yesno
      sql: ${TABLE}."LEAN_DATA_REPORTING_TARGET_ACCOUNT_C" ;;
    }

    dimension: lean_data_ld_email_domains_c {
      type: string
      sql: ${TABLE}."LEAN_DATA_LD_EMAIL_DOMAINS_C" ;;
    }

    dimension_group: lean_data_reporting_last_sales_touch_date_c {
      type: time
      sql: ${TABLE}."LEAN_DATA_REPORTING_LAST_SALES_TOUCH_DATE_C" ;;
    }

    dimension: scheduling_beta_notes_c {
      type: string
      sql: ${TABLE}."SCHEDULING_BETA_NOTES_C" ;;
    }

    dimension: scheduling_beta_c {
      type: yesno
      sql: ${TABLE}."SCHEDULING_BETA_C" ;;
    }

    dimension: scheduling_beta_status_c {
      type: string
      sql: ${TABLE}."SCHEDULING_BETA_STATUS_C" ;;
    }

    dimension: pure_chat_guid_c {
      type: string
      sql: ${TABLE}."PURE_CHAT_GUID_C" ;;
    }

    dimension: pure_chat_logging_c {
      type: yesno
      sql: ${TABLE}."PURE_CHAT_LOGGING_C" ;;
    }

    dimension: pure_chat_user_c {
      type: yesno
      sql: ${TABLE}."PURE_CHAT_USER_C" ;;
    }

    dimension: should_this_partner_get_full_credit_c {
      type: yesno
      sql: ${TABLE}."SHOULD_THIS_PARTNER_GET_FULL_CREDIT_C" ;;
    }

    dimension: contract_date_c {
      type: date
      sql: ${TABLE}."CONTRACT_DATE_C" ;;
    }

    dimension: membership_discount_c {
      type: string
      sql: ${TABLE}."MEMBERSHIP_DISCOUNT_C" ;;
    }

    dimension: notes_c {
      type: string
      sql: ${TABLE}."NOTES_C" ;;
    }

    dimension: partner_payout_c {
      type: string
      sql: ${TABLE}."PARTNER_PAYOUT_C" ;;
    }

    dimension: landing_page_c {
      type: string
      sql: ${TABLE}."LANDING_PAGE_C" ;;
    }

    dimension: compensation_structure_c {
      type: string
      sql: ${TABLE}."COMPENSATION_STRUCTURE_C" ;;
    }

    dimension: social_c {
      type: yesno
      sql: ${TABLE}."SOCIAL_C" ;;
    }

    dimension: tier_c {
      type: string
      sql: ${TABLE}."TIER_C" ;;
    }

    dimension: compensation_amount_c {
      type: string
      sql: ${TABLE}."COMPENSATION_AMOUNT_C" ;;
    }

    dimension: audience_member_size_c {
      type: string
      sql: ${TABLE}."AUDIENCE_MEMBER_SIZE_C" ;;
    }

    dimension: most_recent_credit_memo_c {
      type: string
      sql: ${TABLE}."MOST_RECENT_CREDIT_MEMO_C" ;;
    }

    dimension_group: purechat_logging_date_c {
      type: time
      sql: ${TABLE}."PURECHAT_LOGGING_DATE_C" ;;
    }

    dimension: account_source {
      type: string
      sql: ${TABLE}."ACCOUNT_SOURCE" ;;
    }

    dimension: stage_of_research_c {
      type: string
      sql: ${TABLE}."STAGE_OF_RESEARCH_C" ;;
    }

    dimension: latest_survey_result_c {
      type: string
      sql: ${TABLE}."LATEST_SURVEY_RESULT_C" ;;
    }

    dimension_group: ringdna_100_last_email_attempt_c {
      type: time
      sql: ${TABLE}."RINGDNA_100_LAST_EMAIL_ATTEMPT_C" ;;
    }

    dimension_group: ringdna_100_first_inbound_call_c {
      type: time
      sql: ${TABLE}."RINGDNA_100_FIRST_INBOUND_CALL_C" ;;
    }

    dimension: ringdna_100_time_to_first_dial_minutes_c {
      type: number
      sql: ${TABLE}."RINGDNA_100_TIME_TO_FIRST_DIAL_MINUTES_C" ;;
    }

    dimension: ringdna_100_email_attempts_c {
      type: number
      sql: ${TABLE}."RINGDNA_100_EMAIL_ATTEMPTS_C" ;;
    }

    dimension: ringdna_100_response_type_c {
      type: string
      sql: ${TABLE}."RINGDNA_100_RESPONSE_TYPE_C" ;;
    }

    dimension_group: ringdna_100_first_outbound_call_c {
      type: time
      sql: ${TABLE}."RINGDNA_100_FIRST_OUTBOUND_CALL_C" ;;
    }

    dimension: ringdna_100_time_to_first_response_c {
      type: number
      sql: ${TABLE}."RINGDNA_100_TIME_TO_FIRST_RESPONSE_C" ;;
    }

    dimension_group: ringdna_100_last_outbound_call_c {
      type: time
      sql: ${TABLE}."RINGDNA_100_LAST_OUTBOUND_CALL_C" ;;
    }

    dimension: ringdna_100_ring_dna_context_c {
      type: yesno
      sql: ${TABLE}."RINGDNA_100_RING_DNA_CONTEXT_C" ;;
    }

    dimension_group: ringdna_100_last_inbound_call_c {
      type: time
      sql: ${TABLE}."RINGDNA_100_LAST_INBOUND_CALL_C" ;;
    }

    dimension: ringdna_100_call_attempts_c {
      type: number
      sql: ${TABLE}."RINGDNA_100_CALL_ATTEMPTS_C" ;;
    }

    dimension: account_number {
      type: string
      sql: ${TABLE}."ACCOUNT_NUMBER" ;;
    }

    dimension: chats_c {
      type: number
      sql: ${TABLE}."CHATS_C" ;;
    }

    dimension: site {
      type: string
      sql: ${TABLE}."SITE" ;;
    }

    dimension: ticker_symbol {
      type: string
      sql: ${TABLE}."TICKER_SYMBOL" ;;
    }

    dimension: partner_c {
      type: string
      sql: ${TABLE}."PARTNER_C" ;;
    }

    dimension: ownership {
      type: string
      sql: ${TABLE}."OWNERSHIP" ;;
    }

    dimension: pro_rate_first_charge_c {
      type: yesno
      sql: ${TABLE}."PRO_RATE_FIRST_CHARGE_C" ;;
    }

    dimension: jigsaw {
      type: string
      sql: ${TABLE}."JIGSAW" ;;
    }

    dimension: rating {
      type: string
      sql: ${TABLE}."RATING" ;;
    }

    dimension: sic {
      type: string
      sql: ${TABLE}."SIC" ;;
    }

    dimension: sic_desc {
      type: string
      sql: ${TABLE}."SIC_DESC" ;;
    }

    dimension: annual_revenue {
      type: number
      sql: ${TABLE}."ANNUAL_REVENUE" ;;
    }

    dimension: annual_fee_c {
      type: number
      sql: ${TABLE}."ANNUAL_FEE_C" ;;
    }

    dimension: chat_platform_c {
      type: string
      sql: ${TABLE}."CHAT_PLATFORM_C" ;;
    }

    dimension: chat_wrapper_product_type_c {
      type: string
      sql: ${TABLE}."CHAT_WRAPPER_PRODUCT_TYPE_C" ;;
    }

    dimension: chat_wrapper_logging_c {
      type: yesno
      sql: ${TABLE}."CHAT_WRAPPER_LOGGING_C" ;;
    }

    dimension_group: chat_wrapper_logging_date_c {
      type: time
      sql: ${TABLE}."CHAT_WRAPPER_LOGGING_DATE_C" ;;
    }

    dimension: tcs_last_accepted_id_c {
      type: string
      sql: ${TABLE}."TCS_LAST_ACCEPTED_ID_C" ;;
    }

    dimension_group: tcs_last_accepted_c {
      type: time
      sql: ${TABLE}."TCS_LAST_ACCEPTED_C" ;;
    }

    dimension: has_website_c {
      type: yesno
      sql: ${TABLE}."HAS_WEBSITE_C" ;;
    }

    dimension: assign_account_c {
      type: yesno
      sql: ${TABLE}."ASSIGN_ACCOUNT_C" ;;
    }

    dimension: recent_customer_data_c {
      type: string
      sql: ${TABLE}."RECENT_CUSTOMER_DATA_C" ;;
    }

    dimension_group: person_first_email_date_time {
      type: time
      sql: ${TABLE}."PERSON_FIRST_EMAIL_DATE_TIME" ;;
    }

    dimension_group: person_first_call_date_time {
      type: time
      sql: ${TABLE}."PERSON_FIRST_CALL_DATE_TIME" ;;
    }

    dimension: chat_bot_user_c {
      type: yesno
      sql: ${TABLE}."CHAT_BOT_USER_C" ;;
    }

    dimension: chatbot_eligible_c {
      type: string
      sql: ${TABLE}."CHATBOT_ELIGIBLE_C" ;;
    }

    dimension: may_return_c {
      type: yesno
      sql: ${TABLE}."MAY_RETURN_C" ;;
    }

    dimension: went_to_competitor_c {
      type: yesno
      sql: ${TABLE}."WENT_TO_COMPETITOR_C" ;;
    }

    dimension: anticipated_return_timeframe_c {
      type: string
      sql: ${TABLE}."ANTICIPATED_RETURN_TIMEFRAME_C" ;;
    }

    dimension: scheduling_url_c {
      type: string
      sql: ${TABLE}."SCHEDULING_URL_C" ;;
    }

    dimension: scheduling_approval_status_c {
      type: string
      sql: ${TABLE}."SCHEDULING_APPROVAL_STATUS_C" ;;
    }

    dimension_group: scheduling_approval_date_c {
      type: time
      sql: ${TABLE}."SCHEDULING_APPROVAL_DATE_C" ;;
    }

    dimension_group: scheduling_start_date_c {
      type: time
      sql: ${TABLE}."SCHEDULING_START_DATE_C" ;;
    }

    dimension: scheduling_status_c {
      type: string
      sql: ${TABLE}."SCHEDULING_STATUS_C" ;;
    }

    dimension_group: scheduling_cancel_date_c {
      type: time
      sql: ${TABLE}."SCHEDULING_CANCEL_DATE_C" ;;
    }

    dimension: time_zone_adjustability_c {
      type: string
      sql: ${TABLE}."TIME_ZONE_ADJUSTABILITY_C" ;;
    }

    dimension: loads_appointment_type_c {
      type: yesno
      sql: ${TABLE}."LOADS_APPOINTMENT_TYPE_C" ;;
    }

    dimension: ssi_collection_c {
      type: string
      sql: ${TABLE}."SSI_COLLECTION_C" ;;
    }

    dimension: calendly_c {
      type: yesno
      sql: ${TABLE}."CALENDLY_C" ;;
    }

    dimension: required_fields_c {
      type: string
      sql: ${TABLE}."REQUIRED_FIELDS_C" ;;
    }

    dimension: captcha_complex_verification_c {
      type: string
      sql: ${TABLE}."CAPTCHA_COMPLEX_VERIFICATION_C" ;;
    }

    dimension: scheduling_platform_name_c {
      type: string
      sql: ${TABLE}."SCHEDULING_PLATFORM_NAME_C" ;;
    }

    dimension: terms_and_conditions_c {
      type: string
      sql: ${TABLE}."TERMS_AND_CONDITIONS_C" ;;
    }

    dimension: blockers_c {
      type: string
      sql: ${TABLE}."BLOCKERS_C" ;;
    }

    dimension: appointment_types_c {
      type: string
      sql: ${TABLE}."APPOINTMENT_TYPES_C" ;;
    }

    dimension: assign_account_win_back_c {
      type: yesno
      sql: ${TABLE}."ASSIGN_ACCOUNT_WIN_BACK_C" ;;
    }

    dimension: assign_account_cross_sell_c {
      type: yesno
      sql: ${TABLE}."ASSIGN_ACCOUNT_CROSS_SELL_C" ;;
    }

    dimension: chatbot_user_activation_date_c {
      type: date
      sql: ${TABLE}."CHATBOT_USER_ACTIVATION_DATE_C" ;;
    }

    dimension: rac_c {
      type: yesno
      sql: ${TABLE}."RAC_C" ;;
    }

    dimension: partner_phone_number_c {
      type: string
      sql: ${TABLE}."PARTNER_PHONE_NUMBER_C" ;;
    }

    dimension: activation_did_c {
      type: string
      sql: ${TABLE}."ACTIVATION_DID_C" ;;
    }

    dimension: which_competitor_c {
      type: string
      sql: ${TABLE}."WHICH_COMPETITOR_C" ;;
    }

    dimension: rac_reason_notes_c {
      type: string
      sql: ${TABLE}."RAC_REASON_NOTES_C" ;;
    }

    dimension: rac_owner_c {
      type: string
      sql: ${TABLE}."RAC_OWNER_C" ;;
    }

    dimension: rac_removed_reason_c {
      type: string
      sql: ${TABLE}."RAC_REMOVED_REASON_C" ;;
    }

    dimension: porting_interest_c {
      type: yesno
      sql: ${TABLE}."PORTING_INTEREST_C" ;;
    }

    dimension: did_the_partner_bring_us_the_lead_c {
      type: string
      sql: ${TABLE}."DID_THE_PARTNER_BRING_US_THE_LEAD_C" ;;
    }

    dimension: onb_did_1_name_c {
      type: string
      sql: ${TABLE}."ONB_DID_1_NAME_C" ;;
    }

    dimension: onb_did_2_name_c {
      type: string
      sql: ${TABLE}."ONB_DID_2_NAME_C" ;;
    }

    dimension: onb_did_3_name_c {
      type: string
      sql: ${TABLE}."ONB_DID_3_NAME_C" ;;
    }

    dimension: onb_did_3_c {
      type: string
      sql: ${TABLE}."ONB_DID_3_C" ;;
    }

    dimension: onb_did_2_c {
      type: string
      sql: ${TABLE}."ONB_DID_2_C" ;;
    }

    dimension: onb_did_1_c {
      type: string
      sql: ${TABLE}."ONB_DID_1_C" ;;
    }

    dimension: partnership_discount_d_c {
      type: string
      sql: ${TABLE}."PARTNERSHIP_DISCOUNT_D_C" ;;
    }

    dimension: partnership_discount_p_c {
      type: string
      sql: ${TABLE}."PARTNERSHIP_DISCOUNT_P_C" ;;
    }

    dimension: soteria_class_member_c {
      type: yesno
      sql: ${TABLE}."SOTERIA_CLASS_MEMBER_C" ;;
    }

    dimension: do_not_sell_chat_c {
      type: yesno
      sql: ${TABLE}."DO_NOT_SELL_CHAT_C" ;;
    }

    dimension: rac_recent_date_c {
      type: date
      sql: ${TABLE}."RAC_RECENT_DATE_C" ;;
    }

    dimension: rac_status_c {
      type: string
      sql: ${TABLE}."RAC_STATUS_C" ;;
    }

    dimension: rac_removed_date_c {
      type: date
      sql: ${TABLE}."RAC_REMOVED_DATE_C" ;;
    }

    dimension: service_product_type_c {
      type: string
      sql: ${TABLE}."SERVICE_PRODUCT_TYPE_C" ;;
    }

    dimension: hubspot_account_id_c {
      type: number
      sql: ${TABLE}."HUBSPOT_ACCOUNT_ID_C" ;;
    }

    dimension: chat_programming_complete_c {
      type: date
      sql: ${TABLE}."CHAT_PROGRAMMING_COMPLETE_C" ;;
    }

    dimension: rs_programming_complete_c {
      type: date
      sql: ${TABLE}."RS_PROGRAMMING_COMPLETE_C" ;;
    }

    dimension: reception_c {
      type: yesno
      sql: ${TABLE}."RECEPTION_C" ;;
    }

    dimension: chat_c {
      type: yesno
      sql: ${TABLE}."CHAT_C" ;;
    }

    dimension: onb_did_9_c {
      type: string
      sql: ${TABLE}."ONB_DID_9_C" ;;
    }

    dimension: onb_did_8_c {
      type: string
      sql: ${TABLE}."ONB_DID_8_C" ;;
    }

    dimension: onb_did_10_name_c {
      type: string
      sql: ${TABLE}."ONB_DID_10_NAME_C" ;;
    }

    dimension: onb_did_4_name_c {
      type: string
      sql: ${TABLE}."ONB_DID_4_NAME_C" ;;
    }

    dimension: onb_did_6_name_c {
      type: string
      sql: ${TABLE}."ONB_DID_6_NAME_C" ;;
    }

    dimension: onb_did_10_c {
      type: string
      sql: ${TABLE}."ONB_DID_10_C" ;;
    }

    dimension: onb_did_5_name_c {
      type: string
      sql: ${TABLE}."ONB_DID_5_NAME_C" ;;
    }

    dimension: onb_did_8_name_c {
      type: string
      sql: ${TABLE}."ONB_DID_8_NAME_C" ;;
    }

    dimension: onb_did_9_name_c {
      type: string
      sql: ${TABLE}."ONB_DID_9_NAME_C" ;;
    }

    dimension: onb_did_7_name_c {
      type: string
      sql: ${TABLE}."ONB_DID_7_NAME_C" ;;
    }

    dimension: onb_did_7_c {
      type: string
      sql: ${TABLE}."ONB_DID_7_C" ;;
    }

    dimension: onb_did_6_c {
      type: string
      sql: ${TABLE}."ONB_DID_6_C" ;;
    }

    dimension: onb_did_5_c {
      type: string
      sql: ${TABLE}."ONB_DID_5_C" ;;
    }

    dimension: onb_did_4_c {
      type: string
      sql: ${TABLE}."ONB_DID_4_C" ;;
    }

    dimension: soteria_voucher_c {
      type: string
      sql: ${TABLE}."SOTERIA_VOUCHER_C" ;;
    }

    dimension: more_than_10_did_enter_in_prl_only_c {
      type: yesno
      sql: ${TABLE}."MORE_THAN_10_DID_ENTER_IN_PRL_ONLY_C" ;;
    }

    dimension: tempfor_voucher_testing_c {
      type: yesno
      sql: ${TABLE}."TEMPFOR_VOUCHER_TESTING_C" ;;
    }

    dimension: csm_task_trigger_from_hubspot_c {
      type: string
      sql: ${TABLE}."CSM_TASK_TRIGGER_FROM_HUBSPOT_C" ;;
    }

    dimension: write_off_voucher_c {
      type: number
      sql: ${TABLE}."WRITE_OFF_VOUCHER_C" ;;
    }

    dimension: marketing_consent_last_accepted_c {
      type: date
      sql: ${TABLE}."MARKETING_CONSENT_LAST_ACCEPTED_C" ;;
    }

    dimension: most_recent_churn_risk_date_c {
      type: date
      sql: ${TABLE}."MOST_RECENT_CHURN_RISK_DATE_C" ;;
    }

    dimension_group: customer_data_last_updated_c {
      type: time
      sql: ${TABLE}."CUSTOMER_DATA_LAST_UPDATED_C" ;;
    }

    dimension: ringdna_has_opted_out_of_sms_2_c {
      type: yesno
      sql: ${TABLE}."RINGDNA_HAS_OPTED_OUT_OF_SMS_2_C" ;;
    }

    dimension: type_of_franchise_c {
      type: string
      sql: ${TABLE}."TYPE_OF_FRANCHISE_C" ;;
    }

    dimension: total_marketing_spend_c {
      type: number
      sql: ${TABLE}."TOTAL_MARKETING_SPEND_C" ;;
    }

    dimension: partner_short_code_c {
      type: string
      sql: ${TABLE}."PARTNER_SHORT_CODE_C" ;;
    }

    dimension: gatekeeper_contract_link_c {
      type: string
      sql: ${TABLE}."GATEKEEPER_CONTRACT_LINK_C" ;;
    }

    dimension: total_agents_c {
      type: number
      sql: ${TABLE}."TOTAL_AGENTS_C" ;;
    }

    dimension: total_returning_customers_c {
      type: number
      sql: ${TABLE}."TOTAL_RETURNING_CUSTOMERS_C" ;;
    }

    dimension: integration_type_c {
      type: string
      sql: ${TABLE}."INTEGRATION_TYPE_C" ;;
    }

    dimension: selling_restrictions_c {
      type: string
      sql: ${TABLE}."SELLING_RESTRICTIONS_C" ;;
    }

    dimension: ruby_url_c {
      type: string
      sql: ${TABLE}."RUBY_URL_C" ;;
    }

    dimension: invoice_arangement_c {
      type: string
      sql: ${TABLE}."INVOICE_ARANGEMENT_C" ;;
    }

    dimension: ytd_commission_paid_out_c {
      type: number
      sql: ${TABLE}."YTD_COMMISSION_PAID_OUT_C" ;;
    }

    dimension: active_agents_c {
      type: number
      sql: ${TABLE}."ACTIVE_AGENTS_C" ;;
    }

    dimension: partner_status_c {
      type: string
      sql: ${TABLE}."PARTNER_STATUS_C" ;;
    }

    dimension: current_plan_options_c {
      type: string
      sql: ${TABLE}."CURRENT_PLAN_OPTIONS_C" ;;
    }

    dimension: integration_status_c {
      type: string
      sql: ${TABLE}."INTEGRATION_STATUS_C" ;;
    }

    dimension: number_of_customers_active_c {
      type: number
      sql: ${TABLE}."NUMBER_OF_CUSTOMERS_ACTIVE_C" ;;
    }

    dimension: integration_description_c {
      type: string
      sql: ${TABLE}."INTEGRATION_DESCRIPTION_C" ;;
    }

    dimension: number_of_customers_all_time_c {
      type: number
      sql: ${TABLE}."NUMBER_OF_CUSTOMERS_ALL_TIME_C" ;;
    }

    dimension: parent_child_relationship_c {
      type: string
      sql: ${TABLE}."PARENT_CHILD_RELATIONSHIP_C" ;;
    }

    dimension: total_monthly_revenue_c {
      type: number
      sql: ${TABLE}."TOTAL_MONTHLY_REVENUE_C" ;;
    }

    dimension: external_listing_url_c {
      type: string
      sql: ${TABLE}."EXTERNAL_LISTING_URL_C" ;;
    }

    dimension: payout_information_c {
      type: string
      sql: ${TABLE}."PAYOUT_INFORMATION_C" ;;
    }

    dimension: partner_account_c {
      type: string
      sql: ${TABLE}."PARTNER_ACCOUNT_C" ;;
    }

    dimension: account_source_secondary_detail_c {
      type: string
      sql: ${TABLE}."ACCOUNT_SOURCE_SECONDARY_DETAIL_C" ;;
    }

    dimension: account_source_detail_c {
      type: string
      sql: ${TABLE}."ACCOUNT_SOURCE_DETAIL_C" ;;
    }

    dimension: ytd_2021_lead_c {
      type: number
      sql: ${TABLE}."YTD_2021_LEAD_C" ;;
    }

    dimension: ytd_2021_solicitor_c {
      type: number
      sql: ${TABLE}."YTD_2021_SOLICITOR_C" ;;
    }

    dimension: ytd_2021_commission_paid_out_c {
      type: number
      sql: ${TABLE}."YTD_2021_COMMISSION_PAID_OUT_C" ;;
    }

    dimension: x_2021_ytd_current_client_c {
      type: number
      sql: ${TABLE}."X_2021_YTD_CURRENT_CLIENT_C" ;;
    }

    dimension: ytd_2021_robocall_c {
      type: number
      sql: ${TABLE}."YTD_2021_ROBOCALL_C" ;;
    }

    dimension: chat_capabilities_c {
      type: string
      sql: ${TABLE}."CHAT_CAPABILITIES_C" ;;
    }

    dimension: competitor_c {
      type: string
      sql: ${TABLE}."COMPETITOR_C" ;;
    }

    dimension: frequent_flyer_c {
      type: yesno
      sql: ${TABLE}."FREQUENT_FLYER_C" ;;
    }

    dimension: retainer_amount_notes_c {
      type: string
      sql: ${TABLE}."RETAINER_AMOUNT_NOTES_C" ;;
    }

    dimension: x_50_a_month_notes_c {
      type: string
      sql: ${TABLE}."X_50_A_MONTH_NOTES_C" ;;
    }

    dimension: x_50_month_retainer_for_service_c {
      type: string
      sql: ${TABLE}."X_50_MONTH_RETAINER_FOR_SERVICE_C" ;;
    }

    dimension: when_would_you_expect_to_come_back_next_c {
      type: date
      sql: ${TABLE}."WHEN_WOULD_YOU_EXPECT_TO_COME_BACK_NEXT_C" ;;
    }

    dimension: ruby_access_notes_c {
      type: string
      sql: ${TABLE}."RUBY_ACCESS_NOTES_C" ;;
    }

    dimension: willing_to_pay_to_retain_ruby_c {
      type: number
      sql: ${TABLE}."WILLING_TO_PAY_TO_RETAIN_RUBY_C" ;;
    }

    dimension: access_to_ruby_s_services_c {
      type: string
      sql: ${TABLE}."ACCESS_TO_RUBY_S_SERVICES_C" ;;
    }

    dimension: how_long_do_you_need_ruby_services_c {
      type: number
      sql: ${TABLE}."HOW_LONG_DO_YOU_NEED_RUBY_SERVICES_C" ;;
    }

    dimension: what_prompted_you_to_restart_your_ruby_s_c {
      type: string
      sql: ${TABLE}."WHAT_PROMPTED_YOU_TO_RESTART_YOUR_RUBY_S_C" ;;
    }

    dimension: partner_discount_c {
      type: number
      sql: ${TABLE}."PARTNER_DISCOUNT_C" ;;
    }

    dimension: other_stakeholders_to_be_aware_of_c {
      type: string
      sql: ${TABLE}."OTHER_STAKEHOLDERS_TO_BE_AWARE_OF_C" ;;
    }

    dimension: what_are_your_goals_and_initiatives_c {
      type: string
      sql: ${TABLE}."WHAT_ARE_YOUR_GOALS_AND_INITIATIVES_C" ;;
    }

    dimension: questions_concerns_c {
      type: string
      sql: ${TABLE}."QUESTIONS_CONCERNS_C" ;;
    }

    dimension: what_will_success_look_like_for_you_c {
      type: string
      sql: ${TABLE}."WHAT_WILL_SUCCESS_LOOK_LIKE_FOR_YOU_C" ;;
    }

    dimension: account_manager_c {
      type: string
      sql: ${TABLE}."ACCOUNT_MANAGER_C" ;;
    }

    dimension: audience_member_size_del_c {
      type: string
      sql: ${TABLE}."AUDIENCE_MEMBER_SIZE_DEL_C" ;;
    }

    dimension: desired_app_force_functionality_c {
      type: string
      sql: ${TABLE}."DESIRED_APP_FORCE_FUNCTIONALITY_C" ;;
    }

    dimension: desired_integration_other_c {
      type: string
      sql: ${TABLE}."DESIRED_INTEGRATION_OTHER_C" ;;
    }

    dimension: may_return_2021_c {
      type: string
      sql: ${TABLE}."MAY_RETURN_2021_C" ;;
    }

    dimension: desired_integration_c {
      type: string
      sql: ${TABLE}."DESIRED_INTEGRATION_C" ;;
    }

    dimension: went_to_competitor_v_2_c {
      type: string
      sql: ${TABLE}."WENT_TO_COMPETITOR_V_2_C" ;;
    }

    dimension: competitor_other_c {
      type: string
      sql: ${TABLE}."COMPETITOR_OTHER_C" ;;
    }

    dimension: which_competitor_v_2_c {
      type: string
      sql: ${TABLE}."WHICH_COMPETITOR_V_2_C" ;;
    }

    dimension: service_issues_c {
      type: string
      sql: ${TABLE}."SERVICE_ISSUES_C" ;;
    }

    dimension: service_issues_other_c {
      type: string
      sql: ${TABLE}."SERVICE_ISSUES_OTHER_C" ;;
    }

    dimension: app_force_functionality_other_c {
      type: string
      sql: ${TABLE}."APP_FORCE_FUNCTIONALITY_OTHER_C" ;;
    }

    dimension: anticipated_return_c {
      type: date
      sql: ${TABLE}."ANTICIPATED_RETURN_C" ;;
    }

    dimension: ps_partner_key_c {
      type: string
      sql: ${TABLE}."PS_PARTNER_KEY_C" ;;
    }

    dimension: ps_how_heard_c {
      type: string
      sql: ${TABLE}."PS_HOW_HEARD_C" ;;
    }

    dimension: ps_audience_size_c {
      type: string
      sql: ${TABLE}."PS_AUDIENCE_SIZE_C" ;;
    }

    dimension: ps_audience_location_c {
      type: string
      sql: ${TABLE}."PS_AUDIENCE_LOCATION_C" ;;
    }

    dimension: ps_ruby_customer_c {
      type: string
      sql: ${TABLE}."PS_RUBY_CUSTOMER_C" ;;
    }

    dimension: ok_to_give_out_address_c {
      type: yesno
      sql: ${TABLE}."OK_TO_GIVE_OUT_ADDRESS_C" ;;
    }

    dimension: view_prl_account_guid_c {
      type: string
      sql: ${TABLE}."VIEW_PRL_ACCOUNT_GUID_C" ;;
    }

    dimension: prl_api_callout_response_c {
      type: string
      sql: ${TABLE}."PRL_API_CALLOUT_RESPONSE_C" ;;
    }

    dimension: prl_account_create_json_c {
      type: string
      sql: ${TABLE}."PRL_ACCOUNT_CREATE_JSON_C" ;;
    }

    dimension: additional_phone_c {
      type: string
      sql: ${TABLE}."ADDITIONAL_PHONE_C" ;;
    }

    dimension: prl_callout_status_code_c {
      type: number
      sql: ${TABLE}."PRL_CALLOUT_STATUS_CODE_C" ;;
    }

    dimension: fax {
      type: string
      sql: ${TABLE}."FAX" ;;
    }

    dimension: most_recent_product_cancelled_c {
      type: string
      sql: ${TABLE}."MOST_RECENT_PRODUCT_CANCELLED_C" ;;
    }

    dimension: do_not_market_c {
      type: string
      sql: ${TABLE}."DO_NOT_MARKET_C" ;;
    }

    dimension: zuora_payment_failure_c {
      type: yesno
      sql: ${TABLE}."ZUORA_PAYMENT_FAILURE_C" ;;
    }

    dimension: outage_credit_c {
      type: number
      sql: ${TABLE}."OUTAGE_CREDIT_C" ;;
    }

    dimension: ringdna_slaserial_number_c {
      type: string
      sql: ${TABLE}."RINGDNA_SLASERIAL_NUMBER_C" ;;
    }

    dimension: ringdna_active_c {
      type: string
      sql: ${TABLE}."RINGDNA_ACTIVE_C" ;;
    }

    dimension: ringdna_sla_c {
      type: string
      sql: ${TABLE}."RINGDNA_SLA_C" ;;
    }

    dimension: ringdna_upsell_opportunity_c {
      type: string
      sql: ${TABLE}."RINGDNA_UPSELL_OPPORTUNITY_C" ;;
    }

    dimension: ringdna_slaexpiration_date_c {
      type: date
      sql: ${TABLE}."RINGDNA_SLAEXPIRATION_DATE_C" ;;
    }

    dimension: ringdna_customer_priority_c {
      type: string
      sql: ${TABLE}."RINGDNA_CUSTOMER_PRIORITY_C" ;;
    }

    dimension: ringdna_numberof_locations_c {
      type: number
      sql: ${TABLE}."RINGDNA_NUMBEROF_LOCATIONS_C" ;;
    }

    dimension: salesforce_to_hubspot_triggers_c {
      type: string
      sql: ${TABLE}."SALESFORCE_TO_HUBSPOT_TRIGGERS_C" ;;
    }

    dimension: prl_account_create_retry_op_c {
      type: string
      sql: ${TABLE}."PRL_ACCOUNT_CREATE_RETRY_OP_C" ;;
    }

    set: detail {
      fields: [
        id,
        is_deleted,
        master_record_id,
        name,
        type,
        record_type_id,
        parent_id,
        billing_street,
        billing_city,
        billing_state,
        billing_postal_code,
        billing_country,
        billing_latitude,
        billing_longitude,
        billing_geocode_accuracy,
        shipping_street,
        shipping_city,
        shipping_state,
        shipping_postal_code,
        shipping_country,
        shipping_latitude,
        shipping_longitude,
        shipping_geocode_accuracy,
        phone,
        website,
        photo_url,
        industry,
        number_of_employees,
        description,
        owner_id,
        created_date_time,
        created_by_id,
        last_modified_date_time,
        last_modified_by_id,
        system_modstamp_time,
        last_activity_date,
        last_viewed_date_time,
        last_referenced_date_time,
        jigsaw_company_id,
        ais_id_c,
        plan_owner_c,
        plan_owner_id_c,
        marketing_phone_c,
        pharmacy_benefit_manager_c,
        specialty_pharmacy_c,
        geo_service_area_c,
        aliases_c,
        provider_sponsored_c,
        blues_c,
        public_exchanges_c,
        coop_c,
        medicare_only_c,
        medicaid_only_c,
        commercial_only_c,
        total_medical_c,
        total_fully_funded_c,
        commercial_risk_c,
        total_group_risk_c,
        large_group_risk_c,
        small_group_risk_c,
        individual_non_group_c,
        medicare_supplement_c,
        public_sector_risk_c,
        total_medicare_advantage_c,
        medicare_ccp_c,
        medicare_cost_c,
        medicare_pffs_c,
        pace_program_c,
        dual_eligibles_c,
        medicaid_hmo_risk_c,
        medicaid_ffs_risk_c,
        schip_c,
        other_unspecified_risk_c,
        total_self_funded_c,
        other_c,
        fehbp_c,
        medicare_part_d_c,
        aco_id_c,
        aco_launch_date_c,
        health_plan_affiliates_sponsors_c,
        provider_affiliates_sponsors_c,
        sector_c,
        aco_type_c,
        owner_id_c,
        subsidiary_name_c,
        subsidiary_city_c,
        subsidiary_state_c,
        legal_entity_name_c,
        marketing_name_c,
        plan_design_c,
        contract_renewal_date_c,
        discount_type_c,
        discount_percentage_c,
        discount_amount_c,
        partner_since_c,
        promo_code_c,
        feature_request_c,
        partner_type_c,
        did_c,
        most_recent_olsa_submit_c,
        time_zone_c,
        prl_customer_id_c,
        contact_c,
        cancel_date_c,
        end_date_c,
        prl_id_c,
        prl_company_id_c,
        prl_customer_guid_c,
        prl_company_guid_c,
        cancel_note_c,
        reach_c,
        status_c,
        partner_won_date_c,
        olsa_started_c_time,
        of_employees_c,
        of_employees_range_c,
        business_need_c,
        business_need_score_c,
        business_size_c,
        business_size_score_c,
        call_volume_c,
        call_volume_score_c,
        cancel_reason_c,
        customer_activation_date_c,
        customer_status_c,
        main_company_phone_number_c,
        original_close_date_c_time,
        original_lead_source_c,
        original_lead_source_detail_c,
        partnership_c,
        primary_industry_c,
        revenue_c,
        revenue_range_c,
        sales_sharepoint_created_date_c,
        progress_c,
        sic_code_c,
        sic_description_c,
        timeline_c,
        timeline_score_c,
        duns_c,
        progress_notes_c,
        lead_source_c,
        lead_source_detail_c,
        churn_risk_c,
        how_heard_c,
        how_heard_detail_c,
        budget_c,
        authority_c,
        test_account_c,
        agent_id_c,
        pc_customer_id_c,
        sales_c,
        customer_success_manager_c,
        onboarding_c,
        chat_brand_c,
        pc_acct_number_c,
        child_cancel_reason_c,
        no_sales_c,
        current_plan_start_prl_c,
        current_plan_description_prl_c,
        current_plan_detail_id_prl_c,
        current_plan_minutes_prl_c,
        last_payment_amt_prl_c,
        last_payment_date_prl_c,
        pc_chat_brand_c,
        pc_account_id_number_c,
        account_executive_c,
        account_name_ex_id_c,
        actual_monthly_recurring_revenue_c,
        address_2_c,
        auto_pay_off_reason_c,
        billing_contact_c,
        billing_day_c,
        chat_performance_report_email_1_c,
        chat_performance_report_email_2_c,
        facebook_project_c,
        first_charge_date_c,
        google_project_c,
        next_steps_date_c,
        next_steps_c,
        pc_auto_pay_off_c,
        partnership_discount_c,
        product_type_c,
        send_getting_started_video_c,
        stripe_customer_token_c,
        website_project_c,
        stripe_card_token_c,
        pc_region_c,
        first_invoice_created_c,
        web_project_legacy_acct_c,
        zuora_active_c,
        zuora_customer_priority_c,
        zuora_numberof_locations_c,
        zuora_slaexpiration_date_c,
        zuora_slaserial_number_c,
        zuora_sla_c,
        zuora_upsell_opportunity_c,
        pco_id_c,
        partnership_percent_c,
        chat_onboarding_owner_c,
        chat_csm_c,
        co_r_date_c_time,
        co_r_duration_c,
        mql_date_c_time,
        mql_duration_c,
        new_lead_date_c_time,
        new_lead_duration_c,
        original_active_c,
        original_converted_c,
        original_passive_c,
        sql_date_c_time,
        grasshopper_customer_c,
        grasshopper_data_c,
        cloudingo_agent_bar_c,
        cloudingo_agent_bas_c,
        cloudingo_agent_bav_c,
        cloudingo_agent_brdi_c,
        cloudingo_agent_btz_c,
        cloudingo_agent_sar_c,
        cloudingo_agent_sas_c,
        cloudingo_agent_sav_c,
        cloudingo_agent_srdi_c,
        cloudingo_agent_stz_c,
        most_recent_activation_c,
        not_the_right_fit_c,
        database_source_c,
        grass_hopper_billing_anniversary_c,
        gh_cohort_c,
        cohort_date_c,
        first_date_c,
        gclid_c,
        last_campaign_c,
        last_date_c,
        last_touch_c,
        utm_campaign_c,
        utm_content_c,
        utm_medium_c,
        utm_term_c,
        utm_vertical_c,
        initial_contact_c,
        _fivetran_synced_time,
        industry_c,
        hipaa_c,
        sub_industry_c,
        pendo_csm_2_c,
        robocall_feature_c,
        last_mobile_app_login_c,
        of_add_lines_c,
        x_24_7_feature_c,
        ported_feature_c,
        ruby_assist_c,
        outbound_texts_c,
        last_force_login_c,
        csm_referer_c,
        csm_name_lookup_pendo_c,
        is_live_chat_customer_c,
        activity_metric_id,
        referrer_sfdc_account_id_c,
        referring_email_c,
        referring_name_c,
        covid_19_c,
        lean_data_reporting_total_marketing_touches_c,
        lean_data_reporting_total_leads_and_contacts_c,
        lean_data_reporting_has_opportunity_c,
        lean_data_search_c,
        lean_data_reporting_last_marketing_touch_date_c_time,
        lean_data_reporting_customer_c,
        lean_data_routing_action_c,
        lean_data_reporting_total_sales_touches_c,
        lean_data_reporting_recent_marketing_touches_c,
        lean_data_reporting_target_account_c,
        lean_data_ld_email_domains_c,
        lean_data_reporting_last_sales_touch_date_c_time,
        scheduling_beta_notes_c,
        scheduling_beta_c,
        scheduling_beta_status_c,
        pure_chat_guid_c,
        pure_chat_logging_c,
        pure_chat_user_c,
        should_this_partner_get_full_credit_c,
        contract_date_c,
        membership_discount_c,
        notes_c,
        partner_payout_c,
        landing_page_c,
        compensation_structure_c,
        social_c,
        tier_c,
        compensation_amount_c,
        audience_member_size_c,
        most_recent_credit_memo_c,
        purechat_logging_date_c_time,
        account_source,
        stage_of_research_c,
        latest_survey_result_c,
        ringdna_100_last_email_attempt_c_time,
        ringdna_100_first_inbound_call_c_time,
        ringdna_100_time_to_first_dial_minutes_c,
        ringdna_100_email_attempts_c,
        ringdna_100_response_type_c,
        ringdna_100_first_outbound_call_c_time,
        ringdna_100_time_to_first_response_c,
        ringdna_100_last_outbound_call_c_time,
        ringdna_100_ring_dna_context_c,
        ringdna_100_last_inbound_call_c_time,
        ringdna_100_call_attempts_c,
        account_number,
        chats_c,
        site,
        ticker_symbol,
        partner_c,
        ownership,
        pro_rate_first_charge_c,
        jigsaw,
        rating,
        sic,
        sic_desc,
        annual_revenue,
        annual_fee_c,
        chat_platform_c,
        chat_wrapper_product_type_c,
        chat_wrapper_logging_c,
        chat_wrapper_logging_date_c_time,
        tcs_last_accepted_id_c,
        tcs_last_accepted_c_time,
        has_website_c,
        assign_account_c,
        recent_customer_data_c,
        person_first_email_date_time_time,
        person_first_call_date_time_time,
        chat_bot_user_c,
        chatbot_eligible_c,
        may_return_c,
        went_to_competitor_c,
        anticipated_return_timeframe_c,
        scheduling_url_c,
        scheduling_approval_status_c,
        scheduling_approval_date_c_time,
        scheduling_start_date_c_time,
        scheduling_status_c,
        scheduling_cancel_date_c_time,
        time_zone_adjustability_c,
        loads_appointment_type_c,
        ssi_collection_c,
        calendly_c,
        required_fields_c,
        captcha_complex_verification_c,
        scheduling_platform_name_c,
        terms_and_conditions_c,
        blockers_c,
        appointment_types_c,
        assign_account_win_back_c,
        assign_account_cross_sell_c,
        chatbot_user_activation_date_c,
        rac_c,
        partner_phone_number_c,
        activation_did_c,
        which_competitor_c,
        rac_reason_notes_c,
        rac_owner_c,
        rac_removed_reason_c,
        porting_interest_c,
        did_the_partner_bring_us_the_lead_c,
        onb_did_1_name_c,
        onb_did_2_name_c,
        onb_did_3_name_c,
        onb_did_3_c,
        onb_did_2_c,
        onb_did_1_c,
        partnership_discount_d_c,
        partnership_discount_p_c,
        soteria_class_member_c,
        do_not_sell_chat_c,
        rac_recent_date_c,
        rac_status_c,
        rac_removed_date_c,
        service_product_type_c,
        hubspot_account_id_c,
        chat_programming_complete_c,
        rs_programming_complete_c,
        reception_c,
        chat_c,
        onb_did_9_c,
        onb_did_8_c,
        onb_did_10_name_c,
        onb_did_4_name_c,
        onb_did_6_name_c,
        onb_did_10_c,
        onb_did_5_name_c,
        onb_did_8_name_c,
        onb_did_9_name_c,
        onb_did_7_name_c,
        onb_did_7_c,
        onb_did_6_c,
        onb_did_5_c,
        onb_did_4_c,
        soteria_voucher_c,
        more_than_10_did_enter_in_prl_only_c,
        tempfor_voucher_testing_c,
        csm_task_trigger_from_hubspot_c,
        write_off_voucher_c,
        marketing_consent_last_accepted_c,
        most_recent_churn_risk_date_c,
        customer_data_last_updated_c_time,
        ringdna_has_opted_out_of_sms_2_c,
        type_of_franchise_c,
        total_marketing_spend_c,
        partner_short_code_c,
        gatekeeper_contract_link_c,
        total_agents_c,
        total_returning_customers_c,
        integration_type_c,
        selling_restrictions_c,
        ruby_url_c,
        invoice_arangement_c,
        ytd_commission_paid_out_c,
        active_agents_c,
        partner_status_c,
        current_plan_options_c,
        integration_status_c,
        number_of_customers_active_c,
        integration_description_c,
        number_of_customers_all_time_c,
        parent_child_relationship_c,
        total_monthly_revenue_c,
        external_listing_url_c,
        payout_information_c,
        partner_account_c,
        account_source_secondary_detail_c,
        account_source_detail_c,
        ytd_2021_lead_c,
        ytd_2021_solicitor_c,
        ytd_2021_commission_paid_out_c,
        x_2021_ytd_current_client_c,
        ytd_2021_robocall_c,
        chat_capabilities_c,
        competitor_c,
        frequent_flyer_c,
        retainer_amount_notes_c,
        x_50_a_month_notes_c,
        x_50_month_retainer_for_service_c,
        when_would_you_expect_to_come_back_next_c,
        ruby_access_notes_c,
        willing_to_pay_to_retain_ruby_c,
        access_to_ruby_s_services_c,
        how_long_do_you_need_ruby_services_c,
        what_prompted_you_to_restart_your_ruby_s_c,
        partner_discount_c,
        other_stakeholders_to_be_aware_of_c,
        what_are_your_goals_and_initiatives_c,
        questions_concerns_c,
        what_will_success_look_like_for_you_c,
        account_manager_c,
        audience_member_size_del_c,
        desired_app_force_functionality_c,
        desired_integration_other_c,
        may_return_2021_c,
        desired_integration_c,
        went_to_competitor_v_2_c,
        competitor_other_c,
        which_competitor_v_2_c,
        service_issues_c,
        service_issues_other_c,
        app_force_functionality_other_c,
        anticipated_return_c,
        ps_partner_key_c,
        ps_how_heard_c,
        ps_audience_size_c,
        ps_audience_location_c,
        ps_ruby_customer_c,
        ok_to_give_out_address_c,
        view_prl_account_guid_c,
        prl_api_callout_response_c,
        prl_account_create_json_c,
        additional_phone_c,
        prl_callout_status_code_c,
        fax,
        most_recent_product_cancelled_c,
        do_not_market_c,
        zuora_payment_failure_c,
        outage_credit_c,
        ringdna_slaserial_number_c,
        ringdna_active_c,
        ringdna_sla_c,
        ringdna_upsell_opportunity_c,
        ringdna_slaexpiration_date_c,
        ringdna_customer_priority_c,
        ringdna_numberof_locations_c,
        salesforce_to_hubspot_triggers_c,
        prl_account_create_retry_op_c
      ]
    }
  }
