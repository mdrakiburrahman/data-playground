# SQL Server

Create a data warehouse:

```bash
docker exec -u 0 sqlserver-sqlserver-1 apt-get update
docker exec -u 0 sqlserver-sqlserver-1 apt-get install -y curl
docker exec -u 0 sqlserver-sqlserver-1 mkdir -p /var/opt/mssql/backup
docker exec -u 0 sqlserver-sqlserver-1 curl -L -o /var/opt/mssql/backup/AdventureWorks2022.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak

docker exec -u 0 sqlserver-sqlserver-1 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'Password!' -C -Q "
USE [master];
RESTORE DATABASE [AdventureWorks2022]
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2022.bak'
WITH
    MOVE 'AdventureWorksDW2022' TO '/var/opt/mssql/data/AdventureWorks2022_Data.mdf',
    MOVE 'AdventureWorksDW2022_log' TO '/var/opt/mssql/data/AdventureWorks2022_log.ldf',
    FILE = 1,
    NOUNLOAD,
    STATS = 5;
"
```