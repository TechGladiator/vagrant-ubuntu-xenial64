# vagrant-ubuntu-xenial64
A Vagrantfile and provisioning script to setup a Vagrant box with the latest Git, Node, and MongoDB on Ubuntu 16.04.

Requires [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/).

I also recommend [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) to insure the that your guest additions get updated properly.

## After installing vagrant

```bash
$ vagrant plugin install vagrant-vbguest
```

## Setup

Copy `Vagrantfile` and `bootstrap.sh` to the directory you want to share with and run the Vagrant box from.

Open the directory in your terminal, console or command line.

```bash
$ Vagrant Up
```

Once your Vagrant box is booted and has completed provisioning:

```bash
$ vagrant ssh
```

This will log you into your vagrant box, where you can perform or run anything that you would normally in an Ubuntu 16.04 bash terminal.

The bootstrap.sh provisioning script will make sure the latest versions of git, nodejs, and mongoDB are installed, including setting up proper permissions for Mongo and NPM.

To reboot:

```bash
$ vagrant reload
```

To reboot and provision or re-provision:

```bash
$ vagrant reload --provision
```

To suspend:

```bash
$ vagrant suspend
```

To shutdown (halt):

```bash
$ vagrant halt
```

To remove the virtual machine and all traces of it:

```bash
$ vagrant destroy
```

To learn more about Vagrant, see this [Getting Started Guide](https://www.vagrantup.com/intro/getting-started/index.html).