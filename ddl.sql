-- check table definition
select *
from information_schema.columns
where table_schema = 'exposed'
  and table_name = 'order_line_96586';

-- create tables in azure sql database
create table order_line_history
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
    timestamp           datetime2,
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

-- history data by year
select distinct extract(year from order_line_96586.timestamp)
from exposed.order_line_96586;

-- last 24 hours records
select min(order_line_96586.timestamp), max(order_line_96586.timestamp)
from exposed.order_line_96586
where order_line_96586.timestamp > '2021-09-17 00:00:00.000000 +00:00'::timestamp - interval '24 hours';

select *
from exposed.order_line_96586
where order_line_96586.timestamp > current_timestamp - interval '10 minutes';

select *
from exposed.order_line_96586
where order_line_96586.timestamp > '2021-09-16 00:00:00.000000 +00:00';

select *
from exposed.order_line_96586
where extract(year from order_line_96586.timestamp) = '2021'
  and order_line_96586.timestamp <= '2021-09-17 00:00:00.000000 +00:00';

SELECT *
FROM pg_timezone_names
WHERE name = current_setting('TIMEZONE');

SELECT '2021-09-17 00:00:00.000000 +00:00'::timestamp - interval '24 hours';

select count(*)
from exposed.order_line_96586
where exposed.order_line_96586.timestamp <= '2021-09-23 17:08:00.000000';

-- 2021-09-23 17:08:00.000000
-- 2021-09-16 15:43:00.000000
-- 2021-09-16 13:51:13.543445 +00:00

select count(*)
from exposed.order_line_96586
where order_line_96586.timestamp > '2021-07-31 00:00:00.000000 +00:00'
  and order_line_96586.timestamp <= '2021-08-31 00:00:00.000000 +00:00';

DELETE
FROM exposed.order_line_96586
WHERE current_timestamp - interval '60 days';

select count(*)
from exposed.order_line_96586
where exposed.order_line_96586.timestamp >= '2021-09-23 17:08:00.000000' - interval '60 days';

select count(*)
from exposed.bill_96586
where exposed.bill_96586.timestamp <= '2021-09-23 17:27:00.000000';
-----------------------------------------------------------------------------
select *
from information_schema.columns
where table_schema = 'exposed'
  and table_name = 'bill_96586';

create table bill
(
    id                  bigint,
    store_id            bigint,
    store_name          text,
    area_id             text,
    area_name           text,
    currency            text,
    dining_type         text,
    timestamp           datetime,
    bill_id             text,
    accountable         bit,
    price_subtotal      numeric,
    vat                 numeric,
    discount            numeric,
    service_charge      numeric,
    price_including_all numeric,
    price_excluding_all numeric,
    tip                 numeric

);

select distinct extract(year from bill_96586.timestamp)
from exposed.bill_96586;

-- 2018
-- 2019
-- 2020
-- 2021

select count(*)
from exposed.bill_96586; -- 924136

select *
from information_schema.columns
where table_schema = 'exposed'
  and table_name = 'number_of_guests_96586';

create table number_of_guests
(
    id                      bigint,
    store_id                bigint,
    store_name              text,
    area_id                 text,
    area_name               text,
    table_session_id        text,
    table_name              text,
    dining_type             text,
    session_begin_timestamp datetime2,
    session_end_timestamp   datetime2,
    number_of_guests        integer,
    storage_timestamp       datetime2

);

select distinct extract(year from number_of_guests_96586.storage_timestamp)
from exposed.number_of_guests_96586;

-- 2019
-- 2020
-- 2021

select count(*)
from exposed.number_of_guests_96586; -- 916692

select *
from information_schema.columns
where table_schema = 'exposed'
  and table_name = 'payment_96586';

create table payment
(
    id                       bigint,
    payment_type_description text,
    payment_type_name        text,
    card_acquirer            text,
    bill_id                  bigint,
    store_id                 bigint,
    store_name               text,
    bill_timestamp           datetime2,
    amount                   numeric,
    tip                      numeric,
    adjustment               numeric,
    storage_timestamp        datetime2

);

select distinct extract(year from payment_96586.storage_timestamp)
from exposed.payment_96586;

-- 2019
-- 2020
-- 2021

select count(*)
from exposed.payment_96586; -- 924628

select *
from information_schema.columns
where table_schema = 'exposed'
  and table_name = 'line_ingredients_96586';

create table ingredients
(
    id                bigint,
    order_line_id     bigint,
    store_id          bigint,
    store_name        text,
    ingredient_id     bigint,
    ingredient_name   text,
    ingredient_status text,
    unit_name         text,
    unit_value        numeric,
    timestamp         datetime2,
    created_at        datetime2,
    updated_at        datetime2

);

select distinct extract(year from line_ingredients_96586.timestamp)
from exposed.line_ingredients_96586;

-- 2021
-- 2020

select count(*)
from exposed.line_ingredients_96586; -- 69233

select *
from information_schema.columns
where table_schema = 'exposed'
  and table_name = 'consumer_loyalty_points_96586';

create table consumer_loyalty_points
(
    id                   bigint,
    amount               numeric,
    value                numeric,
    creation_type        text,
    reason_type          text,
    store_id             bigint,
    store_name           text,
    loyalty_program_id   bigint,
    loyalty_program_name text,
    consumer_id          bigint,
    consumer_name        text,
    consumer_email       text,
    order_id             bigint,
    order_reference      text,
    article_id           text,
    article_reference    text,
    article_name         text,
    timestamp            datetime2

);

select distinct extract(year from consumer_loyalty_points_96586.timestamp)
from exposed.consumer_loyalty_points_96586;

-- 2021

select count(*)
from exposed.consumer_loyalty_points_96586; -- 24365

select *
from information_schema.columns
where table_schema = 'exposed'
  and table_name = 'app_consumer_96586';

create table app_consumer
(
    consumer_id                bigint,
    platform                   text,
    consumer_device_created_at timestamp without time zone,
    consumer_device_updated_at timestamp without time zone,
    stored_timestamp           timestamp without time zone
);

select distinct extract(year from app_consumer_96586.stored_timestamp)
from exposed.app_consumer_96586;

-- 2021
-- 2020

select count(*)
from exposed.app_consumer_96586;
-- 205508

------------------------------------------------------------------------------------------------------------------------
-- 24 hr update
select *
from exposed.order_line_96586
where order_line_96586.timestamp > current_timestamp + interval '2 hours' - interval '24 hours';

select current_timestamp::date;

select *
from exposed.order_line_96586
where order_line_96586.timestamp >= current_timestamp - interval '5 days';
