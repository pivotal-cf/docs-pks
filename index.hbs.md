---
title: VMware Tanzu Kubernetes Grid Integrated Edition
---

{{  vars.product_full }} ({{ vars.product_short }}) enables operators to provision, operate, and manage enterprise-grade Kubernetes clusters using BOSH and {{ vars.platform_name }}.

## <a id='overview'></a>Overview

{{  vars.product }} deploys Kubernetes to [BOSH](https://bosh.io) and [{{ vars.platform_name }}](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/index.html),
and uses the [On-Demand Broker](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform-services/on-demand-services-sdk-for-tanzu/0-42.html) to dynamically
instantiate, deploy, and manage highly-available Kubernetes clusters on-premises or on a public cloud.

After operators install TKGI,
developers can use the TKGI Command Line Interface (TKGI CLI) to provision Kubernetes clusters,
and run container-based workloads on the clusters with the Kubernetes CLI, [kubectl](installing-kubectl-cli.html).

Operators install TKGI as a tile on the {{ vars.platform_name }} Installation Dashboard,
or from the TKGI Management Console on vSphere.

You can run TKGI standalone or alongside {{{ vars.app_runtime_full }}}
on {{ vars.platform_name }}.

##<a id='tkgi-kubernetes'></a> What {{  vars.product }} Adds to Kubernetes

The following table details the features that {{  vars.product }} adds to the Kubernetes platform.

<table>
  <tr>
    <th>Feature</th>
    <th>Included in K8s</th>
    <th>Included in {{  vars.product }}</th>
  </tr>
  <tr>
    <td>Single tenant ingress</td>
    <td align="center">&check;</td>
    <td align="center">&check;</td>
  </tr>
  <tr>
    <td>Secure multi-tenant ingress</td>
    <td></td>
    <td align="center">&check;</td>
  </tr>
  <tr>
    <td>Stateful sets of pods</td>
    <td align="center">&check;</td>
    <td align="center">&check;</td>
  </tr>
  <tr>
    <td>Multi-container pods</td>
    <td align="center">&check;</td>
    <td align="center">&check;</td>
  </tr>
  <tr>
    <td>Rolling upgrades to pods</td>
    <td align="center">&check;</td>
    <td align="center">&check;</td>
  </tr>
  <tr>
    <td>Rolling upgrades to cluster infrastructure</td>
    <td></td>
    <td align="center">&check;</td>
  </tr>
  <tr>
    <td>Pod scaling and high availability</td>
    <td align="center">&check;</td>
    <td align="center">&check;</td>
  </tr>
  <tr>
    <td>Cluster provisioning and scaling</td>
    <td></td>
    <td align="center">&check;</td>
  </tr>
  <tr>
    <td>Monitoring and recovery of cluster VMs and processes</td>
    <td></td>
    <td align="center">&check;</td>
  </tr>
  <tr>
    <td>Persistent disks</td>
    <td align="center">&check;</td>
    <td align="center">&check;</td>
  </tr>
  <tr>
    <td>Secure container registry</td>
    <td></td>
    <td align="center">&check;</td>
  </tr>
  <tr>
    <td>Embedded, hardened operating system</td>
    <td></td>
    <td align="center">&check;</td>
  </tr>
</table>

## <a id='features'></a>Features

{{  vars.product }} has the following features:

* **Kubernetes compatibility**: Constant compatibility with current stable release of Kubernetes

* **Production-ready**: Highly available from applications to infrastructure, with no single points of failure

* **BOSH advantages**: Built-in health checks, scaling, auto-healing and rolling upgrades

* **Fully automated operations**: Fully automated deploy, scale, patch, and upgrade experience

* **Multi-cloud**: Consistent operational experience across multiple clouds

## <a id='docs-highlights'></a> Documentation Highlights

**Concepts**: Learn the [basic concepts of TKGI](concepts.html), information about the [different types of load balancers](about-lb.html) to use in TKGI deployments, and how [TKGI provisions and manages](control-plane.html) your Kubernetes clusters.

**Prerequisites**: Review the prerequisites for TKGI and infrastructure that it works with:

- [vSphere Prerequisites and Resource Requirements](vsphere-requirements.html)
- [vSphere with NSX Version Requirements](vsphere-nsxt-requirements.html) and [Hardware Requirements for {{  vars.product }} on vSphere with NSX](vsphere-nsxt-rpd-mpd.html)
- [AWS Prerequisites and Resource Requirements](aws-requirements.html)
- [Azure Prerequisites and Resource Requirements](azure-requirements.html)

**Installation**: TKGI integrates with VMware NSX Data Center to provide pod-level container networking, load balancing, and security policies. You can install TKGI on vSphere with NSX Data Center in two ways:

-   The [{{  vars.product }} Management Console](console-install-vsphere.html) provides a graphical user interface that assists you with configuration when deploying TKGI on vSphere. After you deploy TKGI on vSphere, you can use the management console to [monitor and manage the operation of your deployments](console-monitor-manage-clusters.html) and perform upgrades.

-   You can [install TKGI using a more traditional approach](vsphere-nsxt-index.html) if you need more flexibility in configuring your deployment.

You can install TKGI on other IaaS platforms as well. Learn how to install TKGI on [vSphere without NSX](vsphere-index.html), [Amazon Web Services \(AWS\)](aws-index.html), and [Microsoft Azure](azure-index.html).

**CLI**: Learn how to use the [TKGI Command Line Interface \(TKGI CLI\)](managing-clusters.html) to provision Kubernetes clusters. You can use the TKGI CLI to provision and manage Kubernetes clusters. You can create and delete clusters, view cluster state, and work with network profiles created with TKGI.

**Stateful Workloads**: You can [deploy stateful workloads](volumes.html) with TKGI on vSphere on Kubernetes clusters. TKGI supports the legacy vSphere Cloud Provider storage plugin for vSphere Volumes as well as supporting Cloud Native Storage \(CNS\) using the [vSphere Cloud Storage Interface \(CSI\) driver](vsphere-cns.html). This encompasses Kubernetes storage primitives for volumes, including Persistent Volumes \(PV\), Persistent Volume Claims \(PVC\), Storage Classes and Stateful Sets. It also provides enterprise-grade storage features such as Storage Policy Based Management \(SPBM\) with VMware vSAN to Kubernetes-based applications.

**Multi-tenant**: Learn how to [create a multi-tenant environment for each Kubernetes cluster](nsxt-multi-t0.html) when using TKGI on vSphere with NSX. Also, with NSX micro-segmentation, Kubernetes namespaces can be secured for multiple teams using a shared cluster. You can create [NSX Network Profiles](network-profiles-index.html) to customize network resources such as load balancer size, node and pod networks, and DNS configuration.

**Private Registry**: Learn how to secure your container workload images using [VMware Harbor Registry](https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/index.html), a private registry server that stores and distributes container images. In addition to providing RBAC \(Role-Based Access Control\) and LDAP/AD support, Harbor provides container [image vulnerability scanning, policy-based image replication, and notary and auditing services](https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/using.html). Harbor is an [open-source project](https://goharbor.io/) that is part of the [Cloud Native Computing Foundation](https://www.cncf.io/projects/).

**Backup and Restore**: You can safely [backup and restore all layers of the TKGI stack](backup-and-restore.html), from your Kubernetes workloads and clusters to the TKGI components and infrastructure.


## <a id='more'></a> Learn More

- Read the [{{  vars.product }} solution brief](https://d1fto35gcfffzn.cloudfront.net/tanzu/tkg/TKGI.pdf) to learn about key benefits and capabilities, architecture, and features of TKGI.

- Explore videos on the [VMware Cloud Native Apps YouTube channel](https://www.youtube.com/channel/UCdkGV51Nu0unDNT58bHt9bg)

-  Follow [VMware Tanzu on Twitter](https://twitter.com/vmwaretanzu) and stay up-to-date with the latest news about running TKGI, Kubernetes, and open source technology on VMware.
