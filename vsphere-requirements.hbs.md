---
title: vSphere Prerequisites and Resource Requirements
owner: TKGI
topictype: vsphere
---

This topic describes the prerequisites and resource requirements for installing {{ vars.product_full }} (TKGI) on vSphere.

For prerequisites and resource requirements for installing TKGI on vSphere with NSX integration,
see [vSphere with NSX Version Requirements](vsphere-nsxt-requirements.html) and
[Hardware Requirements for {{ vars.product }} on vSphere with NSX](./vsphere-nsxt-rpd-mpd.html).

* [Prerequisites](#prerequisites)
* [vSphere Version Requirements](#vsphere)
* [Resource Requirements](#resources)
* [Network Communication Requirements](#firewall-ports)

##<a id='prerequisites'></a> Prerequisites

Before installing {{ vars.product }}:

1. Review the sections below and the instructions in [Creating Dedicated Users and Roles for vSphere (Optional)](vsphere-prepare-env.html).

1. Install and configure {{ vars.platform_name }}. To install {{ vars.platform_name }}, follow the instructions in [Installing and Configuring {{ vars.platform_name }} on vSphere](vsphere-om-install-config.html).

##<a id='vsphere'></a> vSphere Version Requirements

{{> _vsphere_versions }}


##<a id='resources'></a> Resource Requirements

Installing {{ vars.platform_name }} and {{ vars.product }} requires the following virtual machines (VMs):

<table>
  <tr>
    <th>VM</th>
    <th>CPU</th>
    <th>Memory (GB)</th>
    <th>Ephemeral Disk (GB)</th>
  </tr>
  <tr>
    <td>BOSH Director</td>
    <td>2</td>
    <td>8</td>
    <td>16</td>
  </tr>
  <tr>
    <td>{{ vars.platform_name }}</td>
    <td>1</td>
    <td>8</td>
    <td>160</td>
  </tr>
  <tr>
    <td>TKGI API</td>
    <td>2</td>
    <td>8</td>
    <td>64</td>
  </tr>
  <tr>
    <td>TKGI Database</td>
    <td>2</td>
    <td>8</td>
    <td>64</td>
  </tr>
</table>

<p class="note"><strong>NOTE:</strong> VMware recommends deploying TKGI on its own dedicated {{ vars.platform_name }} instance, rather than on a shared {{ vars.platform_name }} that also hosts other runtimes such as {{ vars.app_runtime }}.</p>

{{> _increase_persistent_disk }}


<h3> Ephemeral VM Resources </h3>

Each {{ vars.product }} deployment requires ephemeral VMs during installation and upgrades of {{ vars.product }}.
After you deploy {{ vars.product }}, BOSH automatically deletes these VMs.

To enable {{ vars.product }} to dynamically create the ephemeral VMs when needed, ensure that the following
resources are available in your vSphere infrastructure before deploying {{ vars.product }}:

<table>
  <tr>
    <th>Ephemeral VM</th>
    <th>VM&nbsp;Count</th>
    <th>CPU Cores</th>
    <th>Memory (GB)</th>
    <th>Ephemeral Disk (GB)</th>
  </tr>
  <tr>
    <td>BOSH Compilation VMs</td>
    <td>4</td>
    <td>4</td>
    <td>4</td>
    <td>32</td>
  </tr>
</table>

<h3> Kubernetes Cluster Resources </h3>

Each Kubernetes cluster provisioned through {{ vars.product }} deploys the VMs listed below. If you deploy more
than one Kubernetes cluster, you must scale your allocated resources appropriately.

<table>
  <tr>
    <th>VM</th>
    <th>VM&nbsp;Count</th>
    <th>CPU Cores</th>
    <th>Memory (GB)</th>
    <th>Ephemeral Disk (GB)</th>
    <th>Persistent Disk (GB)</th>
  </tr>
  <tr>
    <td>Control Plane</td>
    <td>1 or 3</td>
    <td>2</td>
    <td>4</td>
    <td>8</td>
    <td>5</td>
  </tr>
  <tr>
    <td>Worker</td>
    <td>1 or more</td>
    <td>2</td>
    <td>4</td>
    <td>8</td>
    <td>50</td>
  </tr>
  <tr>
    <td>Errand (ephemeral)</td>
    <td>1</td>
    <td>1</td>
    <td>1</td>
    <td>8</td>
    <td>none</td>
  </tr>
</table>

## <a id="firewall-ports"></a> Network Communication Requirements

For a complete list of network communication requirements for vSphere without NSX, see
[VMware Ports and Protocols](https://ports.vmware.com/home/vSphere+NSX-Data-Center-for-vSphere+NSX-Data-Center)
on the VMware site.