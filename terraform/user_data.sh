#!/bin/bash
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
echo "<h1>Welcome to 43kae Cloud Portfolio EC2 Web Server</h1>" | sudo tee /var/www/html/index.html