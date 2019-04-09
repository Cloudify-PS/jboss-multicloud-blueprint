# jboss-multicloud-blueprint

This is a blueprint, which install a JBoss Application Server on a CentOS7 VM running on the desired IaaS (currently only OpenStack and Azure are available) and deploys a simple *helloworld* application.

## Blueprints included

  * [Multicloud Infra VM](https://github.com/Cloudify-PS/multicloud-infra-vm/).

  By default, _mutlicloud-infra-vm_ blueprint is being installed automatically while deploying _jboss-multicloud-blueprint_. This setting can be modified by changing a value of an `use_existing_vm_deployment`.

## Inputs

* To choose an IaaS on which the JBoss app should be deployed, use a `cloud_env` input. Valid values are `openstack` (default) or `azure`.
* To pass a link to the application, which should be deployed on the JBoss server, `app_url` input should be used. By default, there's a link to the GitHub repository, where exemplary [helloworld](https://github.com/Cloudify-PS/jboss-multicloud-blueprint/raw/master/wars/helloworld.war) application is being stored.
* To choose a name under which it will be accessible, `app_name` input should be used. By default, it's `helloworld`

## Compatibility

Tested with:
  * Cloudify 4.5.5

## Pre-installation steps

Upload the required plugins:

  * [Azure Plugin](https://github.com/cloudify-incubator/cloudify-azure-plugin/releases/tag/2.1.1),
  * [OpenStack Plugin](https://github.com/cloudify-cosmo/cloudify-openstack-plugin/releases/tag/2.14.7),
  * [Utilities Plugin](https://github.com/cloudify-incubator/cloudify-utilities-plugin/releases/tag/1.11.2).

_Check the blueprint for the exact version of the plugin._

You must have these secrets on your Cloudify Manager `tenant`:
  * When deploying on *Azure*:
    * `azure_subscription_id`
    * `azure_tenant_id`
    * `azure_client_id`
    * `azure_client_secret`
    * `azure_location`
    * `resource_prefix`
    * `resource_suffix`.
  * When deploying on *OpenStack*:
    * `keystone_username`
    * `keystone_password`
    * `keystone_tenant_name`
    * `keystone_url`
    * `keystone_region`
  * In both use cases:
    * `agent_key_public`
    * `agent_key_private`

## Installation

Upload the blueprint, create the deployment and execute install workflow in one command using the CLI:

```bash
cfy install jboss-baseline.yaml -i cloud_env="{{chosen IaaS}}"
```

## Update

To update the application served by JBoss application server, built-in `update` workflow can be used. When running it, it is required only to change the `app_url` input for the new one. To do it, navigate to the deployment and select `Update deployment`. Or use the CLI:

```bash
cfy deployments update jboss-multicloud-blueprint -i app_url="https://github.com/Cloudify-PS/jboss-multicloud-blueprint/raw/master/wars/updated_helloworld.war"
```

## Uninstallation

Navigate to the deployment and select `Uninstall`. When the uninstall workflow is finished, select `Delete deployment`. Or use the CLI:

```bash
cfy uninstall jboss-multicloud-blueprint
```
