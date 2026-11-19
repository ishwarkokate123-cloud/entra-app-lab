resource "azuread_application" "sharepoint_storage_checker" {
  display_name = "SharePoint Storage Checker"
  owners       = [data.azuread_client_config.current.object_id]

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "332a536c-c7ef-4017-ab91-336970924f0d" # Sites.Read.All (Application)
      type = "Role"
    }

    resource_access {
      id   = "b633e1c5-b582-4048-a93e-9f11b44c7e96" # Mail.Send (Application)
      type = "Role"
    }
  }
}

resource "azuread_service_principal" "sharepoint_storage_checker" {
  client_id = azuread_application.sharepoint_storage_checker.client_id
  owners    = [data.azuread_client_config.current.object_id]
}