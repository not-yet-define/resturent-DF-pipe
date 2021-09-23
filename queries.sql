select *
from exposed.order_line_96586
where order_line_96586.timestamp >= current_timestamp  - interval '5 day
