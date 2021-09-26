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

    delete_more:
    DELETE TOP (10000)
    FROM order_line_96586
    WHERE dbo.order_line_96586.timestamp > @from
      and dbo.order_line_96586.timestamp <= @to
    IF @@ROWCOUNT > 0 GOTO delete_more

end
go;

-- execution manually
-- 48,696 rows affected in 1 m 33 s 500 ms
execute remove_hist_records @days = -10;

-- 66,407 rows affected in 2 m 58 s 228 ms
execute remove_hist_records @days = -20;

-- 45,215 rows affected in 1 m 27 s 735 ms
execute remove_hist_records @days = -30;

-- check
-- 48,696 rows retrieved starting from 1 in 3 m 28 s 43 ms (execution: 38 s 797 ms, fetching: 2 m 49 s 246 ms)
begin
    declare @from datetime2;
    set @from = dateadd(day, -150, cast(concat(cast(getdate() as date), ' 00:00:00.000000') as datetime2));

    declare @to datetime2;
    set @to = dateadd(day, -1, cast(concat(cast(getdate() as date), ' 00:00:00.000000') as datetime2));

    select count(*)
    from order_line_96586
    where dbo.order_line_96586.timestamp > @from
      and dbo.order_line_96586.timestamp <= @to;
end
go;

select *
from information_schema.columns
where table_schema = 'dbo'
  and table_name = '';

-- 2021-09-14 00:00:00.0000000,2021-09-23 00:00:00.0000000


begin
    declare @from datetime2;
    set @from = dateadd(day, -150, cast(concat(cast(getdate() as date), ' 00:00:00.000000') as datetime2));

    declare @to datetime2;
    set @to = dateadd(day, -1, cast(concat(cast(getdate() as date), ' 00:00:00.000000') as datetime2));

    delete_more:
    DELETE TOP (10000)
    FROM order_line_96586
    WHERE @activity('Look for table details').output.firstRow.table_schema.@activity('Look for table details').output.firstRow.table_name.timestamp > @from
      and @activity('Look for table details').output.firstRow.table_schema.@activity('Look for table details').output.firstRow.table_name.timestamp <= @to
    IF @@ROWCOUNT > 0 GOTO delete_more;

end
go;

