# Configureation for the credstorev1 service

############################################################
# This file will create the credstorev1 service namespace 
# The kvstorev1 namespace is a child namespace of the auth,
# namespace inside the Auth Level so we need to use the,
# vault.auth provider to create it
# After that we will use the vault.credstorev1 provider to,
# to enable the secret engines in the service namespace
############################################################

# Create the kvstorev1 namespace in the Service Level

module "credstorev1-namespace" {
  source = "./_modules/_namespace"

  providers = {
    vault = vault.auth
  }

  namespace_name = "credstorev1"
}

############################################################
# At this moment time it is difficutl to create a,
# sub-module to handle secret engines so a we need to,
# use resources to enable them
# We will be setting up a KV version 2 Secret Engine
############################################################

resource "vault_mount" "credstorev1-kvv2" {
  provider = vault.credstorev1-provider

  depends_on = [module.credstorev1-namespace]

  path = "secrets/credstore"
  type = "kv-v2"
  description = "Secret Enigne for credstorev1 service"
}

############################################################
# Now that we have the namespace setup for people to use,
# we need to create a PV Authenticator that can provision,
# access to SV AUthenticators
# To do this we will use the provided sub-module that,
# creates the authenticator and policy in one block
# Remeber to create the policy for the provisioner as,
# well inside the _policies folder
# Both the PV Authenticator and policy live in the auth,
# namespace
############################################################

module "credstorev1-provisioner_approle" {
  source = "./_modules/_provisioner"

  providers = {
    vault = vault.auth
  }

  provisioner_name = "credstorev1-manual_provisioner"
  auth_engine_path = "provisioner_approle"
  ip_list = [] # in a production enviornment you should put 
  # the IPs of where this provisioner will be used
}