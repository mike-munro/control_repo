# not used 
class profile::app {

xml_fragment { 'Hosts':
    ensure => 'present',
    path   => 'C:/hosts.xml',
    xpath  => '/hosts',
    purge  => true
}

xml_fragment { 'Localhost Host':
    ensure  => 'present',
    path    => '/tmp/hosts.xml',
    xpath   => "/hosts/host[@ip='127.0.0.1']",
    content => {
        value      => 'Localhost',
        attributes => {
            'ip' => '127.0.0.1'
        }
    }
}

}
