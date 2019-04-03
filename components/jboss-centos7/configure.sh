#!/bin/sh

systemctl daemon-reload
systemctl start wildfly
systemctl enable wildfly
systemctl status wildfly
### Need to figure out what options to provide to assuser with command

#/opt/wildfly/bin/add-user.sh
#/opt/wildfly/bin/add-user.sh --help

