# Enable Auth Engines inside the auth namepsace in the Auth Level

############################################################
# This file will create and configure all the auth engines,
# used inside our Single Namespace auth namespace we created
# Auth Engines in terraform can have their own resources,
# configuration so we use the sub-module "auth_engine" to,
# create the auth engine and then use the proper resource,
# in terraform to confiugre it
############################################################

module "auth-user_pass" {
  source = "./_modules/_auth_engine"

  providers = {
    vault = vault.auth
  }

  type = "userpass"
  path = "userpass"
  description = "User&Pass Auth Engine for SC Authenticators"
}

module "auth-provisioner_approle" {
  source = "./_modules/_auth_engine"

  providers = {
    vault = vault.auth
  }

  type = "approle"
  path = "provisioner_approle"
  description = "Approle Auth Engine for PV Authenticators"
}

module "auth-approle" {
  source = "./_modules/_auth_engine"

  providers = {
    vault = vault.auth
  }

  type = "approle"
  path = "approle"
  description = "Approle Auth Engine for SC Authenticators"
}
