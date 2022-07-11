
resource "postgresql_role" "harbor" {
  name                      = "harbor"
  login                     = true
  create_database           = true
  create_role               = false
  replication               = false
  bypass_row_level_security = false
  encrypted_password        = true
  inherit                   = true
  superuser                 = false
  password                  = "harbor!234"
  # roles                     = [ "root" ]

  depends_on = [ module.aurora ]
}

resource "postgresql_grant_role" "harbor" {
  role              = postgresql_role.harbor.name
  grant_role        = "rds_superuser"
  with_admin_option = true
  depends_on = [postgresql_role.harbor]
}

resource "postgresql_database" "registry" {
  name          = "registry"
  owner         = postgresql_role.harbor.name
  encoding      = "UTF8"
  lc_collate    = "en_US.UTF-8"
  lc_ctype      = "en_US.UTF-8"
  connection_limit  = -1
  allow_connections = true

  depends_on = [postgresql_grant_role.harbor]
}

resource "postgresql_database" "notary_server" {
  name          = "notary_server"
  owner         = postgresql_role.harbor.name
  encoding      = "UTF8"
  lc_collate    = "en_US.UTF-8"
  lc_ctype      = "en_US.UTF-8"
  connection_limit  = -1
  allow_connections = true

  depends_on = [postgresql_grant_role.harbor]
}

resource "postgresql_database" "notary_signer" {
  name          = "notary_signer"
  owner         = postgresql_role.harbor.name
  encoding      = "UTF8"
  lc_collate    = "en_US.UTF-8"
  lc_ctype      = "en_US.UTF-8"
  connection_limit  = -1
  allow_connections = true

  depends_on = [postgresql_grant_role.harbor]
}