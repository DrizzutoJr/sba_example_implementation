# authenticator_type = Operator
# date_created = <date>
# owner = Vault Operations
# desription = Policy for admin access that grants access to everything


### Namespaces ###

# Auth Level namespaces
path "sys/namespaces" {
  capabilities = ["list"]
}
path "sys/namespaces/*" {
  capabilities = ["read", "create", "update", "delete", "destroy", "sudo"]
}

# Service Level namespaces
path "+/sys/namespaces" {
  capabilities = ["list"]
}
path "+/sys/namespaces/*" {
  capabilities = ["read", "create", "update", "delete", "destroy", "sudo"]
}

# Check to find namespaces that may be too many levels down
path "+/+/sys/namespaces" {
  capabilities = ["list"]
}
path "+/+/sys/namespaces/*" {
  capabilities = ["delete"]
}


### Policies ###

# Operations Level Policies
path "sys/policies/acl" {
  capabilities = ["list"]
}
path "sys/policies/acl/*" {
  capabilities = ["read", "create", "update", "delete"]
}

# Auth Level Policies
path "+/sys/policies/acl" {
  capabilities = ["list"]
}
path "+/sys/policies/acl/*" {
  capabilities = ["read", "create", "update", "delete"]
}

# Service Level Policies - there should be none so ablity to list and delete only
path "+/+/sys/policies/acl" {
  capabilities = ["list"]
}
path "+/+/sys/policies/acl/*" {
  capabilities = ["delete"]
}

# Should EGP Policies occur in Operations Level only
path "sys/policies/egp" {
  capabilities = ["list"]
}
path "sys/policies/egp/*" {
  capabilities = ["read", "create", "update", "delete"]
}


### Auth Engines ###

# Operations Level Auth Engines
path "sys/auth" {
  capabilities = ["list"]
}
path "sys/auth/*" {
  capabilities = ["read", "create", "update", "delete"]
}
path "auth/+/config" {
  capabilities = ["read", "create", "update", "delete"]
}

# Auth Level Auth Engines
path "+/sys/auth" {
  capabilities = ["list"]
}
path "+/sys/auth/*" {
  capabilities = ["read", "create", "update", "delete"]
}
path "+/auth/+/config" {
  capabilities = ["read", "create", "update", "delete"]
}

# Service Level Auth Engines - there should be none so ability to list and delete only
path "+/+/sys/auth" {
  capabilities = ["list"]
}
path "+/sys/auth/*" {
  capabilities = ["delete"]
}


### Secret Engines ###

# Operations Level - there should be none so ability to list and delete only
path "sys/mounts" {
  capabilities = ["list"]
}
path "sys/mounts/*" {
  capabilities = ["delete"]
}

# Auth Level - there should be none so ability to list and delete only
path "sys/mounts" {
  capabilities = ["list"]
}
path "sys/mounts/*" {
  capabilities = ["delete"]
}

# Service Level - create on secrets/ only but delete give to broader access
path "+/+/sys/mounts" {
  capabilities = ["list"]
}
path "+/+/sys/mounts/secrets/*" {
  capabilities = ["read", "create", "update"]
}
path "+/+/sys/mounts/*" {
  capabilities = ["delete"]
}
path "+/+/secrets/+/config" {
  capabilities = ["read", "create", "update", "delete"]
}


### Authenticators ###

# OP Authenticators inside Operations Level
path "auth/+/roles" {
  capabilities = ["list"]
}
path "auth/+/roles/*" {
  capabilities = ["read", "create", "update", "delete"]
}
path "auth/+/role" {
  capabilities = ["list"]
}
path "auth/+/role/*" {
  capabilities = ["read", "create", "update", "delete"]
}
path "auth/+/users" {
  capabilities = ["list"]
}
path "auth/+/users/*" {
  capabilities = ["read", "create", "update", "delete"]
}
path "auth/+/groups" {
  capabilities = ["list"]
}
path "auth/+/groups/*" {
  capabilities = ["read", "create", "update", "delete"]
}

# SC and PV AUthenticators inside Auth Level
path "+/auth/+/roles" {
  capabilities = ["list"]
}
path "+/auth/+/roles/*" {
  capabilities = ["read", "create", "update", "delete"]
}
path "+/auth/+/role" {
  capabilities = ["list"]
}
path "+/auth/+/role/*" {
  capabilities = ["read", "create", "update", "delete"]
}
path "+/auth/+/users" {
  capabilities = ["list"]
}
path "+/auth/+/users/*" {
  capabilities = ["read", "create", "update", "delete"]
}
path "+/auth/+/groups" {
  capabilities = ["list"]
}
path "+/auth/+/groups/*" {
  capabilities = ["read", "create", "update", "delete"]
}

# Non-Complaint Authenticators inside Service Level should be deleted if they exist
path "+/+/auth/+/roles" {
  capabilities = ["list"]
}
path "+/+/auth/+/roles/*" {
  capabilities = ["read", "delete"]
}
path "+/+/auth/+/role" {
  capabilities = ["list"]
}
path "++//auth/+/role/*" {
  capabilities = ["read", "delete"]
}
path "+/+/auth/+/users" {
  capabilities = ["list"]
}
path "+/+/auth/+/users/*" {
  capabilities = ["read","delete"]
}
path "+/+/auth/+/groups" {
  capabilities = ["list"]
}
path "+/+/auth/+/groups/*" {
  capabilities = ["read", "delete"]
}


#######################################################################
# Below section is for Sys path permissions.
# You should go through and add ones that are required for your company
# This is dependent on what the Operations team plans to support
# https://www.vaultproject.io/api-docs/system
#######################################################################


### Audit Engine ###

path "sys/audit" {
  capabilities = ["list"]
}

path "sys/audit/*" {
  capabilities = ["read", "create", "update", "delete"]
}
