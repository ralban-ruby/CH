connection: "elt_connector"

include: "*.view"

explore: ch_overview_master {hidden: yes}

datagroup: customer_happiness_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: customer_happiness_default_datagroup
