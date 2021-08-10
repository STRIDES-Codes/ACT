# Installing docker
do apt-get update

sudo apt-get install \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
	"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io

sudo docker run hello-world

# Sys admin: add docker group to user
# fixes permissions issue with /var/run/docker.sock
sudo groupadd docker
sudo usermod -aG docker ${USER}

# Installing node.js
curl -sL https://deb.nodesource.com/setup_12.x |sudo -E bash -
sudo apt-get install -y nodejs

# Installing Dockta
sudo npm install --global @stencila/dockta



