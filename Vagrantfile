# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Especifico una versión de la box de Ubuntu 18.04
  config.vm.box_url = "https://vagrantcloud.com/ubuntu/boxes/bionic64/versions/20200324.0.0/providers/virtualbox.box"

  # Configuración específica para el provider virtualbox
  config.vm.provider "virtualbox" do |v|
	v.name = "Vagrant con Nginx - 2020"
	v.customize ["modifyvm", :id, "--memory", "512"]
  end

  # Configuranmos el provisioning mediante shell script
  config.vm.provision "shell" do |s|
	s.path = "provision/setup.sh"
  end

  # Configuramos la redirección del puerto 80 de la máquina virtual al 8080 del host
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true

  # Configuramos que el subdirectorio ./ en el host que esté mapeado
  # al /var/www de la máquina virtual
  config.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"  
  
end
