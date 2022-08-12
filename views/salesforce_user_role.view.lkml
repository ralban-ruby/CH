view: salesforce_user_role {
     derived_table: {
      sql: SELECT *
              FROM FIVETRAN_DB.SALESFORCE.USER_ROLE UR
              WHERE UR._FIVETRAN_DELETED <> 1
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

    dimension: name {
      type: string
      sql: ${TABLE}."NAME" ;;
    }

    dimension: parent_role_id {
      type: string
      sql: ${TABLE}."PARENT_ROLE_ID" ;;
    }

    dimension: rollup_description {
      type: string
      sql: ${TABLE}."ROLLUP_DESCRIPTION" ;;
    }

    dimension: opportunity_access_for_account_owner {
      type: string
      sql: ${TABLE}."OPPORTUNITY_ACCESS_FOR_ACCOUNT_OWNER" ;;
    }

    dimension: case_access_for_account_owner {
      type: string
      sql: ${TABLE}."CASE_ACCESS_FOR_ACCOUNT_OWNER" ;;
    }

    dimension: contact_access_for_account_owner {
      type: string
      sql: ${TABLE}."CONTACT_ACCESS_FOR_ACCOUNT_OWNER" ;;
    }

    dimension: forecast_user_id {
      type: string
      sql: ${TABLE}."FORECAST_USER_ID" ;;
    }

    dimension: may_forecast_manager_share {
      type: yesno
      sql: ${TABLE}."MAY_FORECAST_MANAGER_SHARE" ;;
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

    dimension: developer_name {
      type: string
      sql: ${TABLE}."DEVELOPER_NAME" ;;
    }

    dimension: portal_account_id {
      type: string
      sql: ${TABLE}."PORTAL_ACCOUNT_ID" ;;
    }

    dimension: portal_type {
      type: string
      sql: ${TABLE}."PORTAL_TYPE" ;;
    }

    dimension: portal_account_owner_id {
      type: string
      sql: ${TABLE}."PORTAL_ACCOUNT_OWNER_ID" ;;
    }

    dimension_group: _fivetran_synced {
      type: time
      sql: ${TABLE}."_FIVETRAN_SYNCED" ;;
    }

    dimension: _fivetran_deleted {
      type: yesno
      sql: ${TABLE}."_FIVETRAN_DELETED" ;;
    }

    set: detail {
      fields: [
        id,
        name,
        parent_role_id,
        rollup_description,
        opportunity_access_for_account_owner,
        case_access_for_account_owner,
        contact_access_for_account_owner,
        forecast_user_id,
        may_forecast_manager_share,
        last_modified_date_time,
        last_modified_by_id,
        system_modstamp_time,
        developer_name,
        portal_account_id,
        portal_type,
        portal_account_owner_id,
        _fivetran_synced_time,
        _fivetran_deleted
      ]
    }
  }
