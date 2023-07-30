node default {
  }

node 'master.puppet.vm' {
  include role::master_server
}

node /^node01.*/ {
  include role::app_server
}

node 'win2019' {
  include role::windows
}
