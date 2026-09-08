 WITH source_funnel AS (
            SELECT
              traffic_source,
              COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS views,
              COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS carts,
              COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchases
            FROM events
            WHERE event_date >= CURRENT_DATE()- INTERVAL 1 YEAR
            GROUP BY traffic_source
)
SELECT
    traffic_source,
    views,
    carts,
    purchases,
    ROUND(carts * 100/ views) AS cart_conversion_rate,
    ROUND(purchases * 100/ views) AS views_purchase_conversion_rate,
    ROUND(purchases * 100/ carts) AS carts_purchase_conversion_rate
FROM source_funnel
ORDER BY purchases DESC;