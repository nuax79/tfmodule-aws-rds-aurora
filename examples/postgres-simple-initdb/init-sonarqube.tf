# for sonarqube ---------------------------

resource "postgresql_role" "sonarqube" {
  name                      = "sonarqube"
  password                  = "password"
  login                     = true
  create_database           = true
  create_role               = false
  replication               = false
  bypass_row_level_security = false
  encrypted_password        = true
  inherit                   = true
  superuser                 = false

  depends_on = [ module.aurora ]
}

resource "postgresql_grant_role" "sonarqube" {
  role              = postgresql_role.sonarqube.name
  grant_role        = "rds_superuser"
  with_admin_option = true
  depends_on = [postgresql_role.sonarqube]
}

resource "postgresql_database" "sonarqube" {
  name          = "sonarqube"
  owner         = postgresql_role.sonarqube.name
  encoding      = "UTF8"
  lc_collate    = "en_US.UTF-8"
  lc_ctype      = "en_US.UTF-8"
  connection_limit  = -1
  allow_connections = true

  depends_on = [postgresql_grant_role.sonarqube]
}
