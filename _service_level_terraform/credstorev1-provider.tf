# The kvstore Provicer

############################################################
# kvstore is a child namespace of auth
# To allow secret engine 
############################################################

provider "vault" {

  alias = "auth"

  address = var.vault_address
  ca_cert_file = var.ca_cert_file

  namespace = "credstorev1"

  auth_login {
    path = var.operator_path

    parameters = {
      role_id = var.role_id
      secret_id = var.secret_id
    }
  }
}