#!/bin/bash

# Update the package list
sudo apt update -y && sudo apt upgrade -y

# Download Docker installation script
curl -fsSL https://get.docker.com -o get-docker.sh

# Run Docker installation script with dry-run option
sudo sh ./get-docker.sh 
systemctl start docker && systemctl enable docker
docker pull gitlab
docker pull nginx
docker pull jenkins

# Install dependencies
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list again
sudo apt update

# Install Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Add the current user to the docker group to avoid using 'sudo' with docker commands
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Display Docker and Docker Compose versions
docker --version
docker-compose --version

# Output a message to inform the user to restart the system or re-login for group changes to take effect
echo "Please restart your system or re-login to apply the changes to user groups."
