#1/bin/bash

set -e

# circle CI doesn't have rsync installed
sudo apt install -y rsync
# https://ubuntuforums.org/showthread.php?t=1628566
rsync -o StrictHostKeyChecking=no -a -e "ssh" --rsync-path="sudo rsync" -rv dist/ ec2-user@goonytoons.com:/var/www/html
