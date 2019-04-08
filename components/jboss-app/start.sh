#!/bin/bash

# wget war from $app_url
# change name to $app_name
# Copy to depolyment directory - cp helloworld-html5.war /opt/wildfly/standalone/deployments/

sudo wget -O {{app_name}}.war {{app_url}}
sudo cp {{app_name}}.war /opt/wildfly/standalone/deployments/
