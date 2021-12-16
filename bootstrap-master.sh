#!/bin/sh

# Run on VM to bootstrap Puppet Master server

if ps aux | grep "puppet master" | grep -v grep 2> /dev/null
then
    echo "Puppet Master is already installed. Exiting..."
else
    # Puppet Repo
    curl -O https://apt.puppetlabs.com/puppet6-release-focal.deb
    dpkg -i puppet6-release-focal.deb
    
    # Install Puppet Master
    apt-get update -yq
    apt-get install -yq puppetserver ruby-full

    # Configure /etc/hosts file
    echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "# Host config for Puppet Master and Agent Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.32.5    puppet.puppet.lab  puppet" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.32.10   node01.puppet.lab  node01" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.32.20   node02.puppet.lab  node02" | sudo tee --append /etc/hosts 2> /dev/null %% \
    echo "192.168.32.30   win01.puppet.lab  win01" | sudo tee --append /etc/hosts 2> /dev/null

    # Add optional alternate DNS names to /etc/puppet/puppet.conf
    /opt/puppetlabs/bin/puppet config set dns_alt_names 'puppet,puppet.munro.lab' --section main
    
    #Start Puppetserver
    systemctl start puppetserver
    systemctl enable puppetserver

    #status output
    systemctl status puppetserver
    echo ""
    
    #copy r10k
    mkdir /etc/puppetlabs/r10k
    cp /vagrant/r10k.yaml /etc/puppetlabs/r10k/r10k.yaml -f

    #install r10k via gem
    gem install r10k

    #run first repo pull
    r10k deploy environment production
fi
