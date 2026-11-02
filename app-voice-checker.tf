resource "azuread_application" "voice_checker" {
  display_name = "Voice checker"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "voice_checker" {
  client_id = azuread_application.voice_checker.client_id
  owners    = [data.azuread_client_config.current.object_id]
}