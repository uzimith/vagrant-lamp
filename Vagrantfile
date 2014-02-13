# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v0.1.0/centos64-x86_64-20131030.box"

  config.vm.network :private_network, ip: "192.168.33.10"

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./site-cookbooks","./cookbooks"]
    chef.roles_path = "roles"
    chef.data_bags_path = "data_bags"

    chef.add_recipe "yum-epel"
    chef.add_recipe "yum-remi"
    chef.add_recipe "php"
    chef.add_recipe "apache2"
    chef.add_recipe "apache2::mod_php5"
    chef.add_recipe "mysql::server"
    chef.add_recipe "database"
    chef.add_recipe "iptables"
    chef.add_recipe "create-virtualhost"
    chef.json = {
      mysql: {
        server_root_password: "greatpass",
        server_repl_password: "greatpass",
        server_debian_password: "greatpass",
        bind_address: "127.0.0.1"
      },
      vhost: {
        fqdn: "vagrant",
        root_dir: "/vagrant/html/",
        db: "app",
        db_user: "app",
        db_pass: "greatpass"
      }
    }
  end
end
