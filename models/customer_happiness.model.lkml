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
    sql_on: ${hively_csat.employeecode}=${employee_lookup_master.employee_code} ;;
  }
  }

explore: employee_lookup_master  {}

datagroup: customer_happiness_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: customer_happiness_default_datagroup
