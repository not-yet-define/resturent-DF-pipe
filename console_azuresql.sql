drop procedure if exists remove_hist_records;

-- remove procedure
create procedure remove_hist_records(
    @days integer
)
as
begin
    declare @from datetime2;
    set @from = dateadd(day, @days, cast(concat(cast(getdate() as date), ' 00:00:00.000000') as datetime2));

    declare @to datetime2;
    set @to = dateadd(day, -1, cast(concat(cast(getdate() as date), ' 00:00:00.000000') as datetime2));

    delete
    from order_line_history_test
    where dbo.order_line_history_test.timestamp > @from
      and dbo.order_line_history_test.timestamp <= @to;
end
go;

-- execution manually
execute remove_hist_records @days = -2;

-- check
begin
    declare @from datetime2;
    set @from = dateadd(day, -2, cast(concat(cast(getdate() as date), ' 00:00:00.000000') as datetime2));

    declare @to datetime2;
    set @to = dateadd(day, -1, cast(concat(cast(getdate() as date), ' 00:00:00.000000') as datetime2));

    select *
    from order_line_history_test
    where dbo.order_line_history_test.timestamp > @from
      and dbo.order_line_history_test.timestamp <= @to;
end
go;

-- 2021-09-14 00:00:00.0000000,2021-09-23 00:00:00.0000000
