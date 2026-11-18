select
  loans.loan_id,
  loans.product_name,
  coalesce(customers.customer_type, 'unknown') as customer_type,
  loans.loan_status,
  loans.delinquency_bucket,
  case when loans.is_in_arrears then 'in_arrears' else 'performing' end as arrears_status,
  loans.outstanding_balance,
  loans.arrears_amount,
  loans.instalments_due,
  loans.instalments_missed,
  {{ platform.as_of_date() }} as as_of_date
from {{ ref('T1118FS_BANKING', 'fct_banking_loan_performance') }} as loans
left join {{ ref('T1118FS_BANKING', 'dim_banking_customers') }} as customers
  on loans.banking_customer_id = customers.banking_customer_id
