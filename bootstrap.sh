rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
yum install -y puppetserver git vim
cp /vagrant/r10k.yaml /etc/puppetlabs/r10k/r10k.yaml -f