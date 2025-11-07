---
title: About {{  vars.product }} Upgrades

---

This topic provides conceptual information about upgrading {{  vars.product_full }} and {{ vars.product_short }}-provisioned Kubernetes clusters.

For step-by-step instructions on upgrading {{ vars.product_short }}
and {{ vars.product_short }}-provisioned Kubernetes clusters, see:

* [Upgrading {{  vars.product }} (Antrea Networking)](upgrade.html)
* [Upgrading {{  vars.product }} (NSX Networking)](upgrade-nsxt.html)
* [Upgrading Clusters](upgrade-clusters.html)


## <a id="overview"></a>Overview

An {{  vars.product }} upgrade modifies the {{ vars.product_short }} version,
for example, upgrading {{ vars.product_short }} from {{{ vars.product_version_prev }}}.x to {{{ vars.product_version }}}.0 or from {{{ vars.product_version }}}.0 to {{{ vars.product_version }}}.1.

There are two ways you can upgrade {{ vars.product_short }}:

* **Full Upgrade**: By default, {{ vars.product_short }} is set to perform a full upgrade,
which upgrades both the {{ vars.product_short }} control plane and all {{ vars.product_short }}-provisioned Kubernetes clusters.

* **Control Plane Only Upgrade**: You can choose to upgrade {{ vars.product_short }} in two phases
by upgrading the {{ vars.product_short }} control plane first and
then upgrading your {{ vars.product_short }}-provisioned Kubernetes clusters later.

### <a id="decide"></a> Deciding Between Full and Two-Phase Upgrade

When deciding whether to perform the default full upgrade or
to upgrade the {{ vars.product_short }} control plane and {{ vars.product_short }}-provisioned Kubernetes clusters separately,
consider your organization's needs.

You might prefer to upgrade {{ vars.product_short }} in two phases because of the advantages it provides:

* If your organization runs {{ vars.product_short }}-provisioned Kubernetes clusters
in both development and production environments and you want to upgrade
only one environment first, you can achieve your goal by
upgrading the {{ vars.product_short }} control plane and {{ vars.product_short }}-provisioned Kubernetes separately.

* Faster {{  vars.product }} tile upgrades.
If you have a large number of clusters in your {{ vars.product_short }} deployment,
performing a full upgrade can significantly increase the amount of time required to
upgrade the {{  vars.product }} tile.

* More granular control over cluster upgrades.
In addition to enabling you to upgrade subsets of clusters,
the {{ vars.product_short }} CLI supports upgrading each cluster individually.

* Not a monolithic upgrade.
This helps isolate the root cause of an error when troubleshooting upgrades.
For example, when a cluster-related upgrade error occurs during a full upgrade,
the entire {{  vars.product }} tile upgrade might fail.

{{{{raw}}}} <!--  Note: The formatting on this page breaks when notes are configured the normal way. --> {{{{/raw}}}}
<p class="note warning">
<strong>Warning:</strong> If you deactivate the default full upgrade
and upgrade only the {{ vars.product_short }} control plane,
you must upgrade all your {{ vars.product_short }}-provisioned Kubernetes clusters before the next {{  vars.product }} tile
upgrade. Deactivating the default full upgrade
and upgrading only the {{ vars.product_short }} control plane cause the {{ vars.product_short }} version
tagged in your Kubernetes clusters to fall behind the {{  vars.product }} tile version.
If your {{ vars.product_short }}-provisioned Kubernetes clusters fall more than one version behind the tile,
{{ vars.product_short }} cannot upgrade the clusters.
</p>
{{{{raw}}}} <!--  Note: The formatting on this page breaks when notes are configured the normal way. --> {{{{/raw}}}}

### <a id="decide-method"></a> Deciding Between Tile or CLI Upgrade

You can use either the {{  vars.product }} tile or the {{ vars.product_short }} CLI to perform {{ vars.product_short }} upgrades:

