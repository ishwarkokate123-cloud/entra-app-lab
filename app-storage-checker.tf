resource "azuread_application" "storage_checker" {
  display_name = "Storage_checker"
  owners       = [data.azuread_client_config.current.object_id]

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "332a536c-c7ef-4017-ab91-336970924f0d" # Sites.Read.All (Application)
      type = "Role"
    }
  }
}
resource "azuread_service_principal" "storage_checker" {
  client_id = azuread_application.storage_checker.client_id
  owners    = [data.azuread_client_config.current.object_id]
}