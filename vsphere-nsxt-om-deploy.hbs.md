---
title: Deploying {{ vars.platform_name }} with VMware NSX for {{  vars.product }}
owner: {{ vars.platform_name }}
---

This topic describes how to deploy {{ vars.platform_name }} on VMware vSphere with NSX integration for use with {{  vars.product_full }} ({{ vars.product_short }}).

##<a id='prerequisites'></a>Prerequisites

Before deploying {{ vars.platform_name }} with NSX for {{  vars.product }}, you must have completed the following tasks:

<ul>
  <li>
    <a href="./vsphere-nsxt-index-prepare.html">Preparing to Install {{  vars.product }} on vSphere with VMware NSX</a>
  </li>
  <li>
    <strong>NSX-T v3.0:</strong>
    <a href="./nsxt-3-0-install.html">Installing and Configuring NSX-T Data Center v3.0 for {{  vars.product }}</a>
  </li>
</ul>

In addition, review the supported {{ vars.platform_name }} versions for {{  vars.product }}.
See [{{{ vars.product_network }}}](https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.23.1).

Review the known issues for your version of {{ vars.platform_name }}. See one of the following:

* [{{ vars.platform_name }} v3.1 Release Notes](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/release-notes.html)
* [{{ vars.platform_name }} v3.0 Release Notes](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/release-notes.html)

##<a id='ssh-key'></a>Step 1: Generate SSH Key Pair

You cannot deploy {{ vars.platform_name }} without adding a public SSH key in the appropriate field of the **Customize Template** screen. If you do not add a public SSH key, {{ vars.platform_name }} shuts down automatically because it cannot find a key and might enter a reboot loop.

