# authenticator_type = Operator
# date_created = <date>
# owner = Vault Operations
# desription = Policy for admin access that grants read access to everything


### Namespaces ###

# Auth Level namespaces
path "sys/namespaces" {
  capabilities = ["list"]
}

# Service Level namespaces
path "+/sys/namespaces" {
  capabilities = ["list"]
}

# Check to find namespaces that may be too many levels down
path "+/+/sys/namespaces" {
  capabilities = ["list"]
}


### Policies ###

# Operations Level Policies
path "sys/policies/acl" {
  capabilities = ["list"]
}
path "sys/policies/acl/*" {
  capabilities = ["read"]
}

# Auth Level Policies
path "+/sys/policies/acl" {
  capabilities = ["list"]
}
path "+/sys/policies/acl/*" {
  capabilities = ["read"]
}

# Service Level Policies
path "+/+/sys/policies/acl" {
  capabilities = ["list"]
}

# Should EGP Policies occur in Operations Level only
path "sys/policies/egp" {
  capabilities = ["list"]
}
path "sys/policies/egp/*" {
  capabilities = ["read"]
}


### Auth Engines ###

# Operations Level Auth Engines
path "sys/auth" {
  capabilities = ["list"]
}
path "sys/auth/*" {
  capabilities = ["read"]
}
path "auth/+/config" {
  capabilities = ["read"]
}

# Auth Level Auth Engines
path "+/sys/auth" {
  capabilities = ["list"]
}
path "+/sys/auth/*" {
  capabilities = ["read"]
}
path "+/auth/+/config" {
  capabilities = ["read"]
}

# Service Level Auth Engines
path "+/+/sys/auth" {
  capabilities = ["list"]
}

### Secret Engines ###

# Operations Level
path "sys/mounts" {
  capabilities = ["list"]
}

# Auth Level
path "sys/mounts" {
  capabilities = ["list"]
}
path "sys/mounts/*" {
  capabilities = ["delete"]
}

# Service Level
path "+/+/sys/mounts" {
  capabilities = ["list"]
}
path "+/+/sys/mounts/*" {
  capabilities = ["read"]
}
path "+/+/secrets/+/config" {
  capabilities = ["read"]
}


### Authenticators ###

# OP Authenticators inside Operations Level
path "auth/+/roles" {
  capabilities = ["list"]
}
path "auth/+/roles/*" {
  capabilities = ["read"]
}
path "auth/+/role" {
  capabilities = ["list"]
}
path "auth/+/role/*" {
  capabilities = ["read"]
}
path "auth/+/users" {
  capabilities = ["list"]
}
path "auth/+/users/*" {
  capabilities = ["read"]
}
path "auth/+/groups" {
  capabilities = ["list"]
}
path "auth/+/groups/*" {
  capabilities = ["read"]
}

# SC and PV AUthenticators inside Auth Level
path "+/auth/+/roles" {
  capabilities = ["list"]
}
path "+/auth/+/roles/*" {
  capabilities = ["read"]
}
path "+/auth/+/role" {
  capabilities = ["list"]
}
path "+/auth/+/role/*" {
  capabilities = ["read"]
}
path "+/auth/+/users" {
  capabilities = ["list"]
}
path "+/auth/+/users/*" {
  capabilities = ["read"]
}
path "+/auth/+/groups" {
  capabilities = ["list"]
}
path "+/auth/+/groups/*" {
  capabilities = ["read"]
}

# Non-Complaint Authenticators inside Service Level should be deleted if they exist
path "+/+/auth/+/roles" {
  capabilities = ["list"]
}
path "+/+/auth/+/roles/*" {
  capabilities = ["read"]
}
path "+/+/auth/+/role" {
  capabilities = ["list"]
}
path "++//auth/+/role/*" {
  capabilities = ["read"]
}
path "+/+/auth/+/users" {
  capabilities = ["list"]
}
path "+/+/auth/+/users/*" {
  capabilities = ["read"]
}
path "+/+/auth/+/groups" {
  capabilities = ["list"]
}
path "+/+/auth/+/groups/*" {
  capabilities = ["read"]
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
  capabilities = ["read"]
}
