// CORE RESOURCES
// This section generates base roles, warehouses and users
// It does NOT create grants between these resources
module "sso_users" {
  source = "./modules/bulk_users"

  users             = local.sso_users
  default_role      = local.public_role
  default_warehouse = local.dev_warehouse
}

module "consultants" {
  source = "./modules/bulk_users"

  users                        = local.consultants
  default_role                 = local.dev_role
  default_warehouse            = local.dev_warehouse
  default_must_change_password = true
}

module "system_users" {
  source = "./modules/bulk_users"

  users        = local.system_users
  default_role = local.public_role
}


