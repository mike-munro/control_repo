#db server role
class role::db_server {
  include profile::base
  include profile::db
}
