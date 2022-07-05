view: customer_mrr_details {
    derived_table: {
      sql: SELECT
               R.CRM_ID
              ,R."Name"
              ,R."Cohort"
              ,R."Industry"
              ,R."Date"
              ,R."Upsell"
              ,R."Churn"
              ,R."SalesCredit"
              ,R."RetentionCredit"
              ,R."SalesRep"
              ,R.CSM
              ,R."TotalBookings"
              ,R."NewBookings"
              ,R."ReturnBookings"
              ,R."Downsell"
              ,R.ACCOUNT_MANAGER
              ,'Receptionist' AS MRR_Product
              FROM RUBY.MASTERDATA."MRR_Detail_RS" R
              WHERE CAST(R."Date" AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',  Current_Date))
              UNION
              SELECT
               C.CRM_ID
              ,C."Name"
              ,C."Cohort"
              ,C."Industry"
              ,C."Date"
              ,C."Upsell"
              ,C."Churn"
              ,C."SalesCredit"
              ,C."RetentionCredit"
              ,C."SalesRep"
              ,C.CSM
              ,C."TotalBookings"
              ,C."NewBookings"
              ,C."ReturnBookings"
              ,C."Downsell"
              ,C.ACCOUNT_MANAGER
              ,'Chat' AS MRR_Product
              FROM RUBY.MASTERDATA."MRR_Detail_Chat" C
              WHERE CAST(C."Date" AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',  Current_Date))
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

    dimension: name {
      type: string
      sql: ${TABLE}."Name" ;;
    }

    dimension: cohort {
      type: date
      sql: ${TABLE}."Cohort" ;;
    }

    dimension: industry {
      type: string
      sql: ${TABLE}."Industry" ;;
    }

    dimension: date {
      type: date
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

    dimension: account_manager {
      type: string
      sql: ${TABLE}."ACCOUNT_MANAGER" ;;
    }

    dimension: mrr_product {
      type: string
      sql: ${TABLE}."MRR_PRODUCT" ;;
    }

    set: detail {
      fields: [
        crm_id,
        name,
        cohort,
        industry,
        date,
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
        account_manager,
        mrr_product
      ]
    }
  }
