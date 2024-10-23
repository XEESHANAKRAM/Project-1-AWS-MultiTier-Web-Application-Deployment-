#! /bin/bash
# Update package list and install Nginx
sudo apt update -y
sudo apt install -y nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Start Nginx service
sudo systemctl start nginx

# Create a custom HTML page
sudo echo '<h1>Welcome to Wikihelpful - APP-1</h1>' | sudo tee /var/www/html/index.nginx-debian.html
sudo mkdir /var/www/html/app1

# Create a directory and another HTML page in app1
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to wikihelpful - APP-1</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
