variable "env" {
  type        = string
  description = "env: dev, test, or prod"
}

variable "app_name" {
  type        = string
  description = "The App name"
}

variable "client_id" {
  type        = string
  description = "The App name"
  sensitive   = true
}

variable "client_secret" {
  type        = string
  description = "The App name"
  sensitive   = true
}