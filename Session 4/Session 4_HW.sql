-- G5_23BCS13761_Tanay Manish Nesari_session 4 --
SELECT 
    ROUND(AVG(CASE WHEN s.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) * 100, 2) AS immediate_percentage
FROM (
    SELECT customer_id, MIN(order_date) AS order_date
    FROM Delivery 
    GROUP BY customer_id
) AS s
JOIN Delivery d 
    ON s.customer_id = d.customer_id
   AND s.order_date = d.order_date;