
// APPLICATION DATABASES
// databases (and system users) to be leveraged for a single purpose
module "analytics_db" {
  source = "./modules/application_database"

  for_each = toset(["PROD"])

  database_name        = "${each.value}_DB"
  schemas              = local.schemas
  grant_admin_to_roles = ["${each.value}_LOAD_ROLE"]
  grant_read_to_roles  = [module.bulk_roles.roles["tableau_r"].name]
}


module "source_db" {
  source = "./modules/application_database"

  for_each = toset(["SOURCE"])

  database_name = "${each.value}_DB"
  grant_admin_to_roles = ["${each.value}_ROLE",
    module.bulk_roles.roles["source_r"].name,
  ]
  schemas = ["RAW"]
  grant_read_to_roles = [
    module.bulk_roles.roles["dev_r"].name,
    module.bulk_roles.roles["prod_r"].name,
    module.bulk_roles.roles["tableau_r"].name
  ]
}

module "dev_db" {
  source = "./modules/application_database"

  database_name                = "DEV_DB"
  schemas                      = local.schemas
  create_application_user      = false
  create_application_warehouse = false
  grant_admin_to_roles = [
    module.bulk_roles.roles["dev_r"].name
  ]
}


module "util_db" {
  source        = "./modules/application_database"
  database_name = "UTIL_DB"
  schemas       = ["NOTEBOOK", "STREAMLIT", "STAGES", "SAMPLE_DATA", "INTEGRATIONS", "MONITORING"]
  grant_admin_to_roles = [
    module.bulk_roles.roles["tableau_r"].name,
    module.bulk_roles.roles["dev_r"].name,
    module.bulk_roles.roles["prod_r"].name
  ]
  grant_read_to_roles = [
    module.bulk_roles.roles["git_r"].name,
    module.bulk_roles.roles["secret_r"].name
  ]
}

