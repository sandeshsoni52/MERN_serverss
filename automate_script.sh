#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install curl software-properties-common -y
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install nodejs -y

node -v
npm -v

sudo apt install git -y
git --version

git init
git clone https://github.com/sandeshsoni52/MERN_serverss.git

echo "Checking UFW version..."
ufw version
echo "Checking UFW status..."
sudo ufw status
echo "Enabling UFW..."
sudo ufw enable
echo "Allowing traffic on port 3000..."
sudo ufw allow 3000
echo "Allowing traffic on port 8088..."
sudo ufw allow 8088
echo "Reloading UFW rules..."
sudo ufw reload
echo "Displaying updated UFW status..."
sudo ufw status
echo "Checking if port 3000 is in use..."
ss -tuln | grep 3000

cd MERN_serverss/client
echo "Installing client dependencies..."
npm install
cd ..

npm install
npm run dev &  # Run the backend server in the background

# Navigate to the client directory
echo "Navigating to the client directory..."
cd client

echo "Starting the client development server..."
npm run dev
