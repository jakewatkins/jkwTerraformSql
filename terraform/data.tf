#
data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "support_key_vault" {
    name = var.key_vault_name
    #vault_uri = "https://hermes-sprt-kv-dev.vault.azure.net/"
    resource_group_name = var.resource_group_name_support
}

data "azurerm_key_vault_secret" "SQL_Password" {
    name = "pubsPassword"
    key_vault_id = data.azurerm_key_vault.support_key_vault.id
}

data "azurerm_key_vault_secret" "SQL_Admin" {
    name = "pubsAdmin"
    key_vault_id = data.azurerm_key_vault.support_key_vault.id
}