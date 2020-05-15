- name: testlookmldash
  title: Untitled Visualization
  model: snowflake_proj
  explore: orders
  type: table
  fields: [orders.somebool, orders.status, orders.count]
  pivots: [orders.somebool]
  fill_fields: [orders.somebool]
  sorts: [orders.somebool, orders.count desc 0]
  limit: 500
  dynamic_fields:
  - table_calculation: calculation_1
    label: Calculation 1
    expression: pivot_where(${orders.somebool}=yes, ${orders.count})
    value_format:
    value_format_name:
    _kind_hint: supermeasure
    _type_hint: number
  query_timezone: America/Los_Angeles
