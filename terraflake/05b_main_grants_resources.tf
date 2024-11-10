module "bulk_warehouse_grants" {
  source = "./modules/bulk_warehouse_grants"

  grants = {
    source_r = {
      warehouse_name = module.bulk_warehouses.warehouses["source_w"].name
      roles          = [module.bulk_roles.roles["source_r"].name]
    }
    dev_r = {
      warehouse_name = module.bulk_warehouses.warehouses["dev_w"].name
      roles          = [module.bulk_roles.roles["dev_r"].name]
    }
    tableau_r = {
      warehouse_name = module.bulk_warehouses.warehouses["tableau_w"].name
      roles          = [module.bulk_roles.roles["tableau_r"].name]
    }
    prod_r = {
      warehouse_name = module.bulk_warehouses.warehouses["prod_w"].name
      roles          = [module.bulk_roles.roles["prod_r"].name]
    }
  }
}

