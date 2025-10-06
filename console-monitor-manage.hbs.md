---
title: Monitor and Manage Tanzu Kubernetes Grid Integrated Edition in the Management Console
owner: TKGI
---

After you have deployed VMware Tanzu Kubernetes Grid Integrated Edition on vSphere, you can use VMware Tanzu Kubernetes Grid Integrated Edition Management Console to perform the following operations:

- View the [overall status](#general-status) of your deployment.
- View the [deployment metadata](#metadata) and [status](#component-status) of each of the components of your deployment.
- Edit the configuration of your deployment, either in the configuration wizard or by editing the YAML file. For information about reconfiguring your deployment, see [Reconfigure Your Tanzu Kubernetes Grid Integrated Edition Deployment](console-reconfigure.html).
- Upgrade your deployment to a new version. For information about upgrading deployments, see [Upgrade Tanzu Kubernetes Grid Integrated Edition Management Console](console-upgrade.html).
- Patch the individual components of your deployment. For information about patching components, see [Patch Tanzu Kubernetes Grid Integrated Edition Management Console Components](console-patch-components.html).
- [Delete Your Tanzu Kubernetes Grid Integrated Edition Deployment](console-delete-deployment.html).

For information about how to deploy the management console and install Tanzu Kubernetes Grid Integrated Edition, see [Install on vSphere with the Management Console](console-install-vsphere.html).

## <a id='general-status'></a>Obtain General Status Information

1. Go to the **TKG Integrated Edition** view of the management console.
1. Select the **Summary** tab for your Tanzu Kubernetes Grid Integrated Edition instance.
<br>You see general information about your deployment, including the status and version of each component, as well as the names and addresses of the VMs that run those services.   
    ![Summary of an Tanzu Kubernetes Grid Integrated Edition deployment](images/console/deployment-summary.png)
    [View a larger version of this image](images/console/deployment-summary.png) 

## <a id='metadata'></a>Obtain Deployment Metadata

The deployment metadata provides credentials, certificates, and other metadata about your Tanzu Kubernetes Grid Integrated Edition deployment. 

1. Expand **Configuration** and select **Deployment Metadata**.
    ![Deployment metadata](images/console/deployment-metadata.png)
    [View a larger version of this image](images/console/deployment-metadata.png) 
1. Select the clipboard icon at the end of each row to copy the relevant value. 
    
    For example, copy the Ops Manager password so that you can log in to the instance of Ops Manager that is running in your deployment.

## <a id='component-status'></a>View Component Deployment Status

You can see the status of the individual components of your deployment.

1. Expand **Configuration** and go to the **TKGI Configuration** view of the management console.
1. Select **Deployment Status** to see the status of the components.

    ![Tanzu Kubernetes Grid Integrated Edition deployment status](images/console/deployment-complete.png)
    [View a larger version of this image](images/console/deployment-complete.png)

1. Click the Download Logs button to download the log bundle for your Tanzu Kubernetes Grid Integrated Edition deployment.
