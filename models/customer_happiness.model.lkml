connection: "elt_connector"
##connection: "snowflake"

access_grant: admin {
  allowed_values: ["admin"]
  user_attribute: team
}

include: "/views/*.view.lkml"
##include: "/asana/*.view.lkml"

explore: ch_overview_master {hidden: yes}

explore: hively_csat{
  join: employee_lookup_master {
    relationship: many_to_one
    type: full_outer
    sql_on: ${hively_csat.employee_code}=${employee_lookup_master.employee_code} ;;
  }
  }

explore: fact_adherence_occurrences {
  label: "Absences"
  view_label: "CH_Absences"
  join: employee_lookup_master {
    relationship: many_to_one
    type: full_outer
    sql_on: ${fact_adherence_occurrences.employee_code}=${employee_lookup_master.employee_code};;
    ##ANd [${employee_lookup_master.department_desc}='Customer Happiness'];;
  }
}


explore: cancel_churn  {
   join: Cancel_Owner_Employee_Lookup_Master {
    from: employee_lookup_master
    relationship: many_to_one
    type: full_outer
    sql_on: ${cancel_churn.cancel_owner_employee_code}=${Cancel_Owner_Employee_Lookup_Master.employee_code} ;;
  }
  join: Cancel_Save_Employee_Lookup_Master {
    from: employee_lookup_master
    relationship: many_to_one
    type: full_outer
    sql_on: ${cancel_churn.cancel_owner_employee_code}=${Cancel_Save_Employee_Lookup_Master.employee_code} ;;
  }
  join: mrr_details_combined {
    relationship: many_to_many
    type: full_outer
    sql_on: ${mrr_details_combined.crm_id} = ${cancel_churn.crm_id} ;;
  }
  join: mrr_details_derived {
    relationship: many_to_many
    type: left_outer
    sql_on: ${mrr_details_combined.crm_id} = ${cancel_churn.crm_id} ;;
  }
  join: customer_case {
    relationship: many_to_many
    type: full_outer
    sql_on: ${cancel_churn.crm_id} = ${customer_case.salesforce_account} ;;
  }
  join: hively_csat {
    relationship: many_to_many
    type: full_outer
    sql_on: ${customer_case.case_number} = ${hively_csat.ticket} ;;
   }
  join: cancel_request{
    relationship: many_to_many
    type: left_outer
    sql_on: ${cancel_request.salesforce_account} = ${cancel_churn.crm_id} ;;
  }
}

explore: Connections {
  label: "CH_Connections"
  view_label: "CH_Connections"
  join: employee_lookup_master {
    relationship: many_to_one
    type: full_outer
    sql_on: ${Connections.employeeid}=${employee_lookup_master.employeeid};;
  }
}

explore: ch_case {
  label: "CH_Case"
  view_label: "CH_Case"
  join: employee_lookup_master {
    relationship: many_to_one
    type: full_outer
    sql_on: ${ch_case.employeeid}=${employee_lookup_master.employeeid};;
  }
}

explore: salesforce_task {
  join: salesforce_user {
    relationship: many_to_one
    type: full_outer
    sql_on: ${salesforce_task.owner_id} = ${salesforce_user.id} ;;
  }
  join: employee_lookup_master {
    relationship: many_to_one
    type: full_outer
    sql_on: CASE WHEN LOWER(${employee_lookup_master.email}) = LOWER(${salesforce_user.name}) THEN 1
            WHEN LOWER(${employee_lookup_master.mailnickname}) = LOWER(LEFT(${salesforce_user.name}, CHARINDEX('@', ${salesforce_user.name})-1)) THEN 1
            WHEN LOWER(${employee_lookup_master.mailnickname}) = LOWER(LEFT(${salesforce_user.email} , CHARINDEX('@', ${salesforce_user.email})-1)) THEN 1
            WHEN LOWER(${employee_lookup_master.legalname}) = LOWER(${salesforce_user.name}) THEN 1
            WHEN LOWER(${employee_lookup_master.name}) = LOWER(${salesforce_user.name}) THEN 1
            ELSE 0
            END = 1
            ;;
      }
  join: salesforce_account  {
  relationship: many_to_one
  type: full_outer
  sql_on: ${salesforce_account.id} = COALESCE(${salesforce_task.account_c},${salesforce_task.account_id}) ;;

  }
}





datagroup: customer_happiness_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: customer_happiness_default_datagroup
