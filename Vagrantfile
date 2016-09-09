# -*- mode: ruby -*-
# vi: set ft=ruby :
#^syntax detection

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #config.vm.box = "hashicorp/precise64"
  config.vm.box = "ubuntu/trusty64"

  config.vm.define "consul1" do |consul1|
	config.vm.provision "shell" do |s|
		s.path = "provision.sh"
		s.args   = ["/vagrant/consul1/config.json"]
	end
  consul1.vm.hostname = "consul1.example.com"
	consul1.vm.network "private_network", ip: "172.20.20.10"
  end

  config.vm.define "consul2" do |consul2|
	config.vm.provision "shell" do |s|
		s.path = "provision.sh"
		s.args   = ["/vagrant/consul2/config.json"]
	end
  consul2.vm.hostname = "consul2.example.com"
	consul2.vm.network "private_network", ip: "172.20.20.20"
  end

  config.vm.define "consul3" do |consul3|
	config.vm.provision "shell" do |s|
		s.path = "provision.sh"
		s.args   = ["/vagrant/consul3/config.json"]
	end
  consul3.vm.hostname = "consul3.example.com"
	consul3.vm.network "private_network", ip: "172.20.20.30"
  end

  config.vm.define "consulclient1" do |client1|
	config.vm.provision "shell" do |s|
		s.path = "provisionclient.sh"
		s.args   = ["/vagrant/consulclient1/config.json"]
	end
  client1.vm.hostname = "consulclient1.example.com"
	client1.vm.network "private_network", ip: "172.20.20.40"
  end

  config.vm.define "consulclient2" do |client2|
	config.vm.provision "shell" do |s|
		s.path = "provisionclient.sh"
		s.args   = ["/vagrant/consulclient2/config.json"]
	end
  client2.vm.hostname = "consulclient2.example.com"
	client2.vm.network "private_network", ip: "172.20.20.50"
  end
end
