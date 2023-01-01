select
  "Company"                      company
  , "Company Name"               company_name
  , "Company Ticker"             company_ticker
  , "Stock Exchange"             stock_exchange
  , "Stock Exchange Name"        stock_exchange_name
  , "Indicator"                  indicator
  , "Indicator Name"             indicator_name
  , "Units"                      units
  , "Scale"                      scale
  , "Frequency"                  frequency
  , "Date"                       date
  , "Value"                      value
  , 'Knoema.Stock History' data_source_name
from {{source('economy_data_atlas','usindssp2020')}}  src 
