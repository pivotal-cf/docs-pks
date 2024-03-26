---
title: Deploy Tanzu Kubernetes Grid Integrated Edition by Importing a YAML Configuration File
owner: TKGI
---

If you have an existing YAML configuration file from a previous deployment of VMware Tanzu Kubernetes Grid Integrated Edition, you can use the VMware Tanzu Kubernetes Grid Integrated Edition Management Console to deploy a new Tanzu Kubernetes Grid Integrated Edition instance from that file.

You can import a YAML from an earlier supported version of Tanzu Kubernetes Grid Integrated Edition Management Console. In this case, after you import the YAML, open the configuration in the wizard and configure any missing settings that are new in this version.

For information about how to deploy Tanzu Kubernetes Grid Integrated Edition by using the configuration wizard, see [Deploy Tanzu Kubernetes Grid Integrated Edition by Using the Configuration Wizard](console-deploy-wizard.html). 

<p class="note warning"><strong> WARNING:</strong> Ideally, do not deploy TKGI from the management console to a data center that also includes TKGI instances that you deployed manually. If deploying management console and manual instances of TKGI to the same data center cannot be avoided, make sure that the TKGI instances that you deployed manually do not use the folder names 
<code>BoshVMFolder: pks_vms</code>, <code>BoshTemplateFolder: pks_templates</code>, <code>BoshDiskPath: pks_disk</code>. If a manual installation uses these folder names, the VMs that they contain will be deleted when you delete a TKGI instance from the management console.<br /><br />
If VMware NSX uses custom certificates and you do not provide the CA certificate for NSX Manager, Tanzu Kubernetes Grid Integrated Edition Management Console automatically generates one and registers it with NSX Manager. This can cause other services that are integrated with NSX Manager not to function correctly. If you have manually deployed TKGI instances to the same data center as the one to which you are deploying this instance, you must manage NSX certificates manually by specifying the <code>nsx_ca_crt</code> option.</p>

For information about how to upgrade an existing deployment, see [Upgrade Tanzu Kubernetes Grid Integrated Edition Management Console](console-upgrade.html).

## YAML Files and Passwords

When Tanzu Kubernetes Grid Integrated Edition Management Console generates the content of the YAML file for the YAML editor, it masks the passwords for NSX Manager, vCenter Server, and Harbor so that they do not appear in plain text. In the generated YAML files, the password fields look like the following example:

```
admin_password: <hidden:f065be51-84e9-4ca7-972d-ed46f7273123>
```

The `<hidden>` tag includes a GUID that refers to a database entry for the password that was entered into the configuration wizard. If you import a YAML file from an instance of Tanzu Kubernetes Grid Integrated Edition Management Console that is deployed in a different vSphere environment, the GUID provided in the hidden tag will not correspond to an entry in the database of the environment in which you are importing the YAML. As a consequence, if you import a YAML from a different vSphere environment, you must manually update the passwords for NSX Manager, vCenter Server, and Harbor in the YAML editor. If you are importing a YAML file from the same environment, the correct passwords are held in the database and no action is required.

## <a id='prereqs'></a>Prerequisites

- [Deploy the Tanzu Kubernetes Grid Integrated Edition Management Console](console-deploy-ova.html) to vCenter Server.
- The vCenter Server instance must be correctly configured for Tanzu Kubernetes Grid Integrated Edition deployment. For information about the vCenter Server requirements, see [Virtual Infrastructure Prerequisites](console-prereqs-vsphere.html).
- Depending on the type of networking to use, your infrastructure must meet the appropriate prerequisites. For information about networking prerequisites, see the following topics:
  - [Prerequisites for a Bring Your Own Topology Deployment to VMware NSX](console-prereqs-nsxt-byot.html)
  - [Prerequisites for an Automated NAT Deployment to VMware NSX](console-prereqs-nsxt-automatednat.html)
  - [Prerequisites for vSphere Without an NSX Network](console-prereqs-cni.html)
