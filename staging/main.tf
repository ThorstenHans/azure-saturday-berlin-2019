module "infrastructure" {
  source           = "../infrastructure"
  environment_name = "production"

  custom_tags = {
    hot = "true"
  }

  disc_deploy         = true
  disc_size           = "16"
  disc_sku            = "Premium_LRS"
  appserviceplan_size = "S2"
}
