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

create table app_consumer
(
    consumer_id                bigint,
    platform                   text,
    consumer_device_created_at timestamp without time zone,
    consumer_device_updated_at timestamp without time zone,
    stored_timestamp           timestamp without time zone
);