* To perform a full upgrade of the {{ vars.product_short }} control plane and
{{ vars.product_short }}-provisioned Kubernetes clusters, use the {{  vars.product }} tile .
* To upgrade the {{ vars.product_short }} control plane only, use the {{  vars.product }} tile.
* To upgrade {{ vars.product_short }}-provisioned Kubernetes clusters, use either the {{ vars.product_short }} CLI
or the {{  vars.product }} tile.

<table>
<col width="20%">
<col width="20%">
<col width="27%">
<col width="27%">
  <tr>
    <th rowspan=2>Upgrade Method</th>
    <th colspan=3 style="text-align:center">Supported Upgrade Types</th>
  </tr>
  <tr>
    <th>Full {{ vars.product_short }} upgrade</th>
    <th>{{ vars.product_short }} control plane only</th>
    <th>Kubernetes clusters only</th>
  </tr>
  <tr>
    <td>{{ vars.product_short }} Tile</td>
    <td style="text-align:center">&#10004;</td>
    <td style="text-align:center">&#10004;</td>
    <td style="text-align:center">&#10004;</td>
  </tr>
  <tr>
    <td>{{ vars.product_short }} CLI</td>
    <td style="text-align:center">&#10006;</td>
    <td style="text-align:center">&#10006;</td>
    <td style="text-align:center">&#10004;</td>
  </tr>
</table>

Typically, if you choose to upgrade {{ vars.product_short }}-provisioned Kubernetes clusters only,
you will upgrade them through the {{ vars.product_short }} CLI.


## <a id="what-happens"></a> What Happens During Full {{ vars.product_short }} and {{ vars.product_short }} Control Plane Only Upgrades

After you add a new {{  vars.product }} tile version to your staging area
on the {{ vars.platform_name }} Installation Dashboard,
{{ vars.platform_name }} automatically migrates your configuration settings into the new tile version.

You can perform a full {{ vars.product_short }} upgrade or a {{ vars.product_short }} control plane only upgrade:

