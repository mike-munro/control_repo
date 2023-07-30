node default {
  }

node 'master.puppet.vm' {
  include role::master_server
}

node /^node01.*/ {
  include role::app_server
}

node 'win2016' {
  include role::app_server
}
