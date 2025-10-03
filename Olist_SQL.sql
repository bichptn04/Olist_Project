SELECT 
    C.customer_unique_id,
    DATEDIFF(DAY, MAX(O.order_purchase_timestamp), CAST('2018-09-01' AS DATE)) AS Recency,
    COUNT(DISTINCT O.order_id) AS Frequency,
    SUM(I.price + I.freight_value) AS Monetary
FROM dbo.olist_customers_dataset C
JOIN dbo.olist_orders_dataset O
    ON C.customer_id = O.customer_id
JOIN dbo.olist_order_items_dataset I
    ON I.order_id = O.order_id
WHERE O.order_status = 'delivered'
GROUP BY C.customer_unique_id;

SELECT *
FROM [dbo].[Customer_RFM]