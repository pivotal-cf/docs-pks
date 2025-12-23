---
title: Configuring BOSH Director with VMware NSX for Tanzu Kubernetes Grid Integrated Edition
owner: {{ vars.platform_name }}
iaas: vSphere
authenttype: boshtile
---

This topic describes how to configure BOSH Director for vSphere with NSX integration for {{  vars.product_full }}.

##<a id='other-super-certificates'></a> How {{{ vars.platform_name }}} Accesses NSX Manager

{{> other-super-certificates }}


##<a id='prerequisites'></a>Prerequisites

Before you begin this procedure, ensure that you have successfully completed all preceding steps for installing {{  vars.product }} on vSphere with NSX, including:

<ul>
  <li>
    <a href="./vsphere-nsxt-index-prepare.html">Preparing to Install {{  vars.product }} on vSphere with VMware NSX</a>
  </li>
  <li>
    <a href="./vsphere-nsxt-rpd-mpd.html">Hardware Requirements for {{  vars.product }} on vSphere with NSX</a>
  </li>
  <li>
    <strong>NSX-T v3.0:</strong>
    <a href="./nsxt-3-0-install.html">Installing and Configuring NSX-T Data Center v3.0 for {{  vars.product }}</a>
  </li>
  <li>
    <a href="./vsphere-nsxt-om-deploy.html">Deploying {{ vars.platform_name }} with NSX for {{  vars.product }}</a>
  </li>
  <li>
    <a href="./nsxt-3-0-install.html#nsxt30-mgmt-ssl">Generate and Register the NSX-T Management SSL Certificate and Private Key</a> in <em>Installing and Configuring NSX-T Data Center v3.0 for {{ vars.product_short }}</em>
  </li>
</ul>

## <a id="set-up"></a>Step 1: Open the BOSH Director Tile

To configure BOSH Director:

