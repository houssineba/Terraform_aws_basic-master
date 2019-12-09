#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
echo "<h1>Deployed via Terraform wih ELB</h1>" | sudo tee /var/www/html/index.html
