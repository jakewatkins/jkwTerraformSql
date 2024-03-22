#
#
#

resource "azurerm_mssql_server" "SQL_Server" {
    name = lower(format(var.sql_server_name[terraform.workspace], var.Region, var.Workload, var.Release))
    location = azurerm_resource_group.resource_group.location
    resource_group_name = azurerm_resource_group.resource_group.name
    version = "12.0"
    minimum_tls_version = "1.2"
    administrator_login = data.azurerm_key_vault_secret.SQL_Admin.value
    administrator_login_password = data.azurerm_key_vault_secret.SQL_Password.value
}

resource "azurerm_mssql_firewall_rule" "SQL_Server_Firewall_Azure" {
  name                = lower(format("%s-azurefirewall",format(var.sql_server_name[terraform.workspace], var.Region, var.Workload, var.Release)))
  server_id           = azurerm_mssql_server.SQL_Server.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}