---
title: Using BOSH Diagnostic Commands in {{  vars.product }}
owner: {{ vars.platform_name }}
---

This topic describes how to access information about your {{  vars.product_full }} deployment
by using the BOSH Command Line Interface (BOSH CLI).


## <a id='overview'></a>Overview

BOSH diagnostic commands such as `bosh ssh` and `bosh vms` enable
you to access information about your {{ vars.product_short }} deployment.
For example, you can access {{ vars.product_short }} log files
after SSHing into the {{ vars.product_short }} API or a Kubernetes cluster VM:

1. [Log in to the BOSH Director VM](#alias)
1. SSH into the environment:
    * [SSH into the {{ vars.product_short }} API VM](#tkgi-api)
    * [SSH into the {{ vars.product_short }} Database VM](#pks-db)
    * [SSH into a Kubernetes Cluster VM](#cluster)
1. [View Log Files](#bosh-tkgi-map)


## <a id='alias'></a> Log in to the BOSH Director VM

To set a BOSH alias for your {{ vars.product_short }} environment
and log in to the BOSH Director VM, follow the steps below:

1. Gather your credential and IP address information for the BOSH Director and SSH
into the {{ vars.platform_name }} VM. For instructions, see [Advanced Troubleshooting with the BOSH
CLI](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/install-trouble-advanced.html).
1. To create a BOSH alias for your {{ vars.product_short }} environment, run the following command:

    ```
    bosh alias-env ENVIRONMENT \
    -e BOSH-DIRECTOR-IP \
    --ca-cert /var/tempest/workspaces/default/root_ca_certificate
    ```
    Where:

    * `ENVIRONMENT` is an alias of your choice. For example, `tkgi`.
    * `BOSH-DIRECTOR-IP` is the BOSH Director IP address you located in the
    first step. For example, `10.0.0.3`.

    For example:
    ```console
    $ bosh alias-env tkgi -e 10.0.0.3 \
    --ca-cert /var/tempest/workspaces/default/root_ca_certificate
    ```
1. To log in to the BOSH Director using the alias you set, run the following command:

    ```
    bosh -e ENVIRONMENT login
    ```

    For example:
    ```console
    $ bosh -e tkgi login
    ```
    Alternatively, you can set the BOSH environment variables on the {{ vars.platform_name }} VM to authenticate with the BOSH Director VM.
    For more information, see [Authenticate with the BOSH Director VM](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/install-trouble-advanced.html#log-in) in
    _Advanced Troubleshooting with the BOSH CLI_ in the {{ vars.platform_name }} documentation.


## <a id='tkgi-api'></a>SSH into the {{ vars.product_short }} API VM

To SSH into the {{ vars.product_short }} API VM using the BOSH CLI, follow the steps below:

{{> bosh-ssh-api }}



## <a id='pks-db'></a>SSH into the {{ vars.product_short }} Database VM

To SSH into a {{ vars.product_short }} Database VM using the BOSH CLI, follow the steps below:

{{> bosh-ssh-db }}



## <a id='cluster'></a>SSH into a Kubernetes Cluster VM

Each Kubernetes cluster corresponds to a BOSH deployment.
To SSH into a {{ vars.product_short }}-provisioned Kubernetes cluster VM using the BOSH CLI, follow the steps below:

{{> ssh-cluster-master-node }}



## <a id='bosh-tkgi-map'></a>View Log Files

Log files contain error messages and other information you can use to diagnose issues
with your {{ vars.product_short }} deployment.
To access {{ vars.product_short }} log files,
SSH into the {{ vars.product_short }} API VM, or a Kubernetes cluster VM, and then follow the steps below:

1. To act as super user on your VM, run the following command:

    ```console
    sudo su
    ```

1. Navigate to the `/var/vcap/sys/log` log file directory:

  ```console
  cd /var/vcap/sys/log
  ```

1. Examine the contents of the `/var/vcap/sys/log` directory.
For example, when diagnosing issues with a Kubernetes cluster VM, you might want to review the following log files:
  * On a control plane VM, examine the `kube-apiserver` subdirectory.
  * On a worker VM, examine the `kubelet` subdirectory.
