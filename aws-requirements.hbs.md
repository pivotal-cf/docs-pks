---
title: AWS Prerequisites and Resource Requirements

---

This topic describes the prerequisites and resource requirements for installing {{  vars.product_full }} on Amazon Web Services (AWS).

##<a id='prerequisites'></a> Prerequisites

Before installing {{  vars.product }}:

1. Review the sections below.

1. Install and configure {{ vars.platform_name }}.
To install {{ vars.platform_name }}, follow the instructions in [Installing and Configuring {{ vars.platform_name }} on AWS](aws-om-install-config.html).

##<a id='resources'></a> Resource Requirements

Installing {{ vars.platform_name }} and {{  vars.product }} requires the following virtual machines (VMs):

<table>
  <tr>
    <th>VM</th>
    <th>VM Type</th>
    <th>Default VM Count</th>
  </tr>
  <tr>
    <td>BOSH Director</td>
    <td>m4.large</td>
    <td>1</td>
  </tr>
  <tr>
    <td>TKGI API</td>
    <td>m4.large</td>
    <td>1</td>
  </tr>
  <tr>
    <td>TKGI Database</td>
    <td>m4.large</td>
    <td>1</td>
  </tr>
</table>

<p class="note"><strong>NOTE:</strong> VMware recommends deploying TKGI on its own dedicated {{ vars.platform_name }} instance, rather than on a shared {{ vars.platform_name }} that also hosts other runtimes such as {{ vars.app_runtime }}.</p>

{{> _increase_persistent_disk }}


<h3> Kubernetes Cluster Resources </h3>

Each Kubernetes cluster provisioned through {{  vars.product }} deploys the VMs listed below. If you deploy more
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
    <td>1</td>
    <td>2</td>
    <td>4</td>
    <td>32</td>
    <td>5</td>
  </tr>
  <tr>
    <td>Worker</td>
    <td>1</td>
    <td>2</td>
    <td>4</td>
    <td>32</td>
    <td>50</td>
  </tr>
</table>
