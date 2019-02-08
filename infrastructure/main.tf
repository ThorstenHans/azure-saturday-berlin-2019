provider "azurerm" {}

locals {
  default_tags = {
    environment = "${var.environment_name}"
    author      = "Thorsten Hans"
  }

  all_tags = "${merge(local.default_tags, var.custom_tags)}"
}

resource "azurerm_resource_group" "resgr" {
  name     = "thh-demo-azsat-${var.environment_name}"
  location = "West Europe"
  tags     = "${local.all_tags}"
}

resource "azurerm_app_service_plan" "appsvcplan" {
  resource_group_name = "${azurerm_resource_group.resgr.name}"
  location            = "${azurerm_resource_group.resgr.location}"
  name                = "thh-azsatberlin-appsvc-${var.environment_name}"
  kind                = "linux"

  sku {
    tier = "Standard"
    size = "${var.appserviceplan_size}"
  }

  reserved = true

  tags = "${local.all_tags}"
}

resource "azurerm_app_service" "appsvc" {
  resource_group_name = "${azurerm_resource_group.resgr.name}"
  location            = "${azurerm_resource_group.resgr.location}"
  name                = "thh-azsatberlin-app-${var.environment_name}"
  app_service_plan_id = "${azurerm_app_service_plan.appsvcplan.id}"

  app_settings {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
  }

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on        = true
    linux_fx_version = "DOCKER|nginx:alpine"
  }

  tags = "${local.all_tags}"
}

resource "azurerm_managed_disk" "disc" {
  resource_group_name  = "${azurerm_resource_group.resgr.name}"
  location             = "${azurerm_resource_group.resgr.location}"
  name                 = "thh-azsatberlin-managed-disc-${var.environment_name}"
  count                = "${var.disc_deploy}"
  create_option        = "Empty"
  disk_size_gb         = "${var.disc_size}"
  storage_account_type = "${var.disc_sku}"
  tags                 = "${local.all_tags}"
}
