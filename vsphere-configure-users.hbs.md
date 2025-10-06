---
title: Setting Up Tanzu Kubernetes Grid Integrated Edition Admin Users on vSphere

iaas: vSphere
---

This topic describes how to create admin users in VMware Tanzu Kubernetes Grid Integrated Edition (TKGI) with User Account and Authentication (UAA).

## <a id='overview'></a> Overview

You must create at least one admin user during the initial set up of TKGI.

UAA is the identity management service for Tanzu Kubernetes Grid Integrated Edition.
Tanzu Kubernetes Grid Integrated Edition includes a UAA server, which is hosted on the TKGI API VM.

To interact with the UAA server, you can use the UAA Command Line Interface (UAAC).
You can either run UAAC commands from the {{ vars.platform_name }} VM or install UAAC on your local workstation.

## <a id='prerequisites'></a> Prerequisites

Before setting up admin users for Tanzu Kubernetes Grid Integrated Edition, you must have one of the following:

* SSH access to the {{ vars.platform_name }} VM

* A machine that can connect to your TKGI API VM

## <a id='connect'></a>Step 1: Connect to the TKGI API VM

You can connect to the TKGI API VM from the {{ vars.platform_name }} VM or from a different machine such as your local workstation.

### <a name='ssh-vsphere'></a>Option 1: Connect through the {{ vars.platform_name }} VM

You can connect to TKGI API VM by logging in to the {{ vars.platform_name }} VM through SSH.

To SSH into the {{ vars.platform_name }} VM on vSphere, do the following:

1. Locate the credentials that were used to import the {{ vars.platform_name }} `.ova` or `.ovf` file into your virtualization system.
You configured these credentials when you installed {{ vars.platform_name }} and used them to complete the
[Prepare vSphere](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/vsphere-deploy.html#prepare-vsphere)
steps in _Deploying {{ vars.platform_name }} on vSphere_.

1. Change the permissions for your private SSH key by running the following command:

    ```
    chmod 600 PRIVATE-KEY
    ```
    Where `PRIVATE-KEY` is the name of your private SSH key.<br><br>
1. SSH into the {{ vars.platform_name }} VM by running the following command:

    ```
    ssh -i PRIVATE-KEY ubuntu@OPS-MANAGER-FQDN
    ```
    Where `OPS-MANAGER-FQDN` is the fully qualified domain name (FQDN) of {{ vars.platform_name }}.

    For example:

    ```console
    ssh -i id_rsa ubuntu@my-opsmanager-fqdn.example.com
    ```

1. Proceed to the [Log In as a UAA Admin](#uaa-admin-login) section to create admin users with UAAC.

### <a name='local-workstation'></a>Option 2: Connect through a Non-{{ vars.platform_name }} Machine

To connect to the TKGI API VM and run UAA commands, do the following:

1. Install UAAC on your machine. For example:

    ```
    gem install cf-uaac
    ```
1. Download a copy of your {{ vars.platform_name }} root CA certificate to the machine. To download the certificate, do the following:

  1. In a web browser, navigate to the FQDN of {{ vars.platform_name }} and log in.
  1. In {{ vars.platform_name }}, navigate to **Settings** in the drop-down menu under your user name.
  1. Click **Advanced Options**.
  1. On the **Advanced Options** configuration page, click **Download Root CA Cert**.
  1. Move the certificate to a secure location on your machine and record the path.

1. Proceed to the [Log In as a UAA Admin](#uaa-admin-login) section to create admin users with UAAC.

##<a id='uaa-admin-login'></a>Step 2: Log In as a UAA Admin

{{> uaa-admin-login }}


##<a id='tkgi-access'></a>Step 3: Assign Tanzu Kubernetes Grid Integrated Edition Cluster Scopes

The `pks.clusters.manage` and `pks.clusters.admin` UAA scopes grant users the ability
to create and manage Kubernetes clusters in Tanzu Kubernetes Grid Integrated Edition.
For information about UAA scopes in Tanzu Kubernetes Grid Integrated Edition, see
[UAA Scopes for Tanzu Kubernetes Grid Integrated Edition Users](uaa-scopes.html).

To create Tanzu Kubernetes Grid Integrated Edition users with the `pks.clusters.manage` or `pks.clusters.admin` UAA scope,
perform one or more of the following procedures based on the needs of your deployment:

* To assign TKGI cluster scopes to an individual user, see
[Grant Tanzu Kubernetes Grid Integrated Edition Access to an Individual User](manage-users.html#uaa-user).
 Follow this procedure if you selected **Internal UAA** when you configured **UAA** in the Tanzu Kubernetes Grid Integrated Edition tile. For more information, see [Installing Tanzu Kubernetes Grid Integrated Edition on vSphere](installing-vsphere.html#uaa).
* To assign TKGI cluster scopes to an LDAP group, see [Grant Tanzu Kubernetes Grid Integrated Edition Access to an External LDAP Group](manage-users.html#external-group). Follow this procedure if you selected **LDAP Server** when you configured **UAA** in the Tanzu Kubernetes Grid Integrated Edition tile. For more information, see [Installing Tanzu Kubernetes Grid Integrated Edition TKGI on vSphere](installing-vsphere.html#uaa).
* To assign TKGI cluster scopes to a SAML group, see [Grant Tanzu Kubernetes Grid Integrated Edition Access to an External SAML Group](manage-users.html#saml). Follow this procedure if you selected **SAML Identity Provider** when you configured **UAA** in the Tanzu Kubernetes Grid Integrated Edition tile. For more information, see [Installing Tanzu Kubernetes Grid Integrated Edition TKGI on vSphere](installing-vsphere.html#uaa).
* To assign TKGI cluster scopes to a client, see [Grant Tanzu Kubernetes Grid Integrated Edition Access to a Client](manage-users.html#uaa-client).

##<a id="next-steps"></a> Next Step

After you create admin users in Tanzu Kubernetes Grid Integrated Edition, the admin users can create and manage
Kubernetes clusters in Tanzu Kubernetes Grid Integrated Edition.
For more information, see [Managing Kubernetes Clusters and Workloads](managing-clusters.html).
