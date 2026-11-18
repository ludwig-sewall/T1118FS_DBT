select
  segments.customer_id,
  segments.value_segment,
  segments.next_best_action,
  coalesce(customers.customer_type, 'unknown') as customer_type,
  customers.profit_band,
  case when segments.is_insurance_prospect then 1 else 0 end as insurance_prospect,
  case when segments.is_wealth_prospect then 1 else 0 end as wealth_prospect,
  case when segments.is_credit_watch then 1 else 0 end as credit_watch,
  customers.total_profit,
  customers.assets_under_management,
  customers.as_of_date
from {{ ref('dim_customer_segments') }} as segments
inner join {{ ref('dim_customer_360') }} as customers
  on segments.customer_id = customers.customer_id
