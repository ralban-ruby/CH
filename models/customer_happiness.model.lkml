connection: "elt_connector"

include: "/views/*.view.lkml"
##include: "*.view"

explore: ch_overview_master {hidden: yes}

explore: hively_csat{
  join: employee_lookup_master {
    relationship: many_to_one
    type: full_outer
    sql_on: ${hively_csat.employeecode}=${employee_lookup_master.employee_code} ;;
  }
  }

explore: cancel_c{
  join: employee_lookup_master {
    relationship: many_to_one
    type: left_outer
    sql_on: ${cancel_c.who_saved_c}=${employee_lookup_master.name} ;;
  }
}


datagroup: customer_happiness_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: customer_happiness_default_datagroup
