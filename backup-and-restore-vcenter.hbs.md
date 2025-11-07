---
title: Backing Up and Restoring the vCenter Server

---

This topic describes how to back up and restore the vCenter Server for a {{  vars.product_full }} deployment.

<p class="note"><strong>Note</strong>: Back up and restore of the vSphere SDDC is typically included as part of a site-wide disaster recovery plan. The information provided here is to be used as part of confirmation of such a plan.</p>

## vCenter Cluster Configuration

To support highly available clusters, configure the vCenter clusters for TKGI with HA and DRS enabled. For more information, see [vSphere Availability](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere-supervisor/7-0/vsphere-availability.html) in the VMware vSphere documentation.

## vCenter Server Back Up and Recover

vCenter Server supports file back up to network attached storage.

To back up and restore vCenter, create a backup of the vCenter primary server. Refer to the topic [File-Based Backup and Restore of vCenter Server](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/7-0/vcenter-server-installation-and-setup-7-0/file-based-backup-and-restore-of-a-vcenter-server-environment.html) in the vCenter documentation.

## Data Protection

VMware provides a robust set of vSphere Storage APIs for host data protection, and partners with third-party vendors to provide back up and recovery solutions for vSphere datastores, including the following:

- [Dell Avamar](https://www.delltechnologies.com/en-us/data-protection/data-protection-suite/avamar-data-protection-software.htm#)
- [Veeam](https://www.vmware.com/partners/strategic-technology-partners/veeam.html)
- [Datrium](https://www.datrium.com/)
