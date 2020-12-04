# authenticator_type = Provisioner
# date_created = <date>
# owner = credstorev1 owner
# desription = Policy for credstorev1 that provisions Service Customers access

############################################################
# This Provisioner will perform all the steps required in,
# the Vault instance to provisoner a Serivce Customer,
# inside Vault
# This policy (and PV authenticator attached) will exist in,
# the auth level namespace, so permissions should start,
# from their
############################################################

# Process :
# 1 - Create SC Authenticator for Service Customer to use
# for thei application name
# 2 - Create policy for SC Authenticator that will grant 
# list access to all the secrets inside their kvv2 domain
# 3 - Create approle that Service Customer can plug into
# Secret Interface to create/update secrets

# Permission to manage a UserPass SC Authenticator for the Service Customer
# All SC Authenticators for the credstorev1 will begin with "kvstorev1"
# Since this SC Authenticator is for the application manager we will
# include "manager" in the name
path "auth/userpass/users" {
  capabilities = ["list"]
}
path "auth/userpass/users/credstorev1-manager-*" {
  capabilities = ["create", "update", "delete"]
}

# Permission to manage create policy to assign to above SC Authenticator
path "sys/policies/acl/credstorev1-manager-*" {
  capabilities = ["create", "update", "delete"]
}

# Permission to create the approle that will be used in the Secret Interface
# This will be a provisioner since it is making changes to the vault instance
# The Service Customer will be able to read the credentials for the 
# provisioner but will NOT be able to use it because the provisioner will
# be locked down by IP address
# Instead the Service Customer will be able to authenticate to Vault and get
# the credentials that they can then plug into the Secret Interface
path "sys/provisioner_approle/role/credstore-provisioner-*" {
  capabilities = ["create", "update", "delete"]
}

# Permission to create policy for above provisioner
path "sys/policies/acl/credstorev1-provisioner-*" {
  capabilities = ["create", "update", "delete"]
}