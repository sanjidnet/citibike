terraform {
  required_version = ">=0.14"
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.88.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">=0.7.0"
    }
  }
}

// application database
resource "snowflake_database" "app" {
  name                        = local.database_name
  data_retention_time_in_days = 30
  comment                     = var.description
}

resource "snowflake_schema" "schema" {
  for_each            = local.schemas
  name                = each.key
  database            = local.database_name
  data_retention_days = 30
  depends_on = [snowflake_database.app,
    snowflake_role.admin, snowflake_role_grants.admin,
    snowflake_role.reader, snowflake_role_grants.reader,
  ]
}

// application admin and reader roles
resource "snowflake_role" "admin" {
  name    = local.admin_role_name
  comment = var.description
}

resource "snowflake_role_grants" "admin" {
  role_name = snowflake_role.admin.name
  roles     = var.grant_admin_to_roles
  users     = local.grant_admin_to_users
}

resource "snowflake_role" "reader" {
  name    = local.reader_role_name
  comment = var.description
}

resource "snowflake_role_grants" "reader" {
  count = local.create_reader_role_grants

  role_name = snowflake_role.reader.name
  roles     = var.grant_read_to_roles
  users     = var.grant_read_to_users
}

