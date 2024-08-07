SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    cast(purchase_price as FLOAT64) as purchase_price, 
    round(s.quantity*cast(p.purchase_price as FLOAT64),2) as purchase_cost,
    round(s.revenue -round(s.quantity*cast(p.purchase_price as FLOAT64),2),2) as margin
from {{ref("stg_raw__sales")}} s
left join {{ref("stg_raw__product")}} p 
    using (products_id)