#!/bin/sh

systemctl start wildfly
systemctl status wildfly

# after startting should be available on opet 8080
