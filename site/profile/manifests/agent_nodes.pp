# Docker Agent Profile
# Contains the docker containers for puppet practice
class profile::agent_nodes {
  include dockeragent
  dockeragent::node {'web.puppet.vm':}
  dockeragent::node {'db.puppet.vm':}
}
