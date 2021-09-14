-- check table definition
select *
from information_schema.columns
where table_schema = 'exposed'
  and table_name = 'order_line_96586';

-- create tables in azure sql database
create table order_line
(
    id                  bigint,
    bill_id             bigint,
    store_id            bigint,
    store_name          text,
    area_id             text,
    area_name           text,
    revenue_center_id   text,
    revenue_center_name text,
    sales_channel       text,
    article_id          text,
    article_name        text,
    article_group_id    bigint,
    order_type          text,
    vat_rate            numeric,
    currency            text,
    timestamp           timestamp without time zone,
    order_id            text,
    quantity            numeric,
    price_subtotal      numeric,
    vat                 numeric,
    discount            numeric,
    service_charge      numeric,
    cost                numeric,
    price_including_all numeric,
    price_excluding_all numeric,
    order_reference     text,
    order_unique_id     bigint

);

-- yesterday records
select *
from exposed.order_line_96586
where order_line_96586.timestamp < date(timezone('utc', now())) - 1
limit 100;

-- last 24 hours records
select *
from exposed.order_line_96586
where order_line_96586.timestamp > current_timestamp - interval '1 day'
order by order_line_96586.timestamp desc
limit 500;

-- create tables in azure sql database
create table order_line_last24h
(
    id                  bigint,
    bill_id             bigint,
    store_id            bigint,
    store_name          text,
    area_id             text,
    area_name           text,
    revenue_center_id   text,
    revenue_center_name text,
    sales_channel       text,
    article_id          text,
    article_name        text,
    article_group_id    bigint,
    order_type          text,
    vat_rate            numeric,
    currency            text,
    timestamp           timestamp without time zone,
    order_id            text,
    quantity            numeric,
    price_subtotal      numeric,
    vat                 numeric,
    discount            numeric,
    service_charge      numeric,
    cost                numeric,
    price_including_all numeric,
    price_excluding_all numeric,
    order_reference     text,
    order_unique_id     bigint
);
