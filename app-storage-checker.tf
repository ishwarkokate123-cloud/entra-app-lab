resource "azuread_application" "storage_checker" {
  display_name = "Storage_checker"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "storage_checker" {
  client_id = azuread_application.storage_checker.client_id
  owners    = [data.azuread_client_config.current.object_id]
}