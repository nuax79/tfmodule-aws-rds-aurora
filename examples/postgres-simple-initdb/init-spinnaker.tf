resource "postgresql_role" "spinnaker_cloud_driver" {
  name                      = "clouddriver"
  login                     = true
  create_database           = true
  create_role               = false
  replication               = false
  bypass_row_level_security = false
  encrypted_password        = true
  inherit                   = true
  superuser                 = false
  password                  = "spinnaker!234"

  depends_on = [ module.aurora ]
}


resource "postgresql_database" "spinnaker_cloud_driver" {
  name              = "clouddriver"
  owner             = postgresql_role.spinnaker_cloud_driver.name
  encoding          = "UTF8"
  lc_collate        = "en_US.UTF-8"
  lc_ctype          = "en_US.UTF-8"
  connection_limit  = -1
  allow_connections = true

  depends_on = [postgresql_role.spinnaker_cloud_driver]
}

resource "postgresql_grant" "spinnaker_cloud_driver" {
  database          = postgresql_database.spinnaker_cloud_driver.name
  role              = postgresql_role.spinnaker_cloud_driver.name
  schema            = "public"
  object_type       = "database"
  privileges        = ["ALL"]
}

resource "postgresql_role" "spinnaker_cloud_front50" {
  name                      = "front50"
  login                     = true
  create_database           = true
  create_role               = false
  replication               = false
  bypass_row_level_security = false
  encrypted_password        = true
  inherit                   = true
  superuser                 = false
  password                  = "spinnaker!234"

  depends_on = [ module.aurora ]
}

resource "postgresql_database" "spinnaker_cloud_front50" {
  name              = "front50"
  owner             = postgresql_role.spinnaker_cloud_front50.name
  encoding          = "UTF8"
  lc_collate        = "en_US.UTF-8"
  lc_ctype          = "en_US.UTF-8"
  connection_limit  = -1
  allow_connections = true

  depends_on = [postgresql_role.spinnaker_cloud_front50]
}

resource "postgresql_grant" "spinnaker_cloud_front50" {
  database          = postgresql_database.spinnaker_cloud_front50.name
  role              = postgresql_role.spinnaker_cloud_front50.name
  schema            = "public"
  object_type       = "database"
  privileges        = ["ALL"]
}


resource "postgresql_role" "spinnaker_orca" {
  name                      = "orca"
  login                     = true
  create_database           = true
  create_role               = false
  replication               = false
  bypass_row_level_security = false
  encrypted_password        = true
  inherit                   = true
  superuser                 = false
  password                  = "spinnaker!234"

  depends_on = [ module.aurora ]
}

resource "postgresql_database" "spinnaker_orca" {
  name              = "orca"
  owner             = postgresql_role.spinnaker_orca.name
  encoding          = "UTF8"
  lc_collate        = "en_US.UTF-8"
  lc_ctype          = "en_US.UTF-8"
  connection_limit  = -1
  allow_connections = true

  depends_on = [postgresql_role.spinnaker_orca]
}

resource "postgresql_grant" "spinnaker_orca" {
  database          = postgresql_database.spinnaker_orca.name
  role              = postgresql_role.spinnaker_orca.name
  schema            = "public"
  object_type       = "database"
  privileges        = ["ALL"]
}

