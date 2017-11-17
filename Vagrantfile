# -*- mode: ruby -*-
# vi: set ft=ruby :

# Anything related to getting ember.js set up is included below
$rootScriptBefore = <<SCRIPT
  # Include git and curl related commands here
  add-apt-repository ppa:git-core/ppa
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
  echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
  echo "apt-get update"
  apt-get update
  echo "Installing git ..."
  apt install -y git
  echo "Installing MongoDB ..."
  apt install -y mongodb-org
  mkdir /data/
  mkdir /data/db
  chmod 777 /data/db
  systemctl enable mongod.service
  service mongod start
  cd /home/ubuntu
  # # Install dependency to use make
  echo "Installing build-essential ..."
  apt -y install build-essential
  # # Install dependencies for watchman
  echo "Installing python-dev ..."
  apt -y install python-dev
  echo "Installing automake ..."
  apt -y install automake
  apt -y install libtool
  apt -y install pkg-config
  apt -y install libssl-dev
SCRIPT
  
$userScript = <<SCRIPT
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
  git config --global credential.helper cache
  git config --global credential.helper 'cache --timeout=3600'
  cd /home/ubuntu
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  echo "Installing nodejs ..."
  sudo apt install -y nodejs
  mkdir ~/.npm-global
  npm config set prefix '~/.npm-global'
  echo 'export PATH=~/.npm-global/bin:$PATH' >> /home/ubuntu/.profile
  source ~/.profile
  echo "updating npm ..."
  npm set progress=false
  # workaround to npm bug which cause it to hang
  npm i -g --verbose npm@latest
  echo "install bower ..."
  npm i -g --verbose bower@latest
  echo "install ember-cli ..."
  npm i -g --verbose ember-cli@2.16
SCRIPT

$rootScriptAfter = <<SCRIPT
  cd /home/ubuntu/project
  git clone https://github.com/facebook/watchman.git
  cd watchman
  ./autogen.sh
  ./configure
  make
  make install
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
  config.vm.network "forwarded_port", guest: 7200, host: 7020

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
  config.vm.synced_folder "./", "/home/ubuntu/project", :nfs => true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  cpus = "1"
  memory = "1024"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cpus", cpus, "--memory", memory]
    vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"] # speed up boot https://bugs.launchpad.net/cloud-images/+bug/1627844
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  end
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

  # Shell provisioning
  config.vm.provision "shell", inline: $rootScriptBefore
  config.vm.provision "shell", inline: $userScript, privileged: false
  config.vm.provision "shell", inline: $rootScriptAfter
end