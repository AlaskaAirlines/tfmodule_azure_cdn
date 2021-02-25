variable "resource_group_name" {
  type        = string
  description = "Name of the resource group that exists in Azure"
}

variable "appName" {
  type        = string
  description = "The base name of the application used in the naming convention."
}

variable "environment" {
  type        = string
  description = "Name of the environment ex (Dev, Test, QA, Prod)"
  default     = "test"
}
