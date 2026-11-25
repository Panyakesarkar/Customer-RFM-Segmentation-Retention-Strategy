# Customer RFM Segmentation & Retention ROI Strategy

## Project Overview
A Business Analysis case study analyzing 1,500 customer orders across 400 retail accounts to eliminate blanket discounting, isolate high-value at-risk cohorts, and maximize retention Return on Ad Spend (ROAS).

## Cohort Summary (400 Customers | ₹58.3L Total Revenue)
| Customer Segment | Customers | Avg Recency | Total Revenue (INR) | Strategic Action |
| :--- | :---: | :---: | :---: | :--- |
| **Champions** | 89 | 20.4 days | ₹22,21,917 | VIP Early Access & Referrals (No Discount) |
| **At-Risk High Value** | 73 | 101.2 days | ₹18,28,921 | Targeted 15% Win-Back Offer + Priority Support |
| **Loyal / Potential** | 109 | 21.7 days | ₹11,32,184 | Cross-Sell Bundles & Loyalty Points |
| **Hibernating** | 119 | 146.1 days | ₹6,46,581 | Low-Cost Email Drip; Cut Paid Retargeting |

## Repository Contents
- `Customer_RFM_Retention_Strategy.docx` — Executive Business Strategy Memo detailing cohort findings, margin protection, and projected retention ROI.
- `customer_rfm_segmentation.sql` — MySQL script using CTEs, `DATEDIFF`, and `NTILE(4)` window functions for quartile scoring.
- `customer_rfm_transactions.csv` — 1,500 order-level customer transaction records across 5 cities.
