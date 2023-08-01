#!/bin/sh

# Run on VM to bootstrap Puppet Agent nodes

if ps aux | grep "puppet agent" | grep -v grep 2> /dev/null
then
    echo "Puppet Agent is already installed. Moving on..."
else
    hostname node01
    curl -O https://apt.puppet.com/puppet-release-focal.deb
    apt-get install ./puppet-release-focal.deb
    apt-get update
    sudo apt-get install -yq puppet-agent
fi

if cat /etc/crontab | grep puppet 2> /dev/null
then
    echo "Puppet Agent is already configured. Exiting..."
else
    /opt/puppetlabs/bin/puppet resource cron puppet-agent ensure=present user=root minute=30

    /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

    # Configure /etc/hosts file
    echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "# Host config for Puppet Master and Agent Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.32.5    master  master" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.32.10   node01  node01" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.32.30   win01016 win01016" | sudo tee --append /etc/hosts 2> /dev/null

    # Add agent section to /etc/puppet/puppet.conf
    echo "" && echo "[agent]" | sudo tee --append /etc/puppetlabs/puppet/puppet.conf 2> /dev/null
    echo "" && echo "server=master" | sudo tee --append /etc/puppetlabs/puppet/puppet.conf 2> /dev/null

    /opt/puppetlabs/bin/puppet agent --enable
fi