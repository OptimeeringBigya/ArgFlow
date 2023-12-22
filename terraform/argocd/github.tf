resource "tls_private_key" "argo_key" {
  algorithm = "RSA"
}

resource "github_repository_deploy_key" "argo_deploy_key" {
  key        = tls_private_key.argo_key.public_key_openssh
  repository = "https://github.com/OptimeeringBigya/ArgFlow"
  title      = "argo_deploy_key"
}