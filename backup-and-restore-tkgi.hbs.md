---
title: Backing Up and Restoring the {{ vars.product_short }} Management Plane

---

This topic describes how to back up and restore the {{  vars.product_full }} Management Plane.

## Overview

Back up and restore of the {{ vars.product_short }} Management Plane includes the following components:

- {{ vars.platform_name }} configuration, including the BOSH Director and {{ vars.product_short }} tiles.
- The {{ vars.product_short }} Management Plane VMs, including the [BOSH Director VM](bbr-backup-tkgi.html#back-up-director), and the [{{ vars.product_short }} Control Plane VM](bbr-backup-tkgi.html#back-up-control-plane).

You use {{ vars.platform_name }} to back up and restore the BOSH Director and {{ vars.product_short }} tiles. You use [BOSH Backup and Restore](https://docs.cloudfoundry.org/bbr/index.html) (BBR) to back up and restore the {{ vars.product_short }} Management Plane VMs. Restoring the {{ vars.platform_name }} VM is a manual process.

To back up and restore the {{ vars.product_short }} Management Plane, see the following topics:

- [Install and Configure BBR](bbr-install-config.html).
- [Backing Up {{ vars.product_short }} Management Plane Components](bbr-backup-tkgi.html).
- [Restoring {{ vars.product_short }} Management Plane Components](bbr-restore-tkgi.html).

## Testing Considerations

As part of your {{ vars.product_short }} back up and restore planning and testing, consider the following test scenario.

- Export {{ vars.platform_name }} configuration.
- Take a back up of {{ vars.product_short }} Management Plane using BBR.
- Power off the {{ vars.platform_name }}, BOSH, and {{ vars.product_short }} Control Plane VMs.
- Deploy a new {{ vars.platform_name }} VM and import the exported configuration.
- Restore BOSH and {{ vars.product_short }} VMs using BBR.

On restore of all {{ vars.product_short }} Management Plane components, confirm there has not been a loss of data for configurations included in the backups. Any {{ vars.product_short }} configuration changes made after the backup was taken are not restored since they were made after the backup.
