#master puppet server role
class role::master_server {
include profile::base
#include profile::agent_nodes
}
