module "bulk_roles" {
  source = "./modules/bulk_roles"

  roles = {
    source_r  = { name = "SOURCE_ROLE" }
    dev_r     = { name = "DEV_ROLE" }
    prod_r    = { name = "PROD_LOAD_ROLE" }
    tableau_r = { name = "TABLEAU_ROLE" }
    git_r     = { name = "GIT_ADMIN" }
    secret_r  = { name = "SECRET_ADMIN" }
  }
}

