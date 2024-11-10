locals {
  public_role   = "PUBLIC"
  dev_role      = "DEV_ROLE"
  dev_warehouse = "DEV_WH"

  // sanjidr is the overall account owner and should not be referenced here
  // TERRAFORM_USER is created manually and used to run this code
  // sso_users are controlled via idp but need to be referenced here
  // admins are created with a password
  // consultants are created and can be removed at some future stage
  // TABLEAU and COALESCE are system users, used by the respective applications
  sso_users = {
    "RICHARD" = {
      name         = "Richard_Hendrix"
      login_name   = "richard@piedpiper.com"
      email        = "richard@piedpiper.com"
      first_name   = "Richard"
      last_name    = "Hendrix"
      display_name = "Richard Hendrix"
    }
  }

  consultants = {
    "SANJID" = {
      name       = "Sanjid Rahman"
      login_name = "sanjid_rahman"
      email      = "contact@sanjid.net"
    }
  }

  system_users = {
    "TABLEAU_USER" = {}
    "SOURCE_USER"  = {}
    "LOAD_USER"    = {}
  }

  schemas = ["LOAD", "STAGE", "ODS", "MODEL"]
}

