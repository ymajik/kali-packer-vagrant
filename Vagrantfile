# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "kali-2.0-64bit"
  config.vm.box_url = "file://builds/virtualbox-iso/kali-2.0-64bit.box"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = 'Kali 2.0 64-bit'
    vb.memory = 1024    # 1 GB
  end
end
