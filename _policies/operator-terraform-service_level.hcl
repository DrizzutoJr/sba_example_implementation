# authenticator_type = Operator
# date_created = <date>
# owner = Vault Operations
# desription = Policy assigned to Terraform OP Authenticator that Manages the Service Level


### Terraform Policies need ability to create token ###

path "auth/token/create" {
  capabilities = ["read", "create", "update", "delete"]
}

path "auth/token/lookup-self" {
  capabilities = ["read"]
}


### Manage Child Namespaces in the Service Level ###

path "+/sys/namespaces/*" {
  capabilities = ["read", "create", "update", "delete"]
}


### Manage Secret Engines inside the Service Level ###

path "+/+/sys/mounts" {
  capabilities = ["list"]
}

# Please note that "secrets" is not required, but a best practive for Secret Enignes in the Service Based Approach
path "+/+/sys/mounts/secrets/*" {
  capabilities = ["read", "create", "update", "delete"]
}

path "+/+/secrets/+/config" {
  capabilities = ["read", "create", "update", "delete"]
}


### Ability to Create policies inside Root Namespace for Operators to manage Service Level

path "sys/policies/acl/*" {
  capabilities = ["read", "create", "update", "delete"]
}


### Manage Provisioners in the Auth Level ###

path "+/auth/+/roles/*" {
  capabilities = ["read", "create", "update", "delete"]
}

path "+/auth/+/role/*" {
  capabilities = ["read", "create", "update", "delete"]
}

path "+/auth/+/users/*" {
  capabilities = ["read", "create", "update", "delete"]
}

path "+/auth/+/groups/*" {
  capabilities = ["read", "create", "update", "delete"]
}