Vagrant.configure("2") do |config|
  config.vm.define "chef-server" do |subconfig|
    subconfig.vm.box = "./sbeliakou_centos.box"
    subconfig.vm.hostname = "chef-server"
    subconfig.vm.network :private_network, ip: "192.168.56.10"
    config.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.name="chef-server"
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "chefnode1" do |subconfig|
    subconfig.vm.box = "./sbeliakou_centos.box"
    subconfig.vm.hostname = "chefnode1"
    subconfig.vm.network :private_network, ip: "192.168.56.11"
    config.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.name="chefnode1"
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "chefnode2" do |subconfig|
    subconfig.vm.box = "./sbeliakou_centos.box"
    subconfig.vm.hostname = "chefnode2"
    subconfig.vm.network :private_network, ip: "192.168.56.12"
    config.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.name="chefnode2"
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end
end

