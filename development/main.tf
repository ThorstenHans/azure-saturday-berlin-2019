module "infrastructure" {
  source           = "../infrastructure"
  environment_name = "development"

  custom_tags = {
    hot = "true"
  }

  disc_deploy = true
  disc_size   = "4"

  appserviceplan_size = "S1"
}
