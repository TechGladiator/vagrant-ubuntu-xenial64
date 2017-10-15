# vagrant-ubuntu-xenial64
A Vagrantfile and provisioning script to setup a Vagrant box with the latest Git, Node, and MongoDB on Ubuntu 16.04.

Requires [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/). I also recommend [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) to insure the that your guest additions get updated properly.

Copy `Vagrantfile` and `bootstrap.sh` to the directory you want to share with and run your Vagrant box from.

Open the directory in your terminal and enter `Vagrant Up`.

To learn more about Vagrant, see this [Getting Started Guide](https://www.vagrantup.com/intro/getting-started/index.html).

If anyone knows how to get NPM to install automatically with permissions fixed through provisioning, please submit a pull request! 😃