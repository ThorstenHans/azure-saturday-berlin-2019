module "infrastructure" {
  source           = "../infrastructure"
  environment_name = "staging"

  custom_tags = {
    hot = "true"
  }

  disc_deploy         = false
  disc_size           = "16"
  disc_sku            = "Premium_LRS"
  appserviceplan_size = "S2"
}
