#
#
#  add sql commands using: Install-Module -Name Az.Sql 
#  add your ip address to the sql server's firewall.
#


# need name of SQL Server
$dbServer = "srv-usw1-configr1-dev.database.windows.net"
$database = "sql-USW1-ConfigR1-dev"
$userName = "SqlAdmin"
$password = az keyvault secret show --vault-name $keyVaultName --name "pubsPassword"  --query "value"

write-host "Creating database $database on server $dbServer"
Invoke-Sqlcmd -InputFile "instpubs.sql" -ServerInstance $dbServer -Database $database -username $userName -Password $password

#write-host "Loading data"
#Invoke-sqlcm -InputFile "BikeStores-data.sql" -ServerInstance $dbServer -Database $database -username $userName -Password $password
