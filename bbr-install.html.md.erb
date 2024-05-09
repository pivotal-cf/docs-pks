---
title: Installing BOSH Backup and Restore
owner: TKGI
---

This topic describes how to install BOSH Backup and Restore (BBR).

##<a id="overview"></a> Overview

To install BBR, first validate that your jump box VM is a valid BOSH backup host, then copy the BBR executable to the jump box. 

After installing BBR, you can run `bbr` commands to back up and restore your Tanzu Kubernetes Grid Integrated Edition
deployment.

For more information about using BOSH Backup and Restore, see:  

* To perform a back up, see [Backing Up Tanzu Kubernetes Grid Integrated Edition](bbr-backup.html).  
* To perform a restore of the BOSH Director, see [Restore the BOSH Director](bbr-restore.html#redeploy-restore-director).  
* To perform a restore of the Tanzu Kubernetes Grid Integrated Edition Control Plane, see [Restore the Tanzu Kubernetes Grid Integrated Edition Control Plane](bbr-restore.html#redeploy-restore-control-plane).  
* To perform a restore of the Tanzu Kubernetes Grid Integrated Edition Clusters. see [Restore Tanzu Kubernetes Grid Integrated Edition Clusters](bbr-restore.html#redeploy-restore-clusters). 

##<a id="prerequisites"></a> Prerequisite

Using BBR requires the following:  

* A jump box. You must have a jump box before you can install BBR to the jump box.  
* A bbr executable file. You must have the correct BBR executable version for your TKGI installation. 

A jump box is a separate, hardened server on your network that provides a controlled means of accessing the other VMs on your network. 
See the [jumpbox-deployment](https://github.com/cloudfoundry/jumpbox-deployment) GitHub repository for an example jump box deployment.  

To determine the correct version of BBR for your deployment, see the [Tanzu Kubernetes Grid Integrated Edition Release Notes](release-notes.html).
To download a BBR installation file, see [BOSH Backup and Restore](https://support.broadcom.com/group/ecx/productdownloads?subfamily=BOSH%20Backup%20and%20Restore) on the Broadcom Support.

##<a id="jumpbox-setup"></a> Configure Your Jump Box

Configure your jump box to meet the following requirements:

* Your jump box must be able to communicate with the network that contains your Tanzu Kubernetes Grid Integrated Edition deployment. You
can use the VMware Tanzu Operations Manager (Ops Manager) VM as your jump box.
* Your jump box must have sufficient space for the backup.
* Your jump box must be in the same network as the deployed VMs because BBR connects to the VMs at their private IP addresses. BBR does not support SSH gateways.
* There is minimal network latency between the jump box host and the source VMs you are configuring BBR to back up.  

<p class="note"><strong>Note</strong>: BBR uses SSH to orchestrate the back up of your Tanzu Kubernetes Grid Integrated Edition instances using port 22 by default.</p>

## <a id='scp'></a> Transfer BBR to Your Jump Box

Copy the `bbr` executable to a local disk then upload the executable to the jump box:

1. Download the latest [BOSH Backup and Restore release](https://support.broadcom.com/group/ecx/productdownloads?subfamily=BOSH%20Backup%20and%20Restore) from Broadcom Support.
1. To add executable permissions to the `bbr` binary file, run the following command:

    ```
    chmod a+x bbr
    ```
1. To securely copy the `bbr` binary file to your jump box, run the following command:

    ```
    scp LOCAL-PATH-TO-BBR/bbr JUMP-BOX-USER@JUMP-BOX-ADDRESS:
    ```

    Where:  

    * `LOCAL-PATH-TO-BBR` is the path to the `bbr` binary you downloaded from Broadcom Support.
    * `JUMP-BOX-USER` is the SSH user name for connecting to the jump box.
    * `JUMP-BOX-ADDRESS` is the IP address, or hostname, of the jump box.

