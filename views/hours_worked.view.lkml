view: hours_worked {
      derived_table: {
      sql: SELECT
          F.EMPLOYEECODE,
        F.nominaldate,
        round(sum(F.minutes) / 60.0, 2) AS HoursWorked
      FROM
        FIVETRAN_DB.PEARL_EDW_WFM.ASPECT_SUPERSTATEHOURS_FACT AS F
      WHERE
        F.CODE IN ('BI - HOURS WORKED - CHAT', 'BI - HOURS WORKED - RECEPTION', 'BI - HOURS WORKED - BILINGUAL')
          AND F."_FIVETRAN_DELETED" != 1
          AND F.TITLE IN ('Chat Specialists (Day)', 'Chat Specialists (Eve)', 'Receptionist', 'Sr. Receptionist', 'Sr Receptionist')
            AND F.nominaldate BETWEEN '4/1/2021' AND '3/31/2022'
          GROUP BY
            1,2
        UNION
          SELECT
              ST.EMPLOYEE_CODE,
            "DATE" AS nominaldate,
            round(SUM(ST."Work_Time") / 60.0, 2) AS HoursWorked
          FROM
            RUBY.CALABRIO.TIME_SUMMARY_STARTTIME ST
          WHERE
            CAST("DATE" AS DATE) >= '4/1/2022'
              --AND SITE = 'Services'
              AND ACTIVITY != 'Not Defined'
            GROUP BY
              1,2
       ;;
    }

    measure: count_days_worked {
      type: sum
      drill_fields: [detail*]
      sql:  ${hours_worked_flag}  ;;
    }

  dimension: u_key {
    primary_key: yes
    type: string
    sql: CONCAT(CONCAT(${TABLE}."EMPLOYEECODE",' - '),${TABLE}."NOMINALDATE") ;;
  }

      dimension: employeecode {
        type: number
        sql: ${TABLE}."EMPLOYEECODE" ;;
      }

    dimension: nominaldate {
      type: date
      sql: ${TABLE}."NOMINALDATE" ;;
    }

    dimension: hoursworked {
      type: number
      sql: ${TABLE}."HOURSWORKED" ;;
    }

    dimension: hours_worked_flag {
      type: number
      sql: CASE WHEN ${TABLE}."HOURSWORKED" > 0 THEN 1 ELSE 0 END ;;

    }

    set: detail {
      fields: [employeecode, nominaldate, hoursworked]
    }
  }
