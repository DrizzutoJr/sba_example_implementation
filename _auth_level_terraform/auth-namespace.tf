# Create the AUth Namespace for the single namespace strategy

############################################################
# The below module is a simple module that calls the 
# vault namespace resource
# It is simple and you can just use the resource below
# HOwever for your company you may require extra variables
# when you create a namespace and,
# can set them via creating a module
############################################################

module "auth-namespace" {
  source = "./_modules/_namespace"

  providers = {
    vault = vault.root
  }

  namespace_name = "auth"
}