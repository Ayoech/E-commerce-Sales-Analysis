WITH funnel_stages AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS page_view_users,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS add_to_cart_users,
        COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS checkout_users,
        COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS payment_info_users,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchase_users
    FROM events
    WHERE event_date >= CURRENT_DATE - INTERVAL 1 YEAR
)
SELECT
    add_to_cart_users * 100.0 / NULLIF(page_view_users, 0)
        AS "Page View → Add to Cart (%)",
    checkout_users * 100.0 / NULLIF(add_to_cart_users, 0)
        AS "Add to Cart → Checkout (%)",
    payment_info_users * 100.0 / NULLIF(checkout_users, 0)
        AS "Checkout → Payment Info (%)",
    purchase_users * 100.0 / NULLIF(payment_info_users, 0)
        AS "Payment Info → Purchase (%)"
FROM funnel_stages;