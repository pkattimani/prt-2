#!/bin/bash

# Update packages
sudo apt update -y

# Install Java (required for Jenkins)
sudo apt install -y fontconfig openjdk-17-jre

# Add Jenkins GPG key and repo
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
  sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update again and install Jenkins
sudo apt update -y
sudo apt install -y jenkins

# Start Jenkins and enable at boot
sudo systemctl start jenkins
sudo systemctl enable jenkins
