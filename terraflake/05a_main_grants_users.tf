
// GRANTS
// Grants on core roles and warehouses need to be performed
// after all resources are defined and created.
module "sso_role_grants" {
  source = "./modules/bulk_role_grants"

  grants = {
    tableau_r = {
      role_name = module.bulk_roles.roles["tableau_r"].name
      users     = [module.sso_users.users["RICHARD"].name]
    }
    dev_r = {
      role_name = module.bulk_roles.roles["dev_r"].name
      users     = [module.sso_users.users["RICHARD"].name]
    }
  }
}

module "consultant_role_grants" {
  source = "./modules/bulk_role_grants"

  grants = {
    tableau_r = {
      role_name = module.bulk_roles.roles["tableau_r"].name
      users     = [module.consultants.users["SANJID"].name]
    }
    dev_r = {
      role_name = module.bulk_roles.roles["dev_r"].name
      users     = [module.consultants.users["SANJID"].name]
    }
  }
}

module "git_integration_grants" {
  source = "./modules/bulk_role_grants"

  grants = {
    secret_r = {
      role_name = module.bulk_roles.roles["secret_r"].name
      roles = [module.bulk_roles.roles["dev_r"].name,
        module.bulk_roles.roles["prod_r"].name
      ]
    }
    git_r = {
      role_name = module.bulk_roles.roles["git_r"].name
      roles = [module.bulk_roles.roles["dev_r"].name,
        module.bulk_roles.roles["prod_r"].name
      ]
    }
  }
}

module "system_role_grants" {
  source = "./modules/bulk_role_grants"

  grants = {
    source_r = {
      role_name = module.bulk_roles.roles["source_r"].name
      users     = [module.system_users.users["SOURCE_USER"].name]
    }
    tableau_r = {
      role_name = module.bulk_roles.roles["tableau_r"].name
      users     = [module.system_users.users["TABLEAU_USER"].name]
    }
    prod_r = {
      role_name = module.bulk_roles.roles["prod_r"].name
      users     = [module.system_users.users["LOAD_USER"].name]
    }
  }
}
