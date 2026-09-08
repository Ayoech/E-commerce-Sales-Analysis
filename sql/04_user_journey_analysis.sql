WITH user_journey AS (
    SELECT
        user_id,
        MIN(CASE WHEN event_type = 'page_view' THEN event_date END) AS view_time,
        MIN(CASE WHEN event_type = 'add_to_cart' THEN event_date END) AS cart_time,
        MIN(CASE WHEN event_type = 'purchase' THEN event_date END) AS purchase_time
    FROM events
    WHERE event_date >= CURRENT_DATE() - INTERVAL 1 YEAR
    GROUP BY user_id
    HAVING MIN(CASE WHEN event_type = 'purchase' THEN event_date END) IS NOT NULL
)
SELECT
    COUNT(*) AS converted_users,
    ROUND(AVG(date_diff('minute', view_time, cart_time)), 2) AS avg_view_to_cart_minutes,
    ROUND(AVG(date_diff('minute', cart_time, purchase_time)), 2) AS avg_cart_to_purchase_minutes,
    ROUND(AVG(date_diff('minute', view_time, purchase_time)), 2) AS avg_total_journey_minutes
FROM user_journey;