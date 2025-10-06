---
title: Setting Up {{  vars.product }} Admin Users on Azure

iaas: Azure
---

This topic describes how to create {{  vars.product_full }} ({{ vars.product_short }}) admin users with User Account and Authentication (UAA) on Microsoft Azure.


## <a id='overview'></a> Overview

UAA is the identity management service for TKGI.
You must use UAA to create an admin user during your initial set up of TKGI.

TKGI includes a UAA server, hosted on the TKGI API VM.
Use the UAA Command Line Interface (UAAC) from the {{ vars.platform_name }} VM to interact with the TKGI UAA server.
You can also install UAAC on a workstation and run UAAC commands from there.

## <a id='prerequisites'></a> Prerequisites

Before setting up admin users for {{  vars.product }}, you must have one of the following:

* SSH access to the {{ vars.platform_name }} VM

* A machine that can connect to your TKGI API VM

## <a id='connect'></a>Step 1: Connect to the TKGI API VM

You can connect to the TKGI API VM from the {{ vars.platform_name }} VM or from a different machine such as your local workstation.

### <a name='ssh-azure'></a>Option 1: Connect through the {{ vars.platform_name }} VM

You can connect to the TKGI API VM by logging in to the {{ vars.platform_name }} VM through SSH.

To log in to the {{ vars.platform_name }} VM using SSH on Azure, you need the SSH key pair you used when you created the {{ vars.platform_name }} VM.
If you need to reset the SSH key, locate the {{ vars.platform_name }} VM in the Azure portal and click **Reset Password**.

To SSH into the {{ vars.platform_name }} VM on Azure, do the following:

1. From the Azure portal, locate the {{ vars.platform_name }} FQDN by selecting the VM.

1. Change the permissions for your SSH private key by running the following command:

    ```
    chmod 600 PRIVATE-KEY
    ```

    Where `PRIVATE-KEY` is the name of your SSH private key.

1. SSH into the {{ vars.platform_name }} VM by running the following command:

    ```
    ssh -i PRIVATE-KEY ubuntu@OPS-MANAGER-FQDN
    ```
    Where:

    * `OPS-MANAGER-FQDN` is FQDN of {{ vars.platform_name }}.
    * `PRIVATE-KEY` is the name of your SSH private key.

      For example:
      ```console
      $ ssh -i id_rsa ubuntu@my-opsmanager-fqdn.example.com
      ```

1. Proceed to the [Log in as a UAA Admin](#uaa-admin-login) section to manage users with UAAC.

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


##<a id='tkgi-access'></a>Step 3: Assign {{  vars.product }} Cluster Scopes

The `pks.clusters.manage` and `pks.clusters.admin` UAA scopes grant users the ability
to create and manage Kubernetes clusters in {{  vars.product }}.
For information about UAA scopes in {{  vars.product }}, see
[UAA Scopes for {{  vars.product }} Users](uaa-scopes.html).

To create {{  vars.product }} users with the `pks.clusters.manage` or `pks.clusters.admin` UAA scope,
perform one or more of the following procedures based on the needs of your deployment:

* To assign TKGI cluster scopes to an individual user, see
[Grant {{  vars.product }} Access to an Individual User](manage-users.html#uaa-user).
 Follow this procedure if you selected **Internal UAA** when you configured **UAA** in the {{  vars.product }} tile. For more information, see [Installing {{  vars.product }} on Azure](installing-azure.html#uaa).
* To assign TKGI cluster scopes to an LDAP group, see [Grant {{  vars.product }} Access to an External LDAP Group](manage-users.html#external-group). Follow this procedure if you selected **LDAP Server** when you configured **UAA** in the {{  vars.product }} tile. For more information, see [Installing {{  vars.product }} TKGI on Azure](installing-azure.html#uaa).
* To assign TKGI cluster scopes to a SAML group, see [Grant {{  vars.product }} Access to an External SAML Group](manage-users.html#saml). Follow this procedure if you selected **SAML Identity Provider** when you configured **UAA** in the {{  vars.product }} tile. For more information, see [Installing {{  vars.product }} TKGI on Azure](installing-azure.html#uaa).
* To assign TKGI cluster scopes to a client, see [Grant {{  vars.product }} Access to a Client](manage-users.html#uaa-client).

##<a id="next-steps"></a> Next Step

After you create admin users in {{  vars.product }}, the admin users can create and manage
Kubernetes clusters in {{  vars.product }}.
For more information, see [Managing Kubernetes Clusters and Workloads](managing-clusters.html).
