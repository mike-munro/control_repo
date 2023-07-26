# not used 
class profile::app {

xml_fragment { 'Hosts':
    ensure => 'present',
    path   => '/tmp/hosts.xml',
    xpath  => '/hosts',
    purge  => true
}
}
