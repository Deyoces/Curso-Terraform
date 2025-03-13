variable "rg_name" {
  type = string

}
variable "rg_location" {
  type = string

}

variable "storage_account_name" {
  type = string

}

variable "function_name" {
  type        = string
  description = "Function App Name"
}
variable "app_service_name" {
  type        = string
  description = "App Service plan name"
}