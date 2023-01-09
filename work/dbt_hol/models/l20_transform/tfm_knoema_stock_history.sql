with cst as
(
select company_ticker, company_name, stock_exchange_name, indicator_name, date, value , data_source_name
  from {{ref('base_knoema_stock_history')}} src
 where indicator_name in ('close', 'open','high','low', 'volume', 'change %') 
)
select * 
  from cst
  pivot(sum(value) for indicator_name in ('close', 'open','high','low', 'volume', 'change %')) 
  as p(company_ticker, company_name, stock_exchange_name, date, data_source_name, close ,open ,high,low,volume,change)  
