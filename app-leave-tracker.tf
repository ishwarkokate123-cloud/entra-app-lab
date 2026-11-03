resource "azuread_application" "leave_tracker" {
  display_name = "Leave_Tracker"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "leave_tracker" {
  client_id = azuread_application.leave_tracker.client_id
  owners    = [data.azuread_client_config.current.object_id]
}