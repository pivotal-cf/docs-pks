---
title: Installing {{  vars.product }} on vSphere (Antrea Networking)

iaas: vSphere
windowsclusters: #Empty var to prevent build breaking
topic: #Empty var to prevent build breaking
thistopic: #Empty var to prevent build breaking
---

This topic describes how to install and configure {{  vars.product_full }}
on vSphere with Antrea networking as a {{ vars.platform_name }} tile.

##<a id='prerequisites'></a>Prerequisites

Before performing the procedures in this topic, you must have deployed and configured {{ vars.platform_name }}.
For more information, see [vSphere Prerequisites and Resource Requirements](vsphere-requirements.html).

{{> prerequisites }}

## <a id='overview'></a>Overview

To install and configure {{ vars.product_short }}:

1. [Install {{  vars.product }}](#install)
1. [Configure {{  vars.product }}](#configure)
1. [Apply Changes](#apply-changes)

##<a id='install'></a> Step 1: Install {{  vars.product }}

{{> install }}

##<a id='configure'></a> Step 2: Configure {{  vars.product }}

To configure {{ vars.product_short }}:

1. Click the orange **{{  vars.product }}** tile to start the configuration process.

    ![{{ vars.product_short }} tile on the {{ vars.platform_name }} installation dashboard](images/tkgi-tile-orange.png)

    <p class="note warning"><strong>WARNING</strong>: When you configure the {{  vars.product }} tile, do not use spaces in any field entries. This includes spaces between characters as well as
    leading and trailing spaces. If you use a space in any field entry, the deployment of {{  vars.product }} fails.</p>
1. [Assign AZs and Networks](#azs-networks)
1. [{{ vars.product_short }} API](#tkgi-api)
1. [Plans](#plans)
1. [Kubernetes Cloud Provider](#cloud-provider)
1. [Networking](#networking)
1. [UAA](#uaa)
1. [(Optional) Host Monitoring](#syslog)
1. [(Optional) In-Cluster Monitoring](#cluster-monitoring)
1. [Tanzu Mission Control](#tmc)
1. [VMware CEIP](#telemetry)
1. [Storage](#storage-config)
1. [Errands](#errands)
1. [Resource Config](#resource-config)

### <a id='azs-networks'></a> Assign AZs and Networks

To configure the availability zones (AZs) and networks
used by the {{{ vars.product_short }}} control plane:

1. Click **Assign AZs and Networks**.

1. Under **Place singleton jobs in**, select the AZ where you want to deploy the
{{{ vars.control_plane }}} and {{{ vars.control_plane_db }}}.

    ![Assign AZs and Networks pane in {{ vars.platform_name }}](images/azs-networks.png)
1. Under **Balance other jobs in**, select the AZ for balancing other {{{ vars.product_short }}} control plane jobs.
    <p class="note"><strong>Note</strong>: You must specify the <strong>Balance other jobs in</strong> AZ, but the selection has no effect in the current version of {{{ vars.product_short }}}.
    </p>
1. Under **Network**, select the infrastructure subnet that you created for {{{ vars.product_short }}} component VMs, such as the {{{ vars.control_plane }}} and {{{ vars.control_plane_db }}} VMs.
1. Under **Service Network**, select the services subnet that you created for Kubernetes cluster VMs.
1. Click **Save**.

### <a id='tkgi-api'></a> {{ vars.product_short }} API

{{> api }}

### <a id='plans'></a> Plans

{{> plans }}

### <a id='cloud-provider'></a> Kubernetes Cloud Provider

{{> cloud-provider }}

### <a id='networking'></a> Networking

{{> networking-vsphere }}

### <a id='uaa'></a> UAA

{{> uaa }}

### <a id='syslog'></a> (Optional) Host Monitoring

{{> host-monitoring }}

### <a id='cluster-monitoring'></a> (Optional) In-Cluster Monitoring

{{> cluster-monitoring }}

### <a id='tmc'></a> Tanzu Mission Control

{{> tmc }}

### <a id='telemetry'></a> VMware CEIP

{{> usage-data }}

### <a id='storage-config'></a> Storage

{{> storage-config }}

### <a id='errands'></a> Errands

{{> errands }}

### <a id='resource-config'></a> Resource Config

To modify the resource configuration of {{  vars.product }}, follow the steps below:

1. Select **Resource Config**.
1. {{> resource-config }}

1. Under each job, leave **NSX CONFIGURATION** and **NSX-V CONFIGURATION** blank.

  <p class="note warning"><strong>Warning:</strong> To avoid workload downtime, use the resource configuration recommended in
  <a href="understanding-upgrades.html">About {{  vars.product }} Upgrades</a>
  and <a href="maintain-uptime.html">Maintaining Workload Uptime</a>.
  </p>


## <a id='apply-changes'></a> Step 3: Apply Changes

{{> apply-changes }}

## <a id='next-install-step'></a> Next Installation Step

To configure the {{ vars.product_short }} API load balancer, follow the instructions in [Configure {{ vars.product_short }} API Load Balancer](vsphere-configure-api.html).