For instructions on generating the required SSH key pair for installing {{ vars.platform_name }}, refer to the following KB article: [Generate an SSH key pair for installing {{ vars.platform_name }} v2.6 on vSphere](https://knowledge.broadcom.com/external/article/298512/).

When you add the key value to the **Public SSH Key** field, you must enter the entire public key similar to the format required for `authorized_keys`. For example, the format required is similar to the following:

```
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAnZBapWsER/EO1hLYvV/rkZe78mUBueZGHx1kw+ByfNbLoA385Cm72L+6qq40yOIH6R42nHN/bynbeHOD4Ptes4/s2lrLJtTzEWgH9XYnId4sE5f+QTFd2kRtTzZcu8WvFudEIyCIWjO+o9yvPETs05dEl/3KDn+t9uXxiszrG9Ycb2uNNpmDES+ohm9BQQFmpwFnao+UuQbRXLCcQ3SoE3Ai5Z9O+3PBwm0IByx87/dUuqvVISAJ8yGu2hJobx9PPStFERtUsfx5x+WIu9XIkrl5tzxgH9hBDsOS9cVUYJ7kKUUf1yyro6ocHyu6TWHJHSJLt8Z2FULxMPpqdn+8Xw== my-key
```

## <a id="deploy-om"></a>Step 2: Deploy {{ vars.platform_name }} for {{  vars.product }}

1. Before starting, refer to the [{{  vars.product }} Release Notes](release-notes.html) for supported {{ vars.platform_name }} versions for {{  vars.product }}.
1. Before starting, refer to the known issues in the [{{ vars.platform_name }} v3.1 Release Notes](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/release-notes.html) or [{{ vars.platform_name }} v3.0 Release Notes](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/release-notes.html).
1. Download the [{{ vars.platform_name }} for vSphere](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware%20Tanzu%20Operations%20Manager) installation
file from the [Broadcom Support](https://support.broadcom.com).
    1. Open a browser to the [{{ vars.platform_name }}](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware%20Tanzu%20Operations%20Manager) download page on the Broadcom Support.
    1. Use the dropdown menu to select the supported {{ vars.platform_name }} release.
    1. Select the **{{ vars.platform_name }} for vSphere** download option.
    This downloads the **{{ vars.platform_name }} for vSphere** VM template as an OVA file.

1. Log into vCenter using the vSphere Client (HTML5) to deploy the {{ vars.platform_name }} OVA.

1. Select the Resource Pool defined for the {{  vars.product }} Management Plane. See [Create Management Plane](./nsxt-3-0-install.html#nsxt30-mgmt-plane) in _Installing and Configuring NSX-T Data Center v3.0 for TKGI_
 if you have not defined the {{  vars.product }} Management Resource Pool.

1. Right click the {{  vars.product }} Management Plane Resource Pool and select **Deploy OVF Template.**

1. At the **Select an OVF template** screen:
  - Click **Browse**.
  - Select the {{ vars.platform_name }} OVA file you downloaded and click **Open**.
  - Click **Next**.
    {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-001.png" alt="vCenter UI OVF Template Select an OVF template tab" }}

1. At the **Select Name and folder** screen, enter a name for the {{ vars.platform_name }} VM (or use the default name), select the **Datacenter**, and click **Next**
    {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-002.png" alt="vCenter UI OVF Template Select a name and folder tab" }}

1. At the **Select a compute resource** screen, select the {{  vars.product }} **Resource Pool** or **Cluster object** and click **Next**.
    {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-003.png" alt="vCenter UI OVF Template Select a compute resource tab" }}

1. At the **Review details** screen, confirm the configuration up to this point and click **Next**.
    {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-004.png" alt="vCenter UI OVF Template Review details tab" }}

1. At the **Select Storage** screen, select the desired Datastore, and click **Next**.
    {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-005.png" alt="vCenter UI OVF Template Select Storage tab" }}
    <p class="note warning"><strong>Warning</strong>: {{ vars.platform_name }} requires a Director VM with at least 8&nbsp;GB memory. For more information, see <a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-platform-for-cloud-foundry/5-0/tpcf/disk-format.html">vSphere Virtual Disk Types</a>.</p>

1. At the **Select Networks** screen:
  - If you are using vSphere 6.7, select the {{  vars.product }} Management T1 Logical Switch that you defined when [Create Management Plane](./nsxt-3-0-install.html#nsxt30-mgmt-plane) in _Installing and Configuring NSX-T Data Center v3.0 for TKGI_
, and click **Next**.
  {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-006.png" alt="vCenter UI OVF Template Select Storage tab configured with LS-MGMT-PKS as the Destination Network for Source Network Network 1" }}
  - If you are using vSphere 6.5, see <a href="./vsphere-nsxt-om-deploy.html#vsphere-65">Network Selection for vSphere v6.5</a>.

1. At the **Customize template** screen, enter the following information, and click **Next**.
   * **IP Address**: The IP address of the {{ vars.platform_name }} network interface, for example, `10.0.0.2` (assuming non-routable NAT-mode).
   * **Netmask**: The network mask for {{ vars.platform_name }}, for example, `255.255.255.0`.
   * **Default Gateway**: The default gateway for {{ vars.platform_name }} to use, for example, `10.0.0.1` (assuming non-routable NAT-mode).
   * **DNS**: One or more DNS servers for the {{ vars.platform_name }} VM to use, for example, `10.14.7.1`.
   * **NTP Servers**: The IP address of one or more NTP servers for {{ vars.platform_name }}, for example, `10.113.60.176`.
   * **Public SSH Key**: (Required) Enter the public SSH key to allow SSH access to the {{ vars.platform_name }} VM. You must enter the entire the public SSH key in the expected format. See <a href="#ssh-key">Step 1: Generate SSH Key Pair</a>.
   * **Custom hostname**: The hostname for the {{ vars.platform_name }} VM, for example, `ops-manager`.
    {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-007a.png" alt="vCenter UI OVF Template Customize template tab with All properties have valid values notification" }}
    {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-007b.png" alt="vCenter UI OVF Template Customize template tab with DNS, NTP Servers, Public SSH Key, and Custom Hostname settings" }}

1. At the **Ready to complete** screen, review the configuration settings and click **Finish**. This action begins the OVA import and deployment process.
    {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-008.png" alt="vCenter UI OVF Template Ready to complete tab with settings that are about to be committed" }}

1. Use the **Recent Tasks** panel at the bottom of the vCenter dashboard to check the progress of the OVA import and deployment. If the import or deployment is unsuccessful, check the configuration for errors.
    {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-100.png" alt="vCenter UI showing ops-manager cluster completion" }}

1. Right-click the {{ vars.platform_name }} VM and click **Power On**.
    {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-009.png" alt="vCenter UI ops-manager actions, Power On" }}

###<a id='vsphere-65'></a>Network Selection for vSphere v6.5

With VMware vCenter Server 6.5, when initially deploying the {{ vars.platform_name }} OVA, you cannot connect to an NSX logical switch. You must first connect to a vSphere Standard (vSS) or vSphere Distributed Switch (vDS). After the OVA deployment is complete, before powering on the {{ vars.platform_name }} VM, connect the network interface to the NSX logical switch. The instructions below describe how to do this. This issue is resolved in VMware vCenter Server 6.7. For more information about this issue, see the <a href="https://knowledge.broadcom.com/external/article?legacyId=54142">VMware Knowledge Base</a>.</p>

If you are using vSphere 6.5, at the **Select Networks** screen, select a vSS or vDS port-group such as the standard **VM Network**, and click **Next**.

Complete the remaining deployment steps as described above.

After the OVA deployment completes successfully, right-click the {{ vars.platform_name }} VM and select **Edit Settings**. Change the vNIC connection to use the `nsx.LogicalSwitch` that is defined for the TKGI Management Plane, for example, `LS-MGMT-TKGI`.
    {{ image_tag src="images/nsxt/om/deploy-om-15.png" alt="vCenter UI {{ vars.platform_name }} VM Edit Settings Virtual Hardware tab Network adapter 1 configuration" }}

## <a id="config-om"></a>Step 3: Configure {{ vars.platform_name }} for {{  vars.product }}

The first time that you start {{ vars.platform_name }}, you must select an authentication system. These instructions use <strong>Internal Authentication</strong>. For configuration details for the <strong>SAML</strong> and <strong>LDAP</strong> options, see [Logging Into {{ vars.platform_name }} with Auth](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/login.html#internal) in the {{ vars.platform_name }} documentation.

1. If you are using the <a href="nsxt-topologies.html#topology-nat">NAT deployment topology</a>, create a DNAT rule that maps the {{ vars.platform_name }} private IP to a routable IP. See [Create Management Plane](./nsxt-3-0-install.html#nsxt30-mgmt-plane) in _Installing and Configuring NSX-T Data Center v3.0 for TKGI_
 for instructions.</p>

1. If you are using the <a href="nsxt-topologies.html">No-NAT deployment topology</a>, create a DNS entry for the routable IP address that you set for {{ vars.platform_name }}. Use FQDN to log into {{ vars.platform_name }}.
  <p class="note"><strong>Note</strong>: {{ vars.platform_name }} security features require you to create a fully qualified domain name to access {{ vars.platform_name }}. See <a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/install-vsphere.html">Installing {{ vars.platform_name }} on vSphere</a>.</p>

1. Navigate to the IP address (NAT mode) or FQDN (No-NAT mode) of your {{ vars.platform_name }} VM in a web browser. Confirm the "Welcome to {{ vars.platform_name }}" page displays.
  <p class="note"><strong>Note</strong>: It is normal to experience a brief delay before the interface is accessible while the web server and VM start up.</p>
  {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-10.png" alt="{{ vars.platform_name }} authentication screen" }}

1. Select **Internal Authentication** and provide the following information:
   * **Username**, **Password**, and **Password confirmation** to create a user with administrative privileges.
   * **Decryption passphrase** and the **Decryption passphrase confirmation**. This passphrase encrypts the {{ vars.platform_name }} datastore, and is not recoverable.
   * **HTTP proxy** or **HTTPS proxy**, follow the instructions in [Configuring Proxy Settings for the BOSH CPI](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/install-pcf-director-proxy-settings.html).

1. Read the **End User License Agreement**, and select the check box to accept the terms.

1. Click **Setup Authentication**. It takes a few minutes to initialize the database.
     {{ image_tag src="images/nsxt/om/deploy-om-19.png" alt="{{ vars.platform_name }} authentication progress" }}

1. Log in to {{ vars.platform_name }} with the user name and password that you created.
     {{ image_tag src="images/nsxt/om/deploy-om-20.png" alt="{{ vars.platform_name }} password authentication screen" }}

1. Verify success. Confirm you can log in, and that you see the BOSH Director tile is present and ready for configuration, indicated by the orange color.
    {{ image_tag src="images/nsxt/nsxt-data-center-installation/om26/om-install-11.png" alt="{{ vars.platform_name }} Installation Dashboard" }}

## <a id="next"></a> Next Step

After you complete this procedure, follow the instructions in <a href="./nsxt-3-0-install.html#nsxt30-mgmt-ssl">Generate and Register the NSX Management SSL Certificate and Private Key</a> in  _Installing and Configuring NSX-T Data Center v3.0 for TKGI_.
