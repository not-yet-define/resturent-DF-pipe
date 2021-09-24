-- check server version
-- SELECT @@VERSION

-- check engine edition
-- SELECT SERVERPROPERTY('EngineEdition')

-- check databases and objects
-- SELECT * from sys.databases;
-- SELECT * FROM sys.objects;

-- check shedular status
-- SELECT * FROM sys.dm_os_schedulers WHERE STATUS = 'VISIBLE ONLINE';

-- dmv
-- SELECT * FROM sys.dm_user_db_resource_governance;

-- active requests
SELECT * FROM sys.dm_exec_requests;