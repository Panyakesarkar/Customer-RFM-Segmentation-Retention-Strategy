-- ============================================================================
-- PROJECT 2 (BUSINESS ANALYST): Customer RFM Segmentation & Retention Strategy
-- AUTHOR: Pranav Kesarkar | Tools: MySQL (CTEs, NTILE Window Functions)
-- ============================================================================

WITH CustomerMetrics AS (
    SELECT
        Customer_ID,
        City,
        DATEDIFF('2026-11-20', MAX(Order_Date)) AS recency_days,
        COUNT(Transaction_ID) AS frequency_orders,
        ROUND(SUM(Order_Value_INR), 2) AS monetary_value_inr
    FROM customer_rfm_transactions
    GROUP BY Customer_ID, City
),
RFMScores AS (
    SELECT
        *,
        NTILE(4) OVER (ORDER BY recency_days DESC) AS r_score,
        NTILE(4) OVER (ORDER BY frequency_orders ASC) AS f_score,
        NTILE(4) OVER (ORDER BY monetary_value_inr ASC) AS m_score
    FROM CustomerMetrics
),
SegmentedCustomers AS (
    SELECT
        *,
        CASE
            WHEN r_score >= 3 AND f_score >= 3 AND m_score >= 3 THEN 'Champions'
            WHEN r_score <= 2 AND m_score >= 3 THEN 'At-Risk High Value'
            WHEN r_score >= 3 THEN 'Loyal / Potential'
            ELSE 'Hibernating'
        END AS customer_segment
    FROM RFMScores
)
SELECT
    customer_segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(recency_days), 1) AS avg_recency_days,
    ROUND(AVG(frequency_orders), 1) AS avg_orders,
    ROUND(SUM(monetary_value_inr), 2) AS total_revenue_inr,
    ROUND(SUM(monetary_value_inr) * 100.0 / SUM(SUM(monetary_value_inr)) OVER (), 2) AS revenue_share_pct
FROM SegmentedCustomers
GROUP BY customer_segment
ORDER BY total_revenue_inr DESC;
