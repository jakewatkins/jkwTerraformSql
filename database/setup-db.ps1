#
#
#  add sql commands using: Install-Module -Name Az.Sql 
#  add your ip address to the sql server's firewall.
#


param([Parameter(Mandatory=$true)] $keyVaultName)

# need name of SQL Server
$dbServer = "srv-usw1-configr1-dev.database.windows.net"
$database = "sql-USW1-ConfigR1-dev"
$userName = (az keyvault secret show --vault-name $keyVaultName --name "pubsAdmin"  --query "value") -replace '"', ''
$password = (az keyvault secret show --vault-name $keyVaultName --name "pubsPassword"  --query "value") -replace '"', ''


write-host "Creating database $database on server $dbServer"
Invoke-Sqlcmd -InputFile "instpubs.sql" -ServerInstance $dbServer -Database $database -username $userName -Password $password

write-host "Database $database created on server $dbServer"
$titles = Invoke-SqlCmd -ServerInstance $dbServer -Database $database -username $userName -Password $password -Query "SELECT * FROM titles"
write-host "titles: $($titles.Count) rows"
$titles | %{ write-host $_.title }