select
  party_key,
  total_revenue,
  total_cost,
  total_profit,
  profit_months,
  profit_band
from {{ ref('T1118FS_FINANCIALS', 'fct_customer_profitability_summary') }}
