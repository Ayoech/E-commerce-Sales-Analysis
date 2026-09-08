COPY (
    WITH funnel_stages AS (
        SELECT
            COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS page_view_views,
            COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS add_to_cart_views,
            COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS checkout_start_views,
            COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS payment_info_views,
            COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchase_views
        FROM events
        WHERE event_date >= CURRENT_DATE - INTERVAL 1 YEAR
    )
    SELECT *
    FROM funnel_stages
) TO 'C:/Users/aecha/Downloads/results/funnel_results.csv'
WITH (HEADER, DELIMITER ',');