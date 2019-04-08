#!/bin/sh

sudo systemctl start wildfly
sudo systemctl status wildfly

# after startting should be available on opet 8080
