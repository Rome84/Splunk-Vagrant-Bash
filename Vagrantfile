####################################################################################################
#   _____       _             _            ___        _                        _   _               #
#  /  ___|     | |           | |          / _ \      | |                      | | (_)              #
#  \ `--. _ __ | |_   _ _ __ | | ________/ /_\ \_   _| |_ ___  _ __ ___   __ _| |_ _  ___  _ __    #
#   `--. \ '_ \| | | | | '_ \| |/ /______|  _  | | | | __/ _ \| '_ ` _ \ / _` | __| |/ _ \| '_ \   #
#  /\__/ / |_) | | |_| | | | |   <       | | | | |_| | || (_) | | | | | | (_| | |_| | (_) | | | |  #
#  \____/| .__/|_|\__,_|_| |_|_|\_\      \_| |_/\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_|  #
#        | |                                                                                       #
#        |_|                                                                                       #
# ##################################################################################################
Vagrant.configure("2") do |config|
        config.vm.box = "centos/7"
        config.vm.network "private_network", ip: "192.168.33.20"
        config.vm.hostname = "CapacityBay20"
        config.vm.provision "shell", path: "scripts/splunk-installer.sh"
        config.vm.provider "virtualbox" do |vb|
          vb.memory = "2048"
          vb.cpus = 2
        end 
  end
