variable "environment_name" {
  type    = "string"
  default = "development"
}

variable "custom_tags" {
  type    = "map"
  default = {}
}

variable "disc_deploy" {
  type    = "string"
  default = true
}

variable "disc_size" {
  type        = "string"
  description = "Disc Size in GB"
  default     = "16"
}

variable "disc_sku" {
  type        = "string"
  description = "Disc SKU"
  default     = "Standard_LRS"
}

variable "appserviceplan_size" {
  type        = "string"
  description = "Define the Size of the Azure App Service Plan (defaults to S1)"
  default     = "S1"
}
