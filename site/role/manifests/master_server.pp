class role::master_server {
include profile::base
include profile::agent_nodes
include profile::db
include profile::app
include profile::web
}
