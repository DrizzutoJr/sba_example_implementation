# authenticator_type = Operator
# date_created = <date>
# owner = Vault Operations
# desription = Policy assigned to Terraform OP Authenticator that Manages the Auth Level


### Terraform Policies need ability to create token ###

path "auth/token/create" {
  capabilities = ["read", "create", "update", "delete"]
}

path "auth/token/lookup-self" {
  capabilities = ["read"]
}


### Manage Child Namespaces in the Auth Level ###

path "sys/namespaces/*" {
  capabilities = ["read", "create", "update", "delete"]
}


### Manage Auth Engines inside the Auth Level ###

path "+/sys/auth" {
  capabilities = ["list"]
}

path "+/sys/auth/*" {
  capabilities = ["read", "create", "update", "delete"]
}

path "+/auth/+/config" {
  capabilities = ["read", "create", "update", "delete"]
}


### Ability to create policies inside Root Namespace for Operators to manage Auth Levels ###

path "sys/policies/acl/*" {
  capabilities = ["read", "create", "update", "delete"]
}