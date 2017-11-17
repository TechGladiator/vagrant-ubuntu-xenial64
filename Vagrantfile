# -*- mode: ruby -*-
# vi: set ft=ruby :

# Anything related to getting ember.js set up is included below
$rootScriptBefore = <<SCRIPT
  # Include git and curl related commands here
  cd /home/ubuntu
  apt-get update
  # Install dependency to use make
  apt-get -y install build-essential
  # Install dependencies for watchman
  apt-get -y install python-dev
  apt-get -y install automake
SCRIPT

$userScript = <<SCRIPT
  cd /home/ubuntu
  # Install nvm as the default 'ubuntu' user
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
  # Enable nvm without a logout/login
  export NVM_DIR="/home/ubuntu/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  if ! command -v node >/dev/null 2>&1; then
    echo "Installing nodejs ..."
    # Install nodejs and alias
    nvm install v6.7.0
    nvm alias default 6.7.0
  fi
  if ! command -v ember >/dev/null 2>&1; then
    npm set progress=false
    # workaround to npm bug which cause it to hang
    npm install -g --verbose npm@latest
    npm update -verbose
    npm install -g --verbose bower@latest
    npm install -g --verbose ember-cli@2.6
    # set up project
    cd /home/ubuntu/project/webroot
    npm install --no-bin-links --verbose || npm install --no-bin-links --verbose
    bower install --verbose
  else
    cd /home/ubuntu/project/webroot
    npm install --no-bin-links --verbose
    bower install --verbose
  fi
SCRIPT

$rootScriptAfter = <<SCRIPT
  if ! command -v watchman >/dev/null 2>&1; then
    git clone https://github.com/facebook/watchman.git
    cd watchman
    ./autogen.sh
    ./configure
    make
    make install
  fi
SCRIPT

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_version = '>= 20171116.0.0'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 4200, host: 4200
  config.vm.network "forwarded_port", guest: 7200, host: 7200

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
