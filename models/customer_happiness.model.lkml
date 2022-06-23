connection: "elt_connector"

include: "*.view"

explore: ch_overview_master {hidden: yes}

explore: hively_csat {
  hidden: no
# access_filter: {field:ch_employee_lookup_all.employeeid
# user_attribute:employee_id}
join: ch_employee_lookup_all {
  relationship: many_to_one
  type: full_outer
  sql_on:  ${hively_csat.employeecode} = ${ch_employee_lookup_all.employee_code};;
    }
  }



datagroup: customer_happiness_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: customer_happiness_default_datagroup
