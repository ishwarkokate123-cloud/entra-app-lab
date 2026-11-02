resource "azuread_application" "hr_portal" {
  display_name = "app-hr-portal-dev"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "hr_portal" {
  client_id = azuread_application.hr_portal.client_id
  owners    = [data.azuread_client_config.current.object_id]
}