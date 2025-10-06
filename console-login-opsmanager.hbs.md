---
title: Connect to {{{ vars.platform_name }}}
owner: TKGI
---

When you use Tanzu Kubernetes Grid Integrated Edition Management Console to deploy Tanzu Kubernetes Grid Integrated Edition on vSphere, it deploys {{{ vars.platform_name }}}. The **Deployment Metadata** view of the management console displays the credentials that you need to log in to the deployed {{{ vars.platform_name }}} instance.

## <a id='ops-manager-ssh'></a>Connect to {{{ vars.platform_name }}} with SSH

Tanzu Kubernetes Grid Integrated Edition Management Console generates an SSH private key to control SSH access to the {{{ vars.platform_name }}} VM when you deploy Tanzu Kubernetes Grid Integrated Edition.

1. Go to **Deployment Metadata** in the management console.
1. Click the clipboard icon at the end of the **{{{ vars.platform_name }}} VM SSH Private Key** row to copy its contents. 
1. Paste the contents of the SSH key into a text file, for example `~/tkgi_om.key`.
1. Go to the **Summary** tab of the **TKG Integrated Edition** view in the management console.
1. Copy the **{{{ vars.platform_name }}} IP Address**.
1. In a terminal run the following command to use SSH to connect to the {{{ vars.platform_name }}} VM:  

    ```
    ssh -i ~/pm_om.key ubuntu@END-POINT
    ```
    
    Where `END-POINT` is the {{{ vars.platform_name }}} endpoint address.  

## <a id='ops-manager-ui'></a>Log In to the {{{ vars.platform_name }}} UI

Tanzu Kubernetes Grid Integrated Edition Management Console generates a random password for the {{{ vars.platform_name }}} admin account when you deploy Tanzu Kubernetes Grid Integrated Edition.

1. Go to **Deployment Metadata** in the management console.
1. Click the clipboard icon at the end of the **{{{ vars.platform_name }}} VM Password** row to copy the password.
1. Go to the **Summary** tab of the **TKG Integrated Edition** view in the management console.
1. Click the **{{{ vars.platform_name }}} IP Address** to open the {{{ vars.platform_name }}} UI.
1. Log in to {{{ vars.platform_name }}} with user name `admin` and the password that you copied from the Deployment Metadata view.
