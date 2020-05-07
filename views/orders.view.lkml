view: orders {
  sql_table_name: LOOKER_TEST.ORDERS ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: order_amount {
    type: number
    sql: ${TABLE}."ORDER_AMOUNT" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: somebool {
    type: yesno
    sql: ${user_id} > 20;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.id, users.name, order_items.count]
  }
}
