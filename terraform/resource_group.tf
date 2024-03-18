resource "azurerm_resource_group" "resource_group" {
    name = format(var.resource_group_name[terraform.workspace], 
                    upper(var.Region),
                    upper(var.Workload),
                    upper(var.Release))
    location = var.resource_location
}