* [Full {{ vars.product_short }} Upgrades](#full-upgrades)
* [{{ vars.product_short }} Control Plane Only Upgrades](#control-plane-upgrades)


### <a name="full-upgrades"></a>Full {{ vars.product_short }} Upgrades

During a **full {{ vars.product_short }} upgrade**,
the {{  vars.product }} tile does the following:

1. **Recreates the Control Plane VMs**:
    * Upgrades the {{ vars.product_short }} version on the {{ vars.product_short }} control plane.
    * For more information, see [What Happens During Control Plane Upgrades](#control-plane-upgrades-details) below.

1. **Upgrades Clusters**:
    * Upgrades all of the {{ vars.product_short }}-provisioned Kubernetes clusters.
    * Requires the **Upgrade all clusters errand** check box is activated in the **Errands** pane on the {{  vars.product }} tile.
    * For more information, see [What Happens During Cluster Upgrades](#cluster-upgrades) below.

### <a name="control-plane-upgrades"></a>{{ vars.product_short }} Control Plane Only Upgrades

During a **{{ vars.product_short }} control plane only** upgrade,
the {{  vars.product }} tile does the following:

1. **Recreates the Control Plane VMs**:
    * Upgrades the {{ vars.product_short }} version on the {{ vars.product_short }} control plane.
    * For more information, see [What Happens During Control Plane Upgrades](#control-plane-upgrades-details) below.

1. **Does Not Upgrade Clusters**:
    * Does not automatically upgrade {{ vars.product_short }}-provisioned Kubernetes clusters after upgrading the {{ vars.product_short }} control plane.
    * Requires the **Upgrade all clusters errand** check box is deactivated in the **Errands** pane on the {{  vars.product }} tile.
    * The {{ vars.product_short }}-provisioned Kubernetes clusters remain on the previous {{ vars.product_short }} version until you manually upgrade them.
    For more information, see [What Happens During Cluster Upgrades](#cluster-upgrades) below, and [Upgrading Clusters](upgrade-clusters.html).
    * Some cluster management tasks are not supported for clusters that are running the previous {{ vars.product_short }} version.
    For more information, see [Tasks Supported Following a {{ vars.product_short }} Control Plane Only Upgrade](#control-plane-upgrades-supported-tasks) below.




## <a id="control-plane-upgrades-details"></a>What Happens During Control Plane Upgrades

Note the following when upgrading the {{ vars.product_short }} control plane:

* Upgrading the {{ vars.product_short }} control plane includes upgrading the
{{ vars.product_short }} API server, UAA server, and the {{ vars.product_short }} database.
* If the {{ vars.product_short }} installation is not scaled for high availability, the control plane upgrade causes temporary outages as described in [Control Plane Outages](#outages) below.
* The control plane upgrade will halt if a control plane canary instance encounters an error.
For more information, see [Canary Instances](#canary) below.

### <a name="outages"></a> Control Plane Outages

When the {{ vars.product_short }} control plane is not scaled for high availability, upgrading the control plane temporarily interrupts the following:

* Logging in to the {{ vars.product_short }} CLI and using all `tkgi` commands.
* Using the {{ vars.product_short }} API to retrieve information about clusters.
* Using the {{ vars.product_short }} API to create and delete clusters.
* Using the {{ vars.product_short }} API to resize clusters.

These outages do not affect the Kubernetes clusters themselves.
During a {{ vars.product_short }} control plane upgrade, you can still interact with clusters and their workloads using the Kubernetes Command Line Interface, `kubectl`.

For more information about the {{ vars.product_short }} control plane and high availability, see [{{ vars.product_short }} Control Plane Overview](control-plane.html#control-plane) in _{{  vars.product }} Architecture_.

### <a name="canary"></a>Canary Instances

The {{  vars.product }} tile is a BOSH deployment.

BOSH-deployed products can set a number of canary instances to upgrade first, before the rest of the deployment VMs.
BOSH continues the upgrade only if the canary instance upgrade succeeds.
If the canary instance encounters an error, the upgrade stops running and other VMs are not affected.

The {{  vars.product }} tile uses one canary instance when deploying or upgrading {{  vars.product }}.

### <a name="control-plane-upgrades-supported-tasks"></a>Tasks Supported Following a {{ vars.product_short }} Control Plane Only Upgrade

{{ vars.product_short }} allows an admin to upgrade the {{ vars.product_short }} control plane without upgrading the {{ vars.product_short }}-provisioned Kubernetes clusters. These clusters continue running the previous {{ vars.product_short }} version.

Although the {{ vars.product_short }} CLI generally supports these clusters, there are CLI commands that are not supported.

The following tables summarize which {{ vars.product_short }} CLI commands are supported on clusters running the previous {{ vars.product_short }} version:

* [{{ vars.product_short }} CLI Utility Commands](#control-plane-upgrades-supported-tasks-utility)
* [{{ vars.product_short }} CLI Cluster Management Commands](#control-plane-upgrades-supported-tasks-management)

<p class="note"><strong>Note</strong>: {{{ vars.recommended_by }}} recommends you do not run {{ vars.product_short }} CLI cluster management commands on clusters running the previous {{ vars.product_short }} version.
</p>


#### <a name="control-plane-upgrades-supported-tasks-utility"></a>{{ vars.product_short }} CLI Utility Commands

The following summarizes the {{ vars.product_short }} CLI utility commands that are supported for clusters running the previous {{ vars.product_short }} version.

<table style="width:100%">
  <tr>
    <th width="20%">Task&nbsp;Status</th>
    <th width="50%"></th>
    <th width="30%">Notes</th>
  </tr>
  <tr>
    <th><br>Supported Tasks</th>
    <td>
      <ul>
        <li><code>tkgi cancel-task</code></li>
        <li><code>tkgi clusters</code></li>
        <li><code>tkgi compute-profile</code></li>
        <li><code>tkgi compute-profiles</code></li>
        <li><code>tkgi create-compute-profile</code></li>
        <li><code>tkgi create-kubernetes-profile</code></li>
        <li><code>tkgi create-network-profile</code></li>
        <li><code>tkgi delete-compute-profile</code></li>
        <li><code>tkgi delete-kubernetes-profile</code></li>
        <li><code>tkgi delete-network-profile</code></li>
        <li><code>tkgi kubernetes-profile</code></li>
        <li><code>tkgi kubernetes-profiles</code></li>
        <li><code>tkgi login</code></li>
        <li><code>tkgi logout</code></li>
        <li><code>tkgi network-profile</code></li>
        <li><code>tkgi network-profiles</code></li>
        <li><code>tkgi plans</code></li>
        <li><code>tkgi task</code></li>
        <li><code>tkgi tasks</code></li>
      </ul>
    </td>
    <td>
    </td>
  </tr>
</table>

#### <a name="control-plane-upgrades-supported-tasks-management"></a>{{ vars.product_short }} CLI Cluster Management Commands

The following summarizes the {{ vars.product_short }} CLI cluster management commands that are supported for clusters running the previous {{ vars.product_short }} version.

<p class="note"><strong>Note</strong>: {{{ vars.recommended_by }}} recommends you do not run {{ vars.product_short }} CLI cluster management commands on clusters running the previous {{ vars.product_short }} version.
</p>

<table style="width:100%">
  <tr>
    <th width="20%">Task&nbsp;Status</th>
    <th width="50%"></th>
    <th width="30%">Notes</th>
  </tr>
  <tr>
    <th><br>Supported Tasks</th>
    <td>
      <ul>
        <li><code>tkgi certificates</code></li>
        <li><code>tkgi cluster</code></li>
        <li><code>tkgi create-cluster</code></li>
        <li><code>tkgi delete-cluster</code></li>
        <li><code>tkgi get-credentials</code></li>
        <li><code>tkgi get-kubeconfig</code></li>
        <li><code>tkgi upgrade-cluster</code></li>
        <li><code>tkgi upgrade-clusters</code></li>
      </ul>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <th><br>Partially-Supported Tasks</th>
    <td>
      <ul>
        <li><code>tkgi update-cluster</code><br><br>For more information, see the <strong>Notes</strong> column.</li>
      </ul>
    </td>
    <td>
      <strong>Supported</strong> <code>tkgi&nbsp;update-cluster</code> <strong>Flags</strong>:
      <ul>
        <li><code>&#8209;&#8209;num-nodes INT32</code> &#42;</li>
        <li><code>&#8209;&#8209;node-pool-instances</code> &#42;</li>
      </ul>
      <br><br><strong>Unsupported</strong> <code>tkgi&nbsp;update-cluster</code> <strong>Flags</strong>:
      <ul>
        <li><code>&#8209;&#8209;compute-profile</code></li>
        <li><code>&#8209;&#8209;kubelet-drain-timeout</code></li>
        <li><code>&#8209;&#8209;kubelet-drain-grace-period</code></li>
        <li><code>&#8209;&#8209;kubelet-drain-force</code></li>
        <li><code>&#8209;&#8209;kubelet-drain-ignore-daemonsets</code></li>
        <li><code>&#8209;&#8209;kubelet-drain-delete-local-data</code></li>
        <li><code>&#8209;&#8209;kubelet-drain-force-node</code></li>
        <li><code>&#8209;&#8209;kubernetes-profile</code></li>
        <li><code>&#8209;&#8209;network-profile</code></li>
        <li><code>&#8209;&#8209;tags []ClusterTag</code> &#42;</li>
        <li><code>&#8209;&#8209;config-file</code></li>
      </ul>
      <br>&#42; Clusters running the previous {{ vars.product_short }} version
      and configured with <code>&#8209;&#8209;tags</code> do not support any <code>tkgi&nbsp;update-cluster</code> operations.
    </td>
  </tr>
  <tr>
    <th><br>Unsupported Tasks</th>
    <td>
      <ul>
        <li><code>tkgi rotate-certificates</code></li>
      </ul>
    </td>
    <td>
    </td>
  </tr>
</table>


## <a id="cluster-upgrades"></a>What Happens During Cluster Upgrades

Upgrading a {{ vars.product_short }}-provisioned Kubernetes cluster upgrades the cluster to the {{ vars.product_short }} version of the {{ vars.product_short }} control plane and tags the cluster with the upgrade version.

Upgrading the cluster also upgrades the cluster's Kubernetes version to the version
included with the {{  vars.product }} tile.

During an upgrade of {{ vars.product_short }}-provisioned clusters,
{{ vars.product_short }} recreates your clusters.
This includes the following stages for each cluster you upgrade:

1. Control Plane nodes are recreated.
1. Worker nodes are recreated.

Depending on your cluster configuration,
these recreations might cause [Cluster Control Plane Nodes Outage](#master) or [Worker Nodes Outage](#worker)
as described below.

{{{{raw}}}} <!--  Note: The formatting on this page breaks when notes are configured the normal way. --> {{{{/raw}}}}
<p class="note">
<strong>Note:</strong> When the <strong>Upgrade all clusters errand</strong>
is enabled in the {{  vars.product }} tile, updating the tile with
a new Linux or Windows stemcell rolls every Linux or Windows VM in each Kubernetes cluster.
This automatic rolling ensures that all your VMs are patched.
To avoid workload downtime, use the resource configuration recommended
in <a href="#master">Control Plane Nodes Outage</a>
and <a href="#worker">Worker Nodes Outage</a> below and
in <a href="./maintain-uptime.html">Maintaining Workload Uptime</a>.
</p>
{{{{raw}}}} <!--  Note: The formatting on this page breaks when notes are configured the normal way. --> {{{{/raw}}}}

You can upgrade {{ vars.product_short }}-provisioned Kubernetes clusters either through the {{  vars.product }} tile
or the {{ vars.product_short }} CLI. See the table below.

<table>
<col width="50%">
<col width="50%">
  <tr>
    <th>This method</th>
    <th>Upgrades</th>
  </tr>
  <tr>
    <td>The <strong>Upgrade all clusters errand</strong> in<br>
    the <strong>{{  vars.product }}</strong> tile > <strong>Errands</strong></td>
    <td>All clusters. Clusters are upgraded serially.</td>
  </tr>
  <tr>
    <td><code>tkgi upgrade-cluster</code></td>
    <td>One cluster.</td>
  </tr>
  <tr>
    <td><code>tkgi upgrade-clusters</code></td>
    <td>Multiple clusters. Clusters are upgraded serially or in parallel.</td>
  </tr>
</table>



###<a name="master"></a>Cluster Control Plane Nodes Outage

When {{ vars.product_short }} upgrades a single-control plane node cluster,
you cannot interact with your cluster, use `kubectl`, or push new workloads.

To avoid this loss of functionality,
{{{ vars.recommended_by }}} recommends using multi-control plane node clusters.

###<a name="worker"></a>Worker Nodes Outage

When {{ vars.product_short }} upgrades a worker node,
the node stops running containers.
If your workloads run on a single node, they will experience downtime.

To avoid downtime for stateless workloads,
{{{ vars.recommended_by }}} recommends using at least one worker node
per availability zone (AZ).
For stateful workloads, {{{ vars.recommended_by }}} recommends
using a minimum of two worker nodes per AZ.

<br>

{{{{raw}}}} <!--  Note: The formatting on this page breaks when notes are configured the normal way. --> {{{{/raw}}}}
