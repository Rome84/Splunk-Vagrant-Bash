#!/bin/bash
echo "####################################################################################################"
echo "#   _____       _             _            ___        _                        _   _               #"
echo "#  /  ___|     | |           | |          / _ \      | |                      | | (_)              #"
echo "#  \ `--. _ __ | |_   _ _ __ | | ________/ /_\ \_   _| |_ ___  _ __ ___   __ _| |_ _  ___  _ __    #"
echo "#   `--. \ '_ \| | | | | '_ \| |/ /______|  _  | | | | __/ _ \| '_ ` _ \ / _` | __| |/ _ \| '_ \   #"
echo "#  /\__/ / |_) | | |_| | | | |   <       | | | | |_| | || (_) | | | | | | (_| | |_| | (_) | | | |  #"
echo "#  \____/| .__/|_|\__,_|_| |_|_|\_\      \_| |_/\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_|  #"
echo "#        | |                                                                                       #"
echo "#        |_|                                                                                       #"
echo "# ##################################################################################################"
set -x

echo "----------Updating the newly release packages for the OS-----------"
yum  update -y

echo "------------------Installing all the dependencies-----------------"
yum install -y epel-release wget unzip git curl net-tools nc htop

echo "----------Creating Splunk group-----------------"
groupadd splunk

echo "------------Creating Splunk user--------------"
useradd -d /opt/splunk -m -g splunk splunk

echo "------------Adding Splunk to the wheel group------------------"
usermod -aG wheel splunk

echo "-----------------Downloading Splunk rpm from splunk portal, you need to update this link for latest splunk software------------------------"
wget -O splunk-8.0.4-767223ac207f-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.4&product=splunk&filename=splunk-8.0.4-767223ac207f-Linux-x86_64.tgz&wget=true'

echo "-------------Installing Splunk--------------------------"
tar -xvzf  splunk-8.0.4-767223ac207f-Linux-x86_64.tgz -C /opt

echo "------------Giving Splunk Ownership---------------------"
chown -R splunk:splunk /opt/splunk/

echo "-------------Go to Splunk binary path----------------"
cd /opt/splunk/bin

echo "--------------------Starting Splunk service, and feed password along with command, you can change password once you login to splunk portal----------------------"
./splunk start --accept-license --answer-yes --no-prompt --seed-passwd welcome90

echo "---------------Enabling autostart of splunk service---------------"
./splunk enable boot-start

echo "--------------Checking Splunk Status------------------------"
/opt/splunk/bin/splunk/status

echo "-------------------setting Splunk password-----------------"
echo “welcome90” | passwd --stdin splunk

"------------Installing Firewalld-------------------------"
yum install -y firewalld

echo "-------------Starting firewalld service-------------------"
systemctl start firewalld

echo "-------------Checking the firewall status---------------"
systemctl status firewalld

echo "-----------Enabling the firewall to start onboot-----------------"
systemctl enable firewalld

echo "----------Grabbing passage for splunk through the firewall-------"
echo "##########################################"
echo "# ______ _                        _ _    #"
echo "# |  ___(_)                      | | |   #"
echo "# | |_   _ _ __ _____      ____ _| | |   #"
echo "# |  _| | | '__/ _ \ \ /\ / / _` | | |   #"
echo "# | |   | | | |  __/\ V  V / (_| | | |   #"
echo "# \_|   |_|_|  \___| \_/\_/ \__,_|_|_|   #"
echo "#                                        #"
echo "##########################################"
firewall-cmd --add-port=8000/tcp --permanent
firewall-cmd --add-port=8089/tcp --permanent
firewall-cmd --add-port=9997/tcp --permanent
firewall-cmd --add-port=8443/tcp --permanent
firewall-cmd --add-port=514/udp --permanent
firewall-cmd --reload

echo "---------Apending the (FQDN) Fully Qualify Domain Name to the /etc/hosts-------"
echo "192.168.33.20 capacitybay20.example.com capacity20" >>/etc/hosts
echo "capacitybay20.example.com" >/etc/hostname

echo "#----------ENJOY THE WORLD OF AUTOMATION BY CAPACITYBAY-2020--------"
echo;
echo "----------SECURITY & ANALYTICS------------"
echo;
echo "#########################################################################################################################"
echo "#  _____ _____ _____ _   _______ _____ _______   __            ___   _   _   ___   _   __   _______ _____ _____  _____  #"
echo "# /  ___|  ___/  __ \ | | | ___ \_   _|_   _\ \ / /   ___     / _ \ | \ | | / _ \ | |  \ \ / /_   _|_   _/  __ \/  ___| #"
echo "# \ `--.| |__ | /  \/ | | | |_/ / | |   | |  \ V /   ( _ )   / /_\ \|  \| |/ /_\ \| |   \ V /  | |   | | | /  \/\ `--.  #"
echo "#  `--. \  __|| |   | | | |    /  | |   | |   \ /    / _ \/\ |  _  || . ` ||  _  || |    \ /   | |   | | | |     `--. \ #"
echo "# /\__/ / |___| \__/\ |_| | |\ \ _| |_  | |   | |   | (_>  < | | | || |\  || | | || |____| |   | |  _| |_| \__/\/\__/ / #"
echo "#\____/\____/ \____/\___/\_| \_|\___/  \_/   \_/    \___/\/  \_| |_/\_| \_/\_| |_/\_____/\_/   \_/  \___/ \____/\____/  #"
echo "#########################################################################################################################"                                                                                                                  
echo;
echo "---------INVESTIGATING---------------------"
echo;
echo "-----------REPORTING-----------------------"
echo "####################################################################################################"
echo "#   _____       _             _            ___        _                        _   _               #"
echo "#  /  ___|     | |           | |          / _ \      | |                      | | (_)              #"
echo "#  \ `--. _ __ | |_   _ _ __ | | ________/ /_\ \_   _| |_ ___  _ __ ___   __ _| |_ _  ___  _ __    #"
echo "#   `--. \ '_ \| | | | | '_ \| |/ /______|  _  | | | | __/ _ \| '_ ` _ \ / _` | __| |/ _ \| '_ \   #"
echo "#  /\__/ / |_) | | |_| | | | |   <       | | | | |_| | || (_) | | | | | | (_| | |_| | (_) | | | |  #"
echo "#  \____/| .__/|_|\__,_|_| |_|_|\_\      \_| |_/\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_|  #"
echo "#        | |                                                                                       #"
echo "#        |_|                                                                                       #"
echo "####################################################################################################"
echo;
echo "---------Rebooting the server-----------"
sudo init 6
