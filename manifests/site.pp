node default {
  }

node 'master.puppet.vm' {
  include role::master_server
}

node /^node01.*/ {
  include role::app_server
}

node /^node02*/ {
  include role::db_server
}
