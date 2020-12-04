# The auth Provicer

############################################################
# Terraform handles Vault AUthenitcation strangely
# Instead of being able to use a token to perform actions,
# terraform will create sub-tokens that can only access the 
# namespace you set in your provider file
# So to allow us to operate in multiple namespaces,
# we need to create a provider for every namespace 
# we want our Terraform to be able to access
############################################################

provider "vault" {

  alias = "auth"

  address = var.vault_address
  ca_cert_file = var.ca_cert_file

  namespace = "auth"

  auth_login {
    path = var.operator_path

    parameters = {
      role_id = var.role_id
      secret_id = var.secret_id
    }
  }
}