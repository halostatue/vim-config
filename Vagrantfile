# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

provision = <<-EOS
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y git zsh rake ruby-dev
sudo locale-gen en_CA.UTF-8
sudo chsh -s/bin/zsh vagrant

as_vagrant() {
  su -c "${*}" vagrant
}

rm -rf .dotfiles
as_vagrant "cd ~vagrant && git clone https://github.com/halostatue/dotfiles .dotfiles"
as_vagrant "cd ~vagrant/.dotfiles && git checkout halozsh-binary-experiment"
as_vagrant "cd ~vagrant/.dotfiles && bin/halozsh bootstrap"
as_vagrant "cd ~vagrant/.dotfiles && bin/halozsh install --force"

rm -f .vim-config
as_vagrant ln -s /vagrant ~vagrant/.vim-config

sudo apt-get autoremove -y
EOS

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider 'virtualbox' do |v|
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.provision :shell, inline: provision

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
end
