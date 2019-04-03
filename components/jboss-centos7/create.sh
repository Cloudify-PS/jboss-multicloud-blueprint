#!/bin/sh

sudo yum install -y java-1.8.0-openjdk-devel wget
sudo groupadd -r wildfly
sudo useradd -r -g wildfly -d /opt/wildfly -s /sbin/nologin wildfly
WILDFLY_VERSION=16.0.0.Final
wget https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz -P /tmp
sudo tar xf /tmp/wildfly-$WILDFLY_VERSION.tar.gz -C /opt/
sudo ln -s /opt/wildfly-$WILDFLY_VERSION /opt/wildfly
sudo chown -RH wildfly: /opt/wildfly
sudo mkdir -p /etc/wildfly
sudo sudo cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.conf /etc/wildfly/
sudo cp /opt/wildfly/docs/contrib/scripts/systemd/launch.sh /opt/wildfly/bin/
sudo sh -c 'chmod +x /opt/wildfly/bin/*.sh'
sudo cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable wildfly

