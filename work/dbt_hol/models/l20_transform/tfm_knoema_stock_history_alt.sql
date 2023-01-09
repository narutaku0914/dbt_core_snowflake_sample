select
  company_ticker, company_name, stock_exchange_name, date, data_source_name,
  {{ dbt_utils.pivot(
      column = 'indicator_name',
      values = dbt_utils.get_column_values(ref('base_knoema_stock_history'), 'indicator_name'),
      then_value = 'value'
  ) }}
from {{ ref('base_knoema_stock_history') }}
group by company_ticker, company_name, stock_exchange_name, date, data_source_name
