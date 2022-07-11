resource "postgresql_role" "gitlab" {
  name                      = "gitlab"
  login                     = true
  create_database           = true
  create_role               = false
  replication               = false
  bypass_row_level_security = false
  encrypted_password        = true
  inherit                   = true
  superuser                 = false
  password                  = "password"


  depends_on = [ module.aurora ]
}

resource "postgresql_grant_role" "gitlab" {
  role              = postgresql_role.gitlab.name
  grant_role        = "rds_superuser"
  with_admin_option = true
  depends_on = [postgresql_role.gitlab]
}

resource "postgresql_database" "gitlab" {
  name          = "gitlab_toolchain"
  owner         = postgresql_role.gitlab.name
  encoding      = "UTF8"
  lc_collate    = "en_US.UTF-8"
  lc_ctype      = "en_US.UTF-8"
  connection_limit  = -1
  allow_connections = true

  depends_on = [postgresql_grant_role.gitlab]
}
