select
  monthly.portfolio_month_id,
  monthly.portfolio_id,
  portfolios.risk_profile,
  portfolios.portfolio_status,
  monthly.trade_month,
  monthly.trade_count,
  monthly.buy_amount,
  monthly.sell_amount,
  monthly.net_investment,
  monthly.fees
from {{ ref('T1118FS_WEALTH', 'fct_wealth_portfolio_monthly') }} as monthly
inner join {{ ref('T1118FS_WEALTH', 'dim_wealth_portfolios') }} as portfolios
  on monthly.portfolio_id = portfolios.portfolio_id
