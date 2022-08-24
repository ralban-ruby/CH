view: ic_calldetail {
  derived_table: {
    sql: SELECT *
      FROM RUBY.IC.CALLDETAIL_VIW
      WHERE CAST(INITIATEDDATE AS DATE) >= dateadd(YEAR,-2,date_trunc('MONTH',  Current_Date))
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: callid {
    type: string
    sql: ${TABLE}."CALLID" ;;
  }

  dimension: calltype {
    type: string
    sql: ${TABLE}."CALLTYPE" ;;
  }

  dimension: calldirection {
    type: string
    sql: ${TABLE}."CALLDIRECTION" ;;
  }

  dimension: lineid {
    type: string
    sql: ${TABLE}."LINEID" ;;
  }

  dimension: stationid {
    type: string
    sql: ${TABLE}."STATIONID" ;;
  }

  dimension: localuserid {
    type: string
    sql: ${TABLE}."LOCALUSERID" ;;
  }

  dimension: assignedworkgroup {
    type: string
    sql: ${TABLE}."ASSIGNEDWORKGROUP" ;;
  }

  dimension: localnumber {
    type: string
    sql: ${TABLE}."LOCALNUMBER" ;;
  }

  dimension: localname {
    type: string
    sql: ${TABLE}."LOCALNAME" ;;
  }

  dimension: remotenumber {
    type: string
    sql: ${TABLE}."REMOTENUMBER" ;;
  }

  dimension: remotenumbercountry {
    type: number
    sql: ${TABLE}."REMOTENUMBERCOUNTRY" ;;
  }

  dimension: remotenumberlocomp1 {
    type: string
    sql: ${TABLE}."REMOTENUMBERLOCOMP1" ;;
  }

  dimension: remotenumberlocomp2 {
    type: string
    sql: ${TABLE}."REMOTENUMBERLOCOMP2" ;;
  }

  dimension: remotenumberfmt {
    type: string
    sql: ${TABLE}."REMOTENUMBERFMT" ;;
  }

  dimension: remotenumbercallid {
    type: string
    sql: ${TABLE}."REMOTENUMBERCALLID" ;;
  }

  dimension: remotename {
    type: string
    sql: ${TABLE}."REMOTENAME" ;;
  }

  dimension_group: initiateddate {
    type: time
    sql: ${TABLE}."INITIATEDDATE" ;;
  }

  dimension_group: initiateddatetimegmt {
    type: time
    sql: ${TABLE}."INITIATEDDATETIMEGMT" ;;
  }

  dimension_group: connecteddate {
    type: time
    sql: ${TABLE}."CONNECTEDDATE" ;;
  }

  dimension_group: connecteddatetimegmt {
    type: time
    sql: ${TABLE}."CONNECTEDDATETIMEGMT" ;;
  }

  dimension_group: terminateddate {
    type: time
    sql: ${TABLE}."TERMINATEDDATE" ;;
  }

  dimension_group: terminateddatetimegmt {
    type: time
    sql: ${TABLE}."TERMINATEDDATETIMEGMT" ;;
  }

  dimension: calldurationseconds {
    type: number
    sql: ${TABLE}."CALLDURATIONSECONDS" ;;
  }

  dimension: holddurationseconds {
    type: number
    sql: ${TABLE}."HOLDDURATIONSECONDS" ;;
  }

  dimension: linedurationseconds {
    type: number
    sql: ${TABLE}."LINEDURATIONSECONDS" ;;
  }

  dimension: dnis {
    type: string
    sql: ${TABLE}."DNIS" ;;
  }

  dimension: calleventlog {
    type: string
    sql: ${TABLE}."CALLEVENTLOG" ;;
  }

  dimension: customnum1 {
    type: number
    sql: ${TABLE}."CUSTOMNUM1" ;;
  }

  dimension: customnum2 {
    type: number
    sql: ${TABLE}."CUSTOMNUM2" ;;
  }

  dimension: customnum3 {
    type: number
    sql: ${TABLE}."CUSTOMNUM3" ;;
  }

  dimension: customstring1 {
    type: string
    sql: ${TABLE}."CUSTOMSTRING1" ;;
  }

  dimension: customstring2 {
    type: string
    sql: ${TABLE}."CUSTOMSTRING2" ;;
  }

  dimension: customstring3 {
    type: string
    sql: ${TABLE}."CUSTOMSTRING3" ;;
  }

  dimension_group: customdatetime {
    type: time
    sql: ${TABLE}."CUSTOMDATETIME" ;;
  }

  dimension_group: customdatetimegmt {
    type: time
    sql: ${TABLE}."CUSTOMDATETIMEGMT" ;;
  }

  dimension: interactiontype {
    type: number
    sql: ${TABLE}."INTERACTIONTYPE" ;;
  }

  dimension: accountcode {
    type: string
    sql: ${TABLE}."ACCOUNTCODE" ;;
  }

  dimension: purposecode {
    type: number
    sql: ${TABLE}."PURPOSECODE" ;;
  }

  dimension: dispositioncode {
    type: number
    sql: ${TABLE}."DISPOSITIONCODE" ;;
  }

  dimension: callnote {
    type: string
    sql: ${TABLE}."CALLNOTE" ;;
  }

  dimension: siteid {
    type: number
    sql: ${TABLE}."SITEID" ;;
  }

  dimension: subsiteid {
    type: number
    sql: ${TABLE}."SUBSITEID" ;;
  }

  dimension_group: i3_timestampgmt {
    type: time
    sql: ${TABLE}."I3TIMESTAMPGMT" ;;
  }

  dimension: wrapupcode {
    type: string
    sql: ${TABLE}."WRAPUPCODE" ;;
  }

  dimension: tdialing {
    type: number
    sql: ${TABLE}."TDIALING" ;;
  }

  dimension: tivrwait {
    type: number
    sql: ${TABLE}."TIVRWAIT" ;;
  }

  dimension: tqueuewait {
    type: number
    sql: ${TABLE}."TQUEUEWAIT" ;;
  }

  dimension: talert {
    type: number
    sql: ${TABLE}."TALERT" ;;
  }

  dimension: tsuspend {
    type: number
    sql: ${TABLE}."TSUSPEND" ;;
  }

  dimension: tconference {
    type: number
    sql: ${TABLE}."TCONFERENCE" ;;
  }

  dimension: texternal {
    type: number
    sql: ${TABLE}."TEXTERNAL" ;;
  }

  dimension: tacw {
    type: number
    sql: ${TABLE}."TACW" ;;
  }

  dimension: nivr {
    type: number
    sql: ${TABLE}."NIVR" ;;
  }

  dimension: nqueuewait {
    type: number
    sql: ${TABLE}."NQUEUEWAIT" ;;
  }

  dimension: ntalk {
    type: number
    sql: ${TABLE}."NTALK" ;;
  }

  dimension: nconference {
    type: number
    sql: ${TABLE}."NCONFERENCE" ;;
  }

  dimension: nheld {
    type: number
    sql: ${TABLE}."NHELD" ;;
  }

  dimension: ntransfer {
    type: number
    sql: ${TABLE}."NTRANSFER" ;;
  }

  dimension: nexternal {
    type: number
    sql: ${TABLE}."NEXTERNAL" ;;
  }

  set: detail {
    fields: [
      callid,
      calltype,
      calldirection,
      lineid,
      stationid,
      localuserid,
      assignedworkgroup,
      localnumber,
      localname,
      remotenumber,
      remotenumbercountry,
      remotenumberlocomp1,
      remotenumberlocomp2,
      remotenumberfmt,
      remotenumbercallid,
      remotename,
      initiateddate_time,
      initiateddatetimegmt_time,
      connecteddate_time,
      connecteddatetimegmt_time,
      terminateddate_time,
      terminateddatetimegmt_time,
      calldurationseconds,
      holddurationseconds,
      linedurationseconds,
      dnis,
      calleventlog,
      customnum1,
      customnum2,
      customnum3,
      customstring1,
      customstring2,
      customstring3,
      customdatetime_time,
      customdatetimegmt_time,
      interactiontype,
      accountcode,
      purposecode,
      dispositioncode,
      callnote,
      siteid,
      subsiteid,
      i3_timestampgmt_time,
      wrapupcode,
      tdialing,
      tivrwait,
      tqueuewait,
      talert,
      tsuspend,
      tconference,
      texternal,
      tacw,
      nivr,
      nqueuewait,
      ntalk,
      nconference,
      nheld,
      ntransfer,
      nexternal
    ]
  }
}
