#1/bin/bash

set -e

# https://ubuntuforums.org/showthread.php?t=1628566
rsync -a -e "ssh" --rsync-path="sudo rsync" -rv dist/ ec2-user@goonytoons.com:/var/www/html