- [Log in to Tanzu Kubernetes Grid Integrated Edition Management Console](console-deploy-ova.html#access-console).
- You have an existing YAML configuration file that you exported during a previous Tanzu Kubernetes Grid Integrated Edition deployment from Tanzu Kubernetes Grid Integrated Edition Management Console.
- For information about how to set the networking parameters in the YAML file, see [Networking Options in the YAML File](#yaml-network-options) below.

## <a id='import-yaml'></a>Import a YAML Configuration File

1. On the VMware Tanzu Kubernetes Grid Integrated Edition landing page, click **Install** then **Import Configuration File**.  
    ![Start configuration wizard or import YAML file](images/console/config-yaml.png)  
    [View a larger version of this image](images/console/config-yaml.png)  
1. Drag the YAML file into the Import Configuration File window, or click **Browse** to navigate to it.
1. In the Configuration File editor, modify the contents of the YAML file appropriately for the new instance of Tanzu Kubernetes Grid Integrated Edition that you want to deploy.  
    ![Apply the generated YAML configuration](images/console/apply-yaml.png)  
    [View a larger version of this image](images/console/apply-yaml.png)  
<br><br>
If the YAML was generated by an instance of the management console that is running in a different vSphere environment, update the passwords for NSX Manager, vCenter Server, and Harbor.
<br><br>
You can click the **Edit in Wizard** button, to open the imported configuration in the wizard and modify it there. For example, if you have imported a YAML that was generated by a previous version of Tanzu Kubernetes Grid Integrated Edition Management Console, open it in the wizard so that you can configure any options that are new in this version.
<br><br>
To abandon this YAML and start again, click **Import YAML** to upload the YAML again or to import a new one.
1. When you have finished editing the YAML in the Configuration File editor, click **Export YAML** to save a copy of your updated YAML configuration.
1. Click **Apply Configuration** and **Continue** to deploy Tanzu Kubernetes Grid Integrated Edition from this configuration file.
1. On the TKGI Configuration page, follow the progress of the deployment.
1. When the deployment has completed successfully, click **Continue** to monitor and manage your deployment.  
    ![A successful Tanzu Kubernetes Grid Integrated Edition deployment](images/console/deployment-complete.png)  
    [View a larger version of this image](images/console/deployment-complete.png)  

## <a id='yaml-network-options'></a>Networking Options in the YAML File

The networking parameters for the three types of Tanzu Kubernetes Grid Integrated Edition networking are all included in the `network:` section of the YAML file. When you edit the YAML file, you only need to set those parameters that apply to your type of networking. 

The following table lists the parameters to set for each type of networking.

<table>
  <tr>
    <td>Unprepared VMware NSX</td>
    <td>Prepared  VMware NSX</td>
    <td>vSphere without NSX</td>
  </tr>
  <tr>
    <td><p>
	    <code> active_t0_edge_node</code><br />
        <code> active_t0_edge_node_ip</code><br />
		<code> additional_dep_reserved_ip_range</code><br />
        <code> autoprovision_nsx </code><br />
        <code> dep_dns</code><br />
		<code> dep_network_cidr</code><br />
        <code> dep_reserved_ip_range_from</code><br />
        <code> dep_reserved_ip_range_to</code><br />
        <code> external_portgroup_gateway</code><br />
        <code> external_portgroup_netmask</code><br />
        <code> external_portgroup_subnet</code><br />
        <code> external_vlan_id</code><br />
        <code> floating_ips_range</code><br />
        <code> nsx_manual_ssl_certs</code><br />
        <code> nsx_ca_crt</code><br />
		<code> nsx_dns</code><br />
        <code> nsx_host</code><br />
		<code> nsx_node_cidr</code><br />
        <code> nsx_password</code><br />
		<code> nsx_pod_cidr</code><br />
        <code> nsx_username</code><br />
		<code> nsx_verify_ssl_certs</code><br />
        <code> ntp_servers</code> <br />
        <code> opsman_fqdn</code><br />
		<code> standby_t0_edge_node</code><br />
        <code> standby_t0_edge_node_ip</code><br />
        <code> t0_edge_node_lb_ip</code><br />
        <code> t0_ha_mode_active_active</code><br />
		<code>use_nsx</code></p></td>
    <td>
	  <code> additional_dep_reserved_ip_range</code><br />
      <code> autoprovision_nsx</code><br />
	  <code> dep_dns</code><br />
      <code> dep_network_name</code><br />
	  <code> dep_reserved_ip_range_from</code><br />
      <code> dep_reserved_ip_range_to</code><br />
	  <code> ntp_servers</code> <br />
	  <code> nsx_ca_crt</code><br />
	  <code> nsx_dns</code><br />
	  <code> nsx_fip_id</code><br />
	  <code> nsx_host</code><br />
	  <code> nsx_manual_ssl_certs</code><br />
	  <code> nsx_nat_mode</code><br />
	  <code> nsx_node_ip_block_id</code><br />
	  <code> nsx_password</code><br />
      <code> nsx_pod_ip_block_id</code><br />
      <code> nsx_t0_id</code><br />
	  <code> nsx_username</code><br />
	  <code> nsx_verify_ssl_certs</code><br />
	  <code> opsman_fqdn</code><br />
	  <code>use_nsx</code></td>
    <td>
	  <code> additional_dep_reserved_ip_range</code><br />
      <code> additional_svc_reserved_ip_range</code><br />
	  <code> dep_dns</code><br />   
      <code> dep_network_cidr</code><br />
      <code> dep_network_gateway</code><br />
      <code> dep_network_name</code><br />
      <code> dep_reserved_ip_range_from</code><br />
      <code> dep_reserved_ip_range_to</code><br />
      <code> flannel_pod_network_cidr</code><br />
      <code> flannel_service_network_cidr</code><br />
	  <code> ntp_servers</code> <br />
      <code> opsman_fqdn</code><br />
	  <code> svc_dns</code><br />
      <code> svc_network_name</code><br />
      <code> svc_network_cidr</code><br />
      <code> svc_network_gateway</code><br />
      <code> svc_reserved_ip_range_from</code><br />
      <code> svc_reserved_ip_range_to</code><br />  
      <code> use_antrea</code><br />
	  <code> use_nsx</code></td>
  </tr>
</table>

## <a id='next-step'></a> Next Steps

You can now access the Tanzu Kubernetes Grid Integrated Edition control plane and begin deploying Kubernetes clusters. For information about how to deploy clusters directly from the management console, see [Create and Manage Clusters in the Management Console](console-create-and-manage-clusters.html).

For information about how you can use Tanzu Kubernetes Grid Integrated Edition Management Console to monitor and manage your Tanzu Kubernetes Grid Integrated Edition deployment, see [Monitor and Manage Tanzu Kubernetes Grid Integrated Edition in the Management Console](console-monitor-manage.html).

<p class="note"><strong>Important</strong>: If you deployed Tanzu Kubernetes Grid Integrated Edition with plans that use Windows worker nodes, see <a href="console-windows-workers.html">Enable Plans with Windows Worker Nodes</a> for information about how to install a Windows Server stemcell and other necessary configuration actions that you must perform. Plans that use Linux worker nodes are available immediately, but plans that use Windows worker nodes are ignored until you install the Windows Server stemcell.</p>

If Tanzu Kubernetes Grid Integrated Edition fails to deploy, see [Troubleshooting](console-troubleshooting.html).
