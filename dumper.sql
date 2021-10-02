select *
from exposed.order_line_96586
where extract(year from order_line_96586.timestamp) = '2018';

----------------------------------------------------------------

select *
from exposed.order_line_96586
where extract(year from order_line_96586.timestamp) = '2019'
  and extract(month from order_line_96586.timestamp) < 6;

select *
from exposed.order_line_96586
where extract(year from order_line_96586.timestamp) = '2019'
  and extract(month from order_line_96586.timestamp) >= 6;

------------------------------------------------------------------

select *
from exposed.order_line_96586
where extract(year from order_line_96586.timestamp) = '2020'
  and extract(month from order_line_96586.timestamp) < 6;

select *
from exposed.order_line_96586
where extract(year from order_line_96586.timestamp) = '2020'
  and extract(month from order_line_96586.timestamp) >= 6;

select *
from exposed.order_line_96586
where extract(year from order_line_96586.timestamp) = '2021'
  and order_line_96586.timestamp <= '2021-10-02 00:00:00.000000 +00:00'
  and extract(month from order_line_96586.timestamp) < 6;

select *
from exposed.order_line_96586
where extract(year from order_line_96586.timestamp) = '2021'
  and order_line_96586.timestamp <= '2021-10-02 00:00:00.000000 +00:00'
  and extract(month from order_line_96586.timestamp) >= 6;

select *
from exposed.bill_96586;

select *
from exposed.communication_transaction_96586;

select *
from information_schema.columns
where table_schema = 'exposed';