#!/bin/sh

sudo systemctl enable wildfly


sudo systemctl enable wildfly
sudo systemctl status wildfly
### Need to figure out what options to provide to assuser with command

#/opt/wildfly/bin/add-user.sh
#/opt/wildfly/bin/add-user.sh --help
## CHECK IF THAT'S CORRECT
sudo /opt/wildfly/bin/add-user.sh -u testB -p test123a
