# Input variable definitions

variable "application_name" {
  description = "Application name"
  type        = string
}

variable "environment" {
  description = "Application environment"
  type        = string
}

variable "owner_team" {
  description = "Owener Application team"
  type        = string
}

variable "user_pool_name" {
  description = "Cognito User Pool Name"
  type        = string
}

variable "user_pool_domain" {
  description = "Cognito User Pool Domain"
  type        = string
}

variable "refresh_token_validity" {
  description = "Cognito Refresh Token Validity"
  type        = number
}

variable "access_token_validity" {
  description = "Cognito Access Token Validity"
  type        = number
}

variable "id_token_validity" {
  description = "Cognito ID Token Validity"
  type        = number
}

variable "refresh_token_unit" {
  description = "Cognito Refresh Token Unit"
  type        = string
}

variable "access_token_unit" {
  description = "Cognito Access Token Unit"
  type        = string
}

variable "id_token_unit" {
  description = "Cognito ID Token Unit"
  type        = string
}

variable "callback_urls" {
  description = "Cognito Callback URLS"
  type        = list(string)
}

variable "client_name" {
  description = "Cognito Client Name"
  type        = string
}

variable "anonymous_user_username" {
  description = "Anonymous Username"
  type        = string
}

variable "anonymous_user_password" {
  description = "Anonymous Password"
  type        = string
}

variable "anonymous_user_email" {
  description = "Anonymous email"
  type        = string
}

variable "anonymous_user_cpf" {
  description = "Anonymous cpf"
  type        = string
  default = "11111111111"
}
