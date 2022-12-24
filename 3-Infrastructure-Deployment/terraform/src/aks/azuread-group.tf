data "azuread_user" "azured_user" {
  user_principal_name = "nicholas.chang@cloudtechgenius.com"
}

resource "azuread_group" "aks_administrators" {
  display_name     = "aks-admin"
  security_enabled = true
}
resource "azuread_group_member" "aad_group_member" {
  group_object_id  = azuread_group.aks_administrators.id
  member_object_id = data.azuread_user.azured_user.id
  depends_on = [
    azuread_group.aks_administrators
  ]
}