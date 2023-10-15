# Output value definitions

############################################### [Cognito] Outputs

output "client_name" {
  description = "Cognito Client Name"

  value = aws_cognito_user_pool_client.client.name
}

output "client_id" {
  description = "Cognito ClientId"

  value = aws_cognito_user_pool_client.client.id
}

output "client_secret" {
  description = "Cognito Client Secret"

  value     = aws_cognito_user_pool_client.client.client_secret
  sensitive = true
}

output "cognito_url_login" {
  description = "Cognito Login Page"

  value = format(
    "https://%s.auth.%s.amazoncognito.com/login?response_type=code&client_id=%s&redirect_uri=%s",
    aws_cognito_user_pool_domain.cognito-domain.domain,
    "us-east-1",
    aws_cognito_user_pool_client.client.id,
    "https://example.com"
  )
}

output "cognito_idp" {
  description = "Cognito IDP"

  value = format(
    "https://cognito-idp.%s.amazonaws.com/%s/.well-known/openid-configuration",
    "us-east-1",
    aws_cognito_user_pool.user_pool.id
  )
}

output "cognito_user_pool_id" {
  description = "Cognito User Pool ID"

  value = aws_cognito_user_pool.user_pool.id
}

output "cognito_anonymous_user" {
  description = "Cognito Anonymous User"
  value = aws_cognito_user.anonymous.username
}

output "cognito_anonymous_user_password" {
  description = "Cognito Anonymous User Password"
  value = aws_cognito_user.anonymous.password
}

###############################################
