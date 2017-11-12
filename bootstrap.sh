sudo add-apt-repository ppa:git-core/ppa
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt install -y git
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs
sudo mkdir /home/ubuntu/.npm-global
npm config set prefix '/home/ubuntu/.npm-global'
echo 'prefix=~/.npm-global' >> /home/ubuntu/.npmrc
echo 'export PATH=~/.npm-global/bin:$PATH' >> /home/ubuntu/.profile
npm i -g npm
npm install http-server -g
sudo chown -R ubuntu /home/ubuntu/.npm-global
sudo chown -R ubuntu /home/ubuntu/.npmrc
sudo apt install -y mongodb-org
sudo mkdir /data/
sudo mkdir /data/db
sudo chmod 777 /data/db
sudo systemctl enable mongod.service
sudo service mongod start
