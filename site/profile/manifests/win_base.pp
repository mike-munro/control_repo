# Base profile for all linux
class profile::win_base {
  file { 'c://temp':
    encure => directory,
  }
  file { 'c://temp/README.txt':
    ensure  => file,
    content => 'This is a readme, some more info goes here',
    owner   => 'root',
  }
}
