# Setup
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

# Add the repository
echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/mesosphere.list
sudo apt-get -y update

# Lets Install Mesos
sudo apt-get -y install mesos

# For the Slave-Nodes we don't Need Zookeeper
sudo service zookeeper stop
sudo sh -c "echo manual > /etc/init/zookeeper.override"

sudo nano /etc/mesos/zk
