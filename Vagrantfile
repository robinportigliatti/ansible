# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # Configuration du primary
  config.vm.define "mathieu_computer" do |mathieu_computer|
    mathieu_computer.ssh.insert_key = false
    #postgres_server.vm.box = "debian/bullseye64"
    mathieu_computer.vm.box = "ubuntu/trusty64"
    mathieu_computer.vm.hostname = "mathieuvm"
    mathieu_computer.vm.network :private_network, ip: "192.168.55.11"
    mathieu_computer.vm.provider "virtualbox" do |v|
      v.cpus = 2
      v.memory = 1024
    end
    mathieu_computer.vm.provision "ansible" do |ansible|
      ansible.limit = "mathieu_vm"
      ansible.playbook = "ansible/install_dalibo.yml"
      ansible.compatibility_mode = '2.0'
      ansible.inventory_path = "ansible/inventories/dalibo/production/inventory"
      ansible.extra_vars = {
        inventory_hostname: "mathieu_vm"
      }
    end
  end
end # Vagrant.configure("2") do |config|
