#!/bin/bash
# Update package list and upgrade installed packages
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Apache HTTP Server
sudo apt-get install -y apache2

# Ensure Apache is enabled and running
sudo systemctl enable apache2
sudo systemctl start apache2

# Create a custom index.html file for the web server
sudo bash -c 'cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to My Web Server created using the terraform </title>
</head>
<body>
    <h1>Welcome to Ubuntu EC2 Instance</h1>
    <p>This is a sample web server setup using a userdata script!</p>
</body>
</html>
EOF'

# Adjust permissions for the web directory
sudo chmod -R 755 /var/www/html

# Print a completion message
echo "Apache web server setup complete!" | sudo tee /var/log/userdata.log
