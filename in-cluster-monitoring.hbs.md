---
title: Monitoring Linux Workers and Workloads
owner: PKS
---

This topic describes the components and integrations you can use to capture Kubernetes workload and worker node logs and metrics on {{  vars.product_full }} Linux clusters.

For information about logging and monitoring Kubernetes clusters, workers and workloads on Windows,
see [Monitoring Windows Worker Clusters and Workers](windows-monitoring.html) or [Logging Windows Worker Clusters and Workers](windows-logging.html).


## <a id='overview'></a>Overview

You can use monitoring components to capture Kubernetes workload and worker node logs and metrics on TKGI-provisioned Linux Kubernetes clusters.

For information about monitoring TKGI and
TKGI-provisioned cluster VMs on Linux, see
[Monitoring TKGI and TKGI-Provisioned Clusters](host-monitoring.html).

To capture Kubernetes workload and worker node logs and metrics:

* [Configure Monitoring Components and Integrations](#configure)

<p class="note"><strong>Note</strong>: When running on worker nodes, the monitoring components and integrations are visible to
both TKGI admins and cluster users, such as developers.
</p>


## <a id='configure'></a>Configure Monitoring Components and Integrations

To monitor Kubernetes worker nodes and workloads in your
TKGI deployment:

1. Enable one or more supported components and integrations in the **{{  vars.product }}** tile >
**In-Cluster Monitoring**. For more information about supported components and integrations, see [Monitoring Components and Integrations](#integrations) below.

1. To activate TKGI sink resources or vRealize Operations integration,
follow the instructions in _In-Cluster Monitoring_ for your IaaS:

    * [Installing {{  vars.product }} on vSphere](installing-vsphere.html#cluster-monitoring)
    * [Installing {{  vars.product }} on vSphere with NSX](installing-nsx-t.html#cluster-monitoring)
    * [Installing {{  vars.product }} on AWS](installing-aws.html#cluster-monitoring)
    * [Installing {{  vars.product }} on Azure](installing-azure.html#cluster-monitoring)

1. To configure a monitoring integration:

    * **Sink Resources**: [Sink Resources](#sinks)
    * **VMware vRealize Operations Management Pack for Container Monitoring**:
        * [cAdvisor](https://github.com/google/cadvisor)
        * [VMware vRealize Operations Management Pack for Container Monitoring](https://techdocs.broadcom.com/us/en/vmware-cis/aria/aria-operations-for-integrations/2-2/vrealize--operations-management-pack--for-pack-for-kubernetes-2-2/getting-started-with-vmware-aria-operations-management-pack-for-kubernetes.html)

### <a id='integrations'></a>Monitoring Components and Integrations

The following components and integrations can be used to monitor Kubernetes worker nodes and workloads in your
TKGI deployment:

<table class="nice">
  <col width="25%">
  <col width="25%">
  <col width="50">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>Prometheus DNS-based Service Discovery</td>
    <td>External integration</td>
    <td>
        TKGI supports DNS-based service discovery for TKGI-provisioned Linux cluster nodes:
        <code>master.cfcr.internal</code> and <code>master&#8209;0.etcd.cfcr.internal</code>
        for control plane nodes and
        <code>worker.cfcr.internal</code> for worker nodes.<br/><br/>
        See <a href="https://prometheus.io/docs/prometheus/latest/configuration/configuration/#dns_sd_config">dns_sd_config</a>
        in the Prometheus Configuration documentation.
    </td>
  </tr>
  <tr>
    <td>Sink resources</td>
    <td>TKGI component</td>
    <td>See <a href="#sinks">Sink Resources</a>, below.</td>
  </tr>
  <tr>
    <td>VMware Aria Operations Management Pack for Kubernetes</td>
    <td>External integration, with cAdvisor</td>
    <td>
        See <a href="https://techdocs.broadcom.com/us/en/vmware-cis/live-recovery/vsphere-replication/8-6/release-notes/vmware-vrealize-operations-management-pack-for-vsphere-replication-86-release-notes.html">VMware Aria Operations Management Pack for Kubernetes</a>
        in the VMware-Aria-Operations-for-Integrations documentation.
    </td>
  </tr>
</table>



## <a id='sinks'></a> Sink Resources

In TKGI, you can deploy log sinks and metric sinks to
monitor your Kubernetes worker nodes and workloads that are running on them.

To deploy a log or a metric sink:

1. Enable sink resources in the **{{  vars.product }}** tile >
**In-Cluster Monitoring**.
You can enable both log and metric sink resources or only one of them.
1. (Optional) Enable Node Exporter on worker nodes by selecting the
**Enable node exporter on workers** check box.
1. Create sink resources. For instructions, see
[Creating and Managing Sink Resources](create-sinks.html).

For more information about sink resources, see:

* Conceptual information: [Sink Architecture in {{  vars.product }}](sink-architecture.html)
* Sink resource types, outputs, and identifying strings: [Monitoring Clusters with Log Sinks](monitor-sinks.html)
