---
title: Azure Prerequisites and Resource Requirements

---

This topic describes the prerequisites and resource requirements for installing {{  vars.product_full }} ({{ vars.product_short }}) on Microsoft Azure.

##<a id='prerequisites'></a> Prerequisites

Before installing Tanzu Kubernetes Grid Integrated Edition:

1. Review the sections below.

1. Install and configure {{ vars.platform_name }}.
To install {{ vars.platform_name }}, follow the instructions in [Installing and Configuring {{ vars.platform_name }} on Azure](azure-om-install-config.html).

##<a id='subscription'></a> Subscription Requirements

For Tanzu Kubernetes Grid Integrated Edition and Kubernetes services to run correctly, you must have at least a `standard` subscription
tier.

##<a id='resources'></a> Resource Requirements

Installing {{ vars.platform_name }} and Tanzu Kubernetes Grid Integrated Edition requires the following virtual machines (VMs):

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
    <td>120</td>
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


<h3> Kubernetes Cluster Resources </h3>

Each Kubernetes cluster provisioned through Tanzu Kubernetes Grid Integrated Edition deploys the VMs listed below. If you deploy more
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
