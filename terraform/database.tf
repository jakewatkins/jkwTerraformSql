#
#
#
resource "azurerm_mssql_database" "database" {
    name = format(var.database_name[terraform.workspace], var.Region, var.Workload, var.Release)
    server_id = azurerm_mssql_server.SQL_Server.id
    collation      = "SQL_Latin1_General_CP1_CI_AS"
    #license_type   = "LicenseIncluded"
    auto_pause_delay_in_minutes = 60
    min_capacity = 1
    #read_replica_count = 1
    read_scale = false
    max_size_gb    = var.sql_size[terraform.workspace]
    zone_redundant = false
    sku_name       = var.sql_sku[terraform.workspace]
}

resource "azurerm_key_vault_secret" "DB_ConnectionString" {
    name = var.db_ConnectionString_name
    value = "Server=tcp:${azurerm_mssql_server.SQL_Server.fully_qualified_domain_name};Database=${azurerm_mssql_database.database.name};User ID=${data.azurerm_key_vault_secret.SQL_Admin.value};Password=${data.azurerm_key_vault_secret.SQL_Admin.value};Trusted_Connection=False;Encrypt=True;"
    key_vault_id = data.azurerm_key_vault.support_key_vault.id
}