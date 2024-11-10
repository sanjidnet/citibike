module "bulk_warehouses" {
  source = "./modules/bulk_warehouses"

  warehouses = {
    dev_w     = { name = "DEV_WH" }
    tableau_w = { name = "TABLEAU_WH" }
    prod_w    = { name = "PROD_LOAD_WH" }
    source_w  = { name = "SOURCE_WH" }
  }
  default_size         = "x-small"
  default_auto_suspend = 60
}


