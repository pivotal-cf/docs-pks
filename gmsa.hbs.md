---
title: Authenticate Windows Clusters with Active Directory

topic: gmsa-cluster
---

This topic describes how to integrate Microsoft Active Directory (AD)
with your {{  vars.product }} (TKGI) Windows worker-based Kubernetes clusters.

* [Overview](#overview)
* [Prerequisites](#prereqs)
* [Create a New Cluster with AD Authentication](#create)
* [Add or Change a Cluster's AD Authentication](#change-ad)
* [Change a Cluster with AD Authentication to use Pod-Based gMSA](#non-joined-nodes)
  * [Pod-Based gMSA Troubleshooting](#non-joined-nodes-troubleshooting)
* [Integrate Kubernetes with Active Directory](#integrate)
* [View a Cluster's gMSA Configuration](#list)
* [GMSA Configuration Settings](#settings)

## <a id='overview'></a>Overview

Windows Server with Active Directory can control access to Windows worker-based Kubernetes clusters in TKGI.
To enable this, you integrate a group Managed Service Account (gMSA) in AD with the cluster's Windows pods and containers.

<p class="note"><strong>Note:</strong> Once a cluster has been created or updated to use AD authentication, you cannot update it to stop using AD authentication.</p>

For information about gMSAs see
[Group Managed Service Accounts Overview](https://docs.microsoft.com/en-us/windows-server/security/group-managed-service-accounts/group-managed-service-accounts-overview)
in the Microsoft Windows Server documentation.

To manage AD integration with a TKGI-provisioned Windows worker-based Kubernetes cluster:

* [Create a New Cluster with AD Authentication](#create)
* [Add or Change a Cluster's AD Authentication](#change-ad)
* [Change a Cluster with AD Authentication to use Pod-Based gMSA](#non-joined-nodes)
* [Integrate Kubernetes with Active Directory](#integrate)
* [View a Cluster's gMSA Configuration](#list)


## <a id='prereqs'></a>Prerequisites

To use AD to control access to Windows worker-based Kubernetes clusters, you need an AD server configured with:

  - A gMSA account
  - A security group that includes the gMSA account


## <a id='create'></a>Create a New Cluster with AD Authentication

To create a TKGI cluster configured with AD gMSA authentication:

1. Define the gMSA settings in a configuration file on your local filesystem.
For configuration information, see [GMSA Configuration Settings](#settings), below.

1. Pass the file location to the `--config-file` flag of `tkgi create-cluster`.
For information about creating clusters, see [Creating Clusters](create-cluster.html).

1. Integrate the cluster with the AD gMSA as described in [Integrate Kubernetes with Active Directory](#integrate), below.


## <a id='change-ad'></a>Add or Change a Cluster's AD Authentication

To configure an existing TKGI cluster for Active Directory gMSA authentication, or to change its gMSA configuration:

<p class="note"><strong>Note:</strong> Once a cluster has been created or updated to use AD authentication, you cannot update it to stop using AD authentication.</p>

1. Define the gMSA settings in a configuration file on your local filesystem:

    * To retain a previous setting, do not include it in the configuration file.
    * To unset a previous setting, set it to `{}` (for an object) or `""` (for a string) in the configuration file.

    For configuration information, see [GMSA Configuration Settings](#settings), below.

1. If you are updating a cluster that uses a public cloud CSI driver,
see [Limitations on Using a Public Cloud CSI Driver](release-notes.html#1-22-0-csi-driver-limits)
in _Release Notes_ for additional requirements.

1. Run the following command to update the cluster with the configuration file:

    ```
    tkgi update-cluster CLUSTER-NAME --config-file CONFIG-FILE-NAME
    ```

    Where:

    * `CLUSTER-NAME` is the name of the existing Kubernetes cluster.
    * `CONFIG-FILE-NAME` is the path and filename of the configuration file you want to apply to the cluster.
    For information about GMSA command line configuration, see [GMSA Configuration Settings](#settings) below.

    <p class="note warning"><strong>WARNING</strong>: Update the configuration file only on a TKGI cluster that has been upgraded to the current TKGI version. For more information, see <a href="understanding-upgrades.html#control-plane-upgrades-supported-tasks">Tasks Supported Following a TKGI Control Plane Upgrade</a> in <em>About {{  vars.product }} Upgrades</em>.
    </p>

1. Integrate the cluster with the AD gMSA as described in [Integrate Kubernetes with Active Directory](#integrate), below.

## <a id='non-joined-nodes'></a> Change a Cluster with AD Authentication to use Pod-Based gMSA

To change an existing cluster that joins gMSA domains at the node level to instead use the `non_domain_joined` option to integrate at the pod level:

1. Set up the AD server with the gMSA account is configured to work as a DNS server for both nodes and pods.

1. Set `HostAccountConfig` values in a `GMSACredentialSpec` CRD as described in [Integrate Kubernetes with Active Directory](#integrate).

1. If you created new Group, User, or Service Account objects in AD, modify your gMSA-related CRD's in Kubernetes to reflect the changes.

1. Apply the `GMSACredentialSpec` and any other CRDs that you modified.

1. Add `non_domain_joined: "true"` to the cluster configuration file.

1. Run the following command to update the cluster with the configuration file:

    ```
    tkgi update-cluster CLUSTER-NAME --config-file CONFIG-FILE-NAME
    ```

    Where:

    * `CLUSTER-NAME` is the name of the existing Kubernetes cluster.
    * `CONFIG-FILE-NAME` is the path and filename of the configuration file you want to apply to the cluster.
    For information about GMSA command line configuration, see [GMSA Configuration Settings](#settings) below.

    <p class="note warning"><strong>WARNING</strong>: Update the configuration file only on a TKGI cluster that has been upgraded to the current TKGI version. For more information, see <a href="understanding-upgrades.html#control-plane-upgrades-supported-tasks">Tasks Supported Following a TKGI Control Plane Upgrade</a> in <em>About {{  vars.product }} Upgrades</em>.
    </p>

1. Roll out the deployments.


### <a id='non-joined-nodes'></a> Pod-Based gMSA Troubleshooting

Troubleshooting tips for `non_domain_joined` gMSA:

- Make sure the AD server with the gMSA account is configured to work as a DNS server for both nodes and pods.
- Plugin's log is at `c:/temp/logfile.log`, this is specified in the `GMSACredentialSpec`.
- To find the events of Windows, run `get-winevent -logname Microsoft-Windows-Containers-CCG/Admin` in the node.
- To make sure the non-domain-joined setup successfully, please refer to the logs in `C:/var/vcap/sys/log/join-domain` and `C:/var/vcap/sys/log/join-gmsa`.


## <a id='integrate'></a>Integrate Kubernetes with Active Directory

Once you have a cluster configured in Tanzu Kubernetes Grid and AD to access the gMSA, you need to run the following Kubernetes operations to integrate the cluster with the gMSA at the Kubernetes level.

This procedure is described in [Configure GMSA for Windows Pods and containers](https://kubernetes.io/docs/tasks/configure-pod-container/configure-gmsa/#configure-gmsas-and-windows-nodes-in-active-directory) in the Kubernetes documentation, with one exception.
The exception is that you used the `--config-file` flag in the `tkgi` CLI to add the Windows nodes into the AD, instead of following the step [Configure GMSAs and Windows nodes in Active Directory](https://kubernetes.io/docs/tasks/configure-pod-container/configure-gmsa/#configure-gmsas-and-windows-nodes-in-active-directory) in the Kubernetes documentation. For information about GMSA command line configuration, see [GMSA Configuration Settings](#settings) below.

1. Create and install a `GMSACredentialSpec` object by creating and applying a CRD `gmsa.yaml` file as described in [Install the GMSACredentialSpec CRD](https://kubernetes.io/docs/tasks/configure-pod-container/configure-gmsa/#install-the-gmsacredentialspec-crd).

    - To support pods that can join gMSA domains dynamically, as set by the `non_domain_joined` cluster configuration described below, create a CRD that sets `HostAccountConfig` values as in this example:

        ```
        apiVersion: windows.k8s.io/v1
        kind: GMSACredentialSpec
        metadata:
          name: gmsa-webapp02  # This is an arbitrary name but it will be used as a reference
        credspec:
          ActiveDirectoryConfig:
            GroupManagedServiceAccounts:
            - Name: WebApp02   # Username of the GMSA account
              Scope: MYDOMAIN  # NETBIOS Domain Name
            - Name: WebApp02   # Username of the GMSA account
              Scope: mydomain.com # DNS Domain Name
            HostAccountConfig:
              PluginGUID: "{f919de1a-efc4-4902-b7e5-56a314a87262}"
              PluginInput: DOMAINNAME=mydomain.com;USERNAME=myuser;PASSWORD=mypassword;logFile=c:\\temp\\logfile.log
              PortableCcgVersion: "1"
          CmsPlugins:
          - ActiveDirectory
          DomainJoinConfig:
            DnsName: mydomain.com  # DNS Domain Name
            DnsTreeName: mydomain.com # DNS Domain Name Root
            Guid: bae5a583-612f-4e8a-9b69-9df1c5c9b81a  # GUID
            MachineAccountName: WebApp02 # Username of the GMSA account
            NetBiosName: MYDOMAIN  # NETBIOS Domain Name
            Sid: S-1-5-21-922537405-2102905723-2121843970 # SID of GMSA
        ```

        The `PluginGUID` value `{f919de1a-efc4-4902-b7e5-56a314a87262}` is a fixed value in the TKGI source code.

        For security, it is not mandatory to set `PluginInput` `DOMAINNAME`; `USERNAME`; and `PASSWORD` in this `GMSACredentialSpec` object.
        If omitted, you can set these values as `domain_user_username` and `domain_user_password` in a local cluster configuration file that you pass to the `--config-file` option of `tkgi create-cluster`.

1. To prepare for the next step, download the [example script `deploy-gmsa-webhook.sh`](https://github.com/kubernetes-sigs/windows-gmsa/blob/master/admission-webhook/deploy/deploy-gmsa-webhook.sh) and update its `CA_BUNDLE` setting:
    1. `bosh ssh` into the cluster's control plane node. For more information, see [SSH into a Kubernetes Cluster VM](diagnostic-tools.html#cluster).
    1. Fetch the `/var/vcap/jobs/kube-controller-manager/config/cluster-signing-ca.pem` file and name it locally as `ca-master.pem`.
    1. Edit `CA_BUNDLE` setting in the `deploy-gmsa-webhook.sh` example script linked above to read as follows:

        ```
        CA_BUNDLE="$(cat ca-master.pem|base64 -w 0)"
        ```

1. Run the script to install two webhooks into the cluster that populate and validate gMSA credential spec references at the Pod or container level. For more information, see [Install webhooks to validate GMSA users](https://kubernetes.io/docs/tasks/configure-pod-container/configure-gmsa/#install-webhooks-to-validate-gmsa-users).

1. Log in to Active Directory and create gMSA credential spec resources using the `domain_service_account` and the domain information in your configuration file. For more information, see [Create GMSA credential spec resources](https://kubernetes.io/docs/tasks/configure-pod-container/configure-gmsa/#create-gmsa-credential-spec-resources).
<br>
    This step includes converting your configuration file from JSON to YAML.

1. [Configure cluster role to enable RBAC on specific GMSA credential specs](https://kubernetes.io/docs/tasks/configure-pod-container/configure-gmsa/#configure-cluster-role-to-enable-rbac-on-specific-gmsa-credential-specs) for the credential specs created in the previous step.

1. [Assign role to service accounts to use specific GMSA credspecs](https://kubernetes.io/docs/tasks/configure-pod-container/configure-gmsa/#assign-role-to-service-accounts-to-use-specific-gmsa-credspecs) for the role created in the previous step.

1. [Configure GMSA credential spec reference in Pod spec](https://kubernetes.io/docs/tasks/configure-pod-container/configure-gmsa/#configure-gmsa-credential-spec-reference-in-pod-spec) for the Pod spec created earlier.


## <a id='list'></a>View a Cluster's gMSA Configuration

You can see a cluster's current gMSA configuration by viewing its BOSH manifest:

1. Identify the names of your cluster deployments:

    ```
    bosh deployments
    ```
    <p class="note"><strong>Note:</strong> Cluster deployment names start with <code>service-instance_</code>.</p>
1. For any cluster you want to view, download its manifest:

    ```
    bosh -d DEPLOYMENT-NAME manifest > /tmp/YOUR-DEPLOYMENT-MANIFEST.yml
    ```

    Where:

    * `DEPLOYMENT-NAME` is the name of your Kubernetes cluster deployment.
    * `YOUR-DEPLOYMENT-MANIFEST` is the name of your Kubernetes cluster deployment manifest.

1. Search the manifest for gMSA configuration settings.
For configuration information, see [GMSA Configuration Settings](#settings), below.


## <a id='settings'></a>GMSA Configuration Settings

The `tkgi` CLI uses a JSON-formatted cluster configuration file to add the cluster's Windows nodes into the AD domain server and security groups, giving them access to the gMSA.
You pass the file's location to the CLI's `--config-file` flag.

<p class="note"><strong>Note:</strong> Cluster configuration files can also include settings for non-gMSA features, such as proxies.
You combine all such settings into a single, general-purpose configuration file to pass to the <code>--config-file</code> flag.</p>

gMSA settings in the cluster configuration file are:

  - `enable_gmsa`: _Boolean_. `true` to configure gMSA for a cluster. `false` to ignore all settings below.
  - `non_domain_joined`: _Boolean_. `true` enable pods to join gMSA domains independently from their host VM, making it unnecessary for host VMs to join or rejoin gMSA after reboot, as described in [Create gMSAs for Windows containers](https://learn.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/manage-serviceaccounts) in the Microsoft Containers on Windows documentation.
  - `domain_controller_ip_address`: Address of the AD server with the gMSA account.
  - `domain_fqdn`: FQDN to add the cluster nodes to, created in AD.
  - `domain_user_username`: Username for an AD account with permission to add nodes to a new domain.
  - `domain_user_password`: Password the AD account.
  - `domain_security_group`: AD security group that the gMSA account is included under.
  - `domain_service_account`: AD gMSA account.

For example:

```
{
  "enable_gmsa": true,
  "non_domain_joined": true,
  "domain_controller_ip_address": "10.199.17.52",
  "domain_fqdn": "tkgi-ad.local",
  "domain_user_username": "tkgi-admin",
  "domain_user_password": "Passw0rd",
  "domain_security_group": "WebApp01Hosts",
  "domain_service_account": "WebApp01"
}
```