1. Log in to {{ vars.platform_name }} with the user name and password credentials that you set up in
[Configure {{ vars.platform_name }} for {{  vars.product }}](vsphere-nsxt-om-deploy.html#config-om).

1. Click the **BOSH Director for vSphere** tile.


    {{ image_tag src="images/nsxt/bosh/config-bosh-01.png" alt="{{ vars.platform_name }} UI before the {{ vars.product_short }} tile has been imported" }}

## <a id='vcenter-config'></a>Step 2: Configure vCenter for {{  vars.product }}

To configure BOSH Director with your vCenter settings:

1. Select **vCenter Config** in BOSH Director.

    {{ image_tag src="images/nsxt/bosh/config-bosh-02.png" alt="{{ vars.product_short }} tile vCenter Config tab default configuration" }}

1. Enter the following information:
    * **Name**: A name that you provide for your vCenter configuration.
    This field is used to identify the data center configuration in {{ vars.platform_name }} if you are configuring multiple data centers.
    * **vCenter Host**: The hostname of the vCenter that manages ESXi/vSphere.
      <p class="note"><strong>Note</strong>: The FQDN for the vCenter Server cannot contain uppercase letters.</p>
    * **vCenter Username**: A vCenter user name with create and delete privileges for virtual machines (VMs) and folders.
    * **vCenter Password**: The password for the vCenter user specified above.
    * **Datacenter Name**: The name of the data center as it appears in vCenter.
    * **Virtual Disk Type**: The Virtual Disk Type to provision for all VMs. For guidance on selecting a virtual disk type, see [vSphere Virtual Disk Types](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-platform-for-cloud-foundry/5-0/tpcf/disk-format.html).
    * **Ephemeral Datastore Names (comma delimited)**: The names of the datastores that store ephemeral VM disks deployed by {{ vars.platform_name }}.
    * **Persistent Datastore Names (comma delimited)**: The names of the datastores that store persistent VM disks deployed by {{ vars.platform_name }}.

    <p class="note"><strong>Note</strong>: The vSphere datastore type must be Datastore. {{  vars.product }} does not support the use of vSphere Datastore Clusters with or without Storage DRS. For more information, see <a href="https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/7-0/vsphere-monitoring-and-performance-7-0/monitoring-inventory-objects/overview-performance-charts/datastores.html">Datastores and Datastore Clusters</a> in the vSphere documentation.</p>

1. For Networking, select **NSX Networking**.

    {{ image_tag src="images/nsxt/bosh/config-bosh-03p.png" alt="{{ vars.product_short }} tile vCenter Config tab with NSX networking selected" }}

1. Configure NSX networking as follows:
    * **NSX Mode**: Select **NSX** to use NSX networking for dynamically created node networks.
    * **NSX Address**: Enter the FQDN or IP address of the NSX Manager, or the VIP address of the NSX Management Cluster.
    * **NSX Authentication**: Select the authentication mode, either **Local User Authentication** or **Certificate Authentication**.
    * **NSX Username** and **NSX Password**: If you selected **Local User Authentication**, enter the NSX Manager user name and password.
    * **NSX Manager Principal Identity Certificate** and **NSX Manager Principal Identity Private Key**: If you selected **Certificate Authentication**, enter the NSX Manager Principal Identity Certificate and Private Key. For more information, see [Generating and Registering the NSX Manager Superuser Principal Identity Certificate and Key](./nsxt-generate-pi-cert.html).
    * **Use NSX Policy API**: Select this option to use the NSX Policy API instead of the NSX Management API. For more information, see [Considerations for Using the NSX Policy API with {{ vars.product_short }}](./nsxt-policy-api-considerations.html).
    * **NSX CA Cert**: Provide the CA certificate in PEM format that authenticates to the NSX server. Copy the contents of the NSX CA certificate that you generated in [Generate and Register the NSX Management SSL Certificate and Private Key](./nsxt-3-0-install.html#nsxt30-mgmt-ssl) to this field.

1. Configure the following folder names:
    * **VM Folder**: The vSphere data center folder where {{ vars.platform_name }} places VMs.
    * **Template Folder**: The vSphere data center folder where {{ vars.platform_name }} places VMs.
    * **Disk path Folder**: The vSphere datastore folder where {{ vars.platform_name }} creates attached disk images. You must not nest this folder.

    <p class="note"><strong>Note</strong>: After your initial deployment, you cannot edit the VM Folder, Template Folder, and Disk path Folder names.</p>

    {{ image_tag src="images/nsxt/bosh/config-bosh-04.png" alt="{{ vars.product_short }} tile vCenter Config tab NSX networking NSX CA Cert and folder config" }}

1. Click **Save**.

    {{ image_tag src="images/nsxt/bosh/config-bosh-05.png" alt="{{ vars.product_short }} tile vCenter Config tab - Settings updated notification" }}

## <a id='dir-config'></a>Step 3: Configure BOSH Director

To configure BOSH Director settings:

1. Select **Director Config** in  BOSH Director.

    {{ image_tag src="images/nsxt/bosh/config-bosh-06.png" alt="{{ vars.product_short }} tile Director Config tab default configuration" }}

1. In the **NTP Servers (comma delimited)** field, enter your NTP server addresses.

    <p class="note"><strong>Note:</strong> The NTP server configuration only updates
    after VM recreation. Ensure that you select the <strong>Recreate VMs deployed by the BOSH Director</strong> check box
    if you modify the value of this field.</p>

1. Leave the **JMX Provider IP Address** field blank.

1. Leave the **Bosh HM Forwarder IP Address** field blank.

1. Select the **Enable VM Resurrector Plugin** to enable BOSH Resurrector functionality.

1. Select **Enable Post Deploy Scripts** to run a post-deploy script after deployment. This script allows the job to execute additional commands against a deployment.
  <p class="note"><strong>Note</strong>: You must enable post-deploy scripts to install {{  vars.product }}.</p>

1. Select **Recreate VMs deployed by the BOSH Director** to force BOSH to recreate all BOSH-managed VMs on the next deploy. This process does not destroy any persistent disk data.

1. For typical {{  vars.product }} deployments, the default settings for all other BOSH Director configuration parameters are suitable. Optionally you can apply additional configurations to BOSH Director. See [Director Config Pane](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/vsphere-config.html#dir-config) in <em>Configuring BOSH Director on vSphere</em> in the {{ vars.platform_name }} documentation for details.
<p class="note"><strong>Note</strong>: If you need to be able to remotely access the BOSH Director VM using the BOSH CLI, and you are deploying {{  vars.product }} with NSX in a NAT topology, you must provide the <strong>Director Hostname</strong> for BOSH at the time of installation. See <a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/vsphere-config.html#dir-config">Director Config Pane</a> in <em>Configuring BOSH Director on vSphere</em> in the {{ vars.platform_name }} documentation for details.</p>

1. Click **Save**.

    {{ image_tag src="images/nsxt/bosh/config-bosh-07.png" alt="{{ vars.product_short }} tile Director Config tab - Settings updated notification" }}

## <a id='create-az'></a>Step 4: Create Availability Zones

On vSphere with NSX, operators define and create Availability Zones (AZs) using vCenter clusters and resource pools.
Plans defined in the {{ vars.product_short }} tile then use these AZs to enable high availability for {{ vars.product_short }} clusters.

The {{  vars.product }} control plane also runs in one of the AZs.

For more information on AZs in {{ vars.product_short }}, see [Availability Zones](./control-plane.html#azs)
in _{{  vars.product }} Architecture_.

To configure Availability Zones:

1. Select **Create Availability Zones** in BOSH Director.

    {{ image_tag src="images/nsxt/bosh/config-bosh-08.png" alt="{{ vars.product_short }} tile Create Availability Zones tab default configuration" }}

1. Use the following steps to create one or more Availability Zones for {{  vars.product }} to use:
    1. Click **Add** and create the {{  vars.product }} Management AZ.
    1. Enter a unique **Name** for the Availability Zone, such as `AZ-MGMT`.
    1. Select the IaaS configuration (vSphere/vCenter).
    1. Enter the name of an existing vCenter **Cluster** to use as an Availability Zone, such as `COMP-Cluster-1`.
    1. Enter the name of the {{  vars.product }} Management **Resource Pool** in the vCenter cluster that you specified above, such as `RP-MGMT-TKGI`. The jobs running in this Availability Zone share the CPU and memory resources defined by the pool.
    1. Click **Add Cluster** and create at least one {{  vars.product }} Compute AZ.
    1. Specify the **Cluster** and the **Resource Pool**, such as `RP-TKGI-AZ`.
    Alternatively, specify the **Cluster** and the **Host Group**.
    See [Using vSphere Host Group](./vsphere-host-group.html) for more information.
    1. (Optional) If you are using a host group with vSAN Stretched Clusters,
        set the **VM-Host Affinity Rule** dropdown to `SHOULD`. This setting maintains high availability
        by letting {{ vars.product_short }} restart VMs in another host group if their AZ fails.
        {{ vars.product_short }} ignores this setting if the vSAN cluster has no host group configured.
<br>
    1. Add additional clusters as necessary. Click the trash icon to delete a cluster. The first cluster cannot be deleted.

    {{ image_tag src="images/nsxt/bosh/config-bosh-09.png" alt="{{ vars.product_short }} tile Create Availability Zones AZ-MGMT configuration" }}

    {{ image_tag src="images/nsxt/bosh/config-bosh-11.png" alt="{{ vars.product_short }} tile Create Availability Zones AZ-COMP-1 configuration" }}

    {{ image_tag src="images/nsxt/bosh/config-bosh-13.png" alt="{{ vars.product_short }} tile Create Availability Zones AZ-COMP-2 configuration" }}

    {{ image_tag src="images/nsxt/bosh/config-bosh-29-host-group.png" alt="{{ vars.product_short }} tile Create Availability Zones PKS-AZ1-HostGroup1 configuration" }}

1. Click **Save**.

    {{ image_tag src="images/nsxt/bosh/config-bosh-12.png" alt="{{ vars.product_short }} tile Create Availability Zones - Settings updated notification" }}

## <a id='create-networks'></a>Step 5: Create Networks

You must configure and create BOSH Director networking.

<p class="note"><strong>Note</strong>: If you are using <a href="nsxt-topologies.html#topology-no-nat-virtual-switch">No-NAT with Virtual Switch (VSS/VDS) Topology</a>,
    create the infrastructure network and optionally the {{ vars.product_short }} network by
    following the instructions in <a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/vsphere-config.html#create-networks">Create Networks Pane</a> in
    <i>Configuring BOSH Director on vSphere</i> in the {{ vars.platform_name }} documentation.
    While completing the steps in <a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/vsphere-config.html#create-networks">Create Networks Pane</a>,
    do not create the <code>services</code> network. With {{ vars.product_short }} on NSX, NSX manages the dynamically created networks.
</p>

To configure BOSH Director networking:

1. Select **Create Networks** in BOSH Director.

    {{ image_tag src="images/nsxt/bosh/config-bosh-15.png" alt="{{ vars.product_short }} tile Create Networks tab default configuration" }}

1. Select **Enable ICMP checks** to enable ICMP on your networks. {{ vars.platform_name }} uses ICMP checks to confirm that components within your network are reachable.

1. Click **Add Network**.

    {{ image_tag src="images/nsxt/bosh/config-bosh-16.png" alt="{{ vars.product_short }} tile Create Networks tab NET-MGMT-PKS network configuration" }}

1. Create the following network:
  * `NET-MGMT-TKGI`: Network for {{ vars.platform_name }}, BOSH Director, and {{  vars.product }} components. This network maps to the NSX logical switch created for the {{  vars.product }} Management Network. See [Create Management Plane](./nsxt-3-0-install.html#nsxt30-mgmt-plane) in _Installing and Configuring NSX-T Data Center v3.0 for {{ vars.product_short }}_.

      <p class="note"><strong>Note</strong>: NSX automatically creates the service network to be used by the control plane and worker nodes (VMs) for Kubernetes clusters managed by {{  vars.product }}. Do not manually create this network.</p>

    Use the following values as a guide when you define the network in BOSH. Replace the IP addresses with ranges you defined for the [Create Management Plane](./nsxt-3-0-install.html#nsxt30-mgmt-plane) in _Installing and Configuring NSX-T Data Center v3.0 for TKGI_. Reserve any IP addresses from the subnet that are already in use, such as the IP for {{ vars.platform_name }} and subnet gateway.
    <table>
    <tr>
      <th rowspan="7">Infrastructure<br> Network</th>
      <th>Field</th>
      <th>Configuration</th>
    </tr>
    <tr>
      <td>Name</td>
      <td><code>NET-MGMT-TKGI</code></td>
    </tr>
    <tr>
      <td>vSphere Network Name</td>
      <td><code>LS-MGMT-TKGI</code></td>
    </tr>
    <tr>
      <td>CIDR</td>
      <td><code>10.0.0.0/24</code></td>
    </tr>
    <tr>
      <td>Reserved IP Ranges</td>
      <td><code>10.0.0.1-10.0.0.2</code></td>
    </tr>
    <tr>
      <td>DNS</td>
      <td><code>10.20.20.1</code></td>
    </tr>
    <tr>
      <td>Gateway</td>
      <td><code>10.0.0.1</code></td>
    </tr>
    </table>

1. Select the **AZ-MGMT** Availability Zone to use with the `NET-MGMT-TKGI` network.

      <p class="note"><strong>Note</strong>: Do not select the COMPUTE network at this point in the configuration.
      It will be configured at the end of the procedure.</p>

1. Click **Save**.

    {{ image_tag src="images/nsxt/bosh/config-bosh-17.png" alt="{{ vars.product_short }} tile Create Networks - Settings updated notification" }}

## <a id='assign-azs'></a>Step 6: Assign AZs and Networks

To configure the AZs and the Network for BOSH Director:

1. Select **Assign AZs and Networks** in BOSH Director.

    {{ image_tag src="images/nsxt/bosh/config-bosh-18.png" alt="{{ vars.product_short }} tile Assign AZs and Networks tab default configuration" }}

1. Use the drop-down menu to select a **Singleton Availability Zone**. The {{ vars.platform_name }} Director installs in this Availability Zone. For {{  vars.product }}, this will be the `AZ-MGMT` availability zone.

1. Use the drop-down menu to select a **Network** for BOSH Director. BOSH Director runs on the {{  vars.product }} Management Plane network. Select the `NST-MGTM-TKGI` network.

1. Click **Save**.

    {{ image_tag src="images/nsxt/bosh/config-bosh-19.png" alt="{{ vars.product_short }} tile Assign AZs and Networks - Settings updated notification" }}

## <a id='security-config'></a>Step 7: Configure Security

To configure a BOSH Director certificate and password:

1. Select **Security** in BOSH Director.

1. In **Trusted Certificates**, enter a custom certificate authority (CA) certificate to insert into your organization's certificate trust chain. This feature allows all BOSH-deployed components in your deployment to trust a custom root certificate.<br/><br/>

	If you are using self-signed CAs for the infrastructure components (NSX, vCenter), you need to add every CA of every component your deployment might connect to. In other words, the bundle must include all certificates for any component that connects to or from BOSH.

    If you are using a private Docker registry, such as VMware Harbor, use this field to enter the certificate for the registry. See [Integrating Harbor Registry with {{  vars.product }}](https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/integrating-pks.html) for details.

1. Choose **Generate passwords** or **Use default BOSH password**. Use the **Generate passwords** option for increased security.

1. Click **Save**. To view your saved Director password, click the **Credentials** tab.

## <a id='bosh-dns'></a> Step 8: Configure BOSH DNS

To configure BOSH Director DNS:

1. Select <strong>BOSH DNS Config</strong> in BOSH Director.

1. (Optional) In <strong>Excluded Recursors</strong>, enter a list of prohibited DNS recursor addresses.

1. (Optional) In <strong>Recursor Timeout</strong>, enter a time limit for contacting the connected DNS recursors. This includes dialing, writing, and reading from the DNS recursor. If any of these actions exceeds the time limit you set, the action fails.
    <p class="note"><strong>Note</strong>: This time limit must include one of the Go parse duration time units. For example, entering <code>5s</code> sets the timeout limit to five seconds. For more information about supported time units, see <a href="https://golang.org/pkg/time/#ParseDuration">func ParseDuration</a> in the Go Programming Language documentation.</p></li>
1. (Optional) In <strong>Handlers</strong>, enter a list of custom domain handlers in JSON format.
1. Click <strong>Save</strong>.</li>

## <a id='syslog'></a>Step 9: Configure Logging

To configure BOSH Director logging:

1. Select **Syslog** in BOSH Director.

1. (Optional) To send BOSH Director system logs to a remote server, select **Yes**.

1. In the **Address** field, enter the IP address or DNS name for the remote server.

1. In the **Port** field, enter the port number that the remote server listens on.

1. In the **Transport Protocol** dropdown menu, select **TCP** or **UDP**. This selection determines which transport protocol is used to send the logs to the remote server.

1. (Optional) Select the **Enable TLS** check box to send encrypted logs to remote server with TLS. After you select the check box, perform the following steps:
  1. Enter either the name or SHA1 fingerprint of the remote peer in **Permitted Peer**.
  1. Enter the SSL certificate for the remote server in **SSL Certificate**.
<p class="note">**Note**: For an optimal security configuration, enable TLS encryption when you are forwarding logs. Logs can contain sensitive information, such as cloud provider credentials.</p>
1. (Optional) Enter an integer in **Queue Size**. This value specifies the number of log messages held in the buffer. The default value is 100,000.
1. (Optional) Select the check box to **Forward Debug Logs** to an external source. This option is deselected by default. If you select it, you might generate a large amount of log data.
1. (Optional) Enter configuration details for rsyslog in the **Custom rsyslog Configuration** field. This field requires the RainerScript syntax.
1. Click **Save Syslog Settings**.

## <a id='resource-config'></a>Step 10: Configure Resources

To configure BOSH Director resources:

1. Select **Resource Config** in BOSH Director.

1. Adjust any values as necessary for your deployment. Under the **Instances**, **Persistent Disk Type**, and **VM Type** fields,
choose **Automatic** from the drop-down menu to allocate the recommended resources for the job. If the **Persistent Disk Type** field reads **None**, the job does not require persistent disk space.

    <p class="note"><strong>Note</strong>: {{ vars.platform_name }} requires a Director VM with at least 8&nbsp;GB memory.</p>

    <p class="note"><strong>Note</strong>: If you set a field to <strong>Automatic</strong> and the recommended resource allocation changes in a future version, {{ vars.platform_name }} automatically uses the updated recommended allocation.</p>

1. Click **Save**.

## <a id='custom-vm-extensions'></a> Step 11: (Optional) Add Custom VM Extensions

Use the {{ vars.platform_name }} API to add custom properties to your VMs such as associated security groups and load balancers.

For more information, see [Managing Custom VM Extensions](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/install-custom-vm-extensions.html).

## <a id='deploy-bosh'></a>Step 12: Deploy BOSH

To deploy BOSH:

1. Go to the {{ vars.platform_name }} **Installation Dashboard**.

    {{ image_tag src="images/nsxt/bosh/config-bosh-20.png" alt="Ops Manger UI showing the Review Pending Changes button" }}

1. Click **Review Pending Changes**.

    {{ image_tag src="images/nsxt/bosh/config-bosh-21.png" alt="{{ vars.platform_name }} UI Review Pending Changes view" }}

1. Click **Apply Changes**.

    {{ image_tag src="images/nsxt/bosh/config-bosh-22.png" alt="{{ vars.platform_name }} UI Applying Changes progress view" }}

1. Confirm changes applied successfully.

    {{ image_tag src="images/nsxt/bosh/config-bosh-23.png" alt="{{ vars.platform_name }} UI Apply Changes - Changes Applied notification" }}

1. Check BOSH VM. Log in to vCenter and check for the `p-bosh` VM deployment in the {{  vars.product }} Management resource pool.

    {{ image_tag src="images/nsxt/bosh/config-bosh-24.png" alt="vCenter UI p-bosh VM deployment configuration" }}

## <a id='update-network-azs'></a>Step 13: Update Network Availability Zones

After successfully deploying BOSH, ensure that both the Management AZ and the Compute AZs appear in the {{  vars.product }} tile Plans.

To ensure that the Management AZ and the Compute AZs are included in the `NET-MGMT-TKGI` network you defined above:

1. Return to the BOSH tile and click **Create Networks**.

    {{ image_tag src="images/nsxt/bosh/config-bosh-26.png" alt="{{ vars.product_short }} tile Create Networks configuration" }}

1. Edit the network (`NET-MGMT-TKGI`) and each COMPUTE AZ.

    {{ image_tag src="images/nsxt/bosh/config-bosh-27.png" alt="{{ vars.product_short }} tile Create Networks NET-MGMT-PKS network configuration" }}

1. Click Save.

    {{ image_tag src="images/nsxt/bosh/config-bosh-28.png" alt="{{ vars.product_short }} tile Create Networks - Settings updated notification" }}

1. Review pending changes, and click **Apply Changes** to redeploy BOSH.

##<a id='next'></a> Next Step

<a href="./nsxt-generate-pi-cert.html">Generate and Register the NSX Manager Superuser Principal Identity Certificate and Key for {{  vars.product }}</a>.
