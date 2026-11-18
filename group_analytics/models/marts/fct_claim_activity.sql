select
  claim_id,
  product_name,
  claim_status,
  reported_date,
  claimed_amount,
  paid_amount,
  open_reserve,
  days_to_report,
  days_to_settle
from {{ ref('T1118FS_INSURANCE', 'fct_insurance_claims') }}
