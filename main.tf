
// Resources
resource "aws_cognito_user_pool" "user_pool" {
  name = var.user_pool_name

  alias_attributes         = ["email", "preferred_username"]
  auto_verified_attributes = ["email"]
  password_policy {
    minimum_length                   = 6
    temporary_password_validity_days = 7
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_subject        = "Account Confirmation"
    email_message        = "Your confirmation code is {####}"
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }

  schema {
    name                     = "cpf"
    attribute_data_type      = "String"
    required                 = false
    developer_only_attribute = false
    mutable                  = true

    string_attribute_constraints {
      min_length = 1
      max_length = 11
    }
  }

  tags = {
    App         = var.application_name,
    Environment = var.environment,
    OwnerTeam   = var.owner_team
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name = var.client_name

  user_pool_id           = aws_cognito_user_pool.user_pool.id
  generate_secret        = true
  refresh_token_validity = var.refresh_token_validity
  access_token_validity  = var.access_token_validity
  id_token_validity      = var.id_token_validity

  token_validity_units {
    id_token      = "minutes"
    access_token  = "minutes"
    refresh_token = "days"
  }

  prevent_user_existence_errors = "ENABLED"
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH"
  ]

  callback_urls                        = var.callback_urls
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code", "implicit"]
  allowed_oauth_scopes                 = ["email", "openid"]
  supported_identity_providers         = ["COGNITO"]

}

resource "aws_cognito_user_pool_domain" "cognito-domain" {
  domain       = var.user_pool_domain
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

resource "aws_cognito_user" "anonymous" {
  user_pool_id = aws_cognito_user_pool.user_pool.id
  username     = var.anonymous_user_username
  password     = var.anonymous_user_password

  attributes = {
    cpf            = var.anonymous_user_cpf
    email          = var.anonymous_user_email
    email_verified = true
  }
}
