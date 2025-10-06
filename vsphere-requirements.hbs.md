---
title: vSphere Prerequisites and Resource Requirements

topictype: vsphere
---

This topic describes the prerequisites and resource requirements for installing {{  vars.product_full }} ({{ vars.product_short }}) on vSphere.

For prerequisites and resource requirements for installing TKGI on vSphere with NSX integration,
see +AFs-vSphere with NSX Version Requirements+AF0-(vsphere-nsxt-requirements.html) and
+AFs-Hardware Requirements for {{  vars.product }} on vSphere with NSX+AF0-(./vsphere-nsxt-rpd-mpd.html).

+ACMAIwA8-a id+AD0-'prerequisites'+AD4APA-/a+AD4- Prerequisites

Before installing {{  vars.product }}:

1. Review the sections below and the instructions in +AFs-Creating Dedicated Users and Roles for vSphere (Optional)+AF0-(vsphere-prepare-env.html).

1. Install and configure +AHsAew- vars.platform+AF8-name +AH0AfQ-. To install +AHsAew- vars.platform+AF8-name +AH0AfQ-, follow the instructions in +AFs-Installing and Configuring +AHsAew- vars.platform+AF8-name +AH0AfQ- on vSphere+AF0-(vsphere-om-install-config.html).

+ACMAIwA8-a id+AD0-'vsphere'+AD4APA-/a+AD4- vSphere Version Requirements

+AHsAewA+- +AF8-vsphere+AF8-versions +AH0AfQ-


+ACMAIwA8-a id+AD0-'resources'+AD4APA-/a+AD4- Resource Requirements

Installing +AHsAew- vars.platform+AF8-name +AH0AfQ- and {{  vars.product }} requires the following virtual machines (VMs):

+ADw-table+AD4-
  +ADw-tr+AD4-
    +ADw-th+AD4-VM+ADw-/th+AD4-
    +ADw-th+AD4-CPU+ADw-/th+AD4-
    +ADw-th+AD4-Memory (GB)+ADw-/th+AD4-
    +ADw-th+AD4-Ephemeral Disk (GB)+ADw-/th+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4-BOSH Director+ADw-/td+AD4-
    +ADw-td+AD4-2+ADw-/td+AD4-
    +ADw-td+AD4-8+ADw-/td+AD4-
    +ADw-td+AD4-16+ADw-/td+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4AewB7- vars.platform+AF8-name +AH0AfQA8-/td+AD4-
    +ADw-td+AD4-1+ADw-/td+AD4-
    +ADw-td+AD4-8+ADw-/td+AD4-
    +ADw-td+AD4-160+ADw-/td+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4-TKGI API+ADw-/td+AD4-
    +ADw-td+AD4-2+ADw-/td+AD4-
    +ADw-td+AD4-8+ADw-/td+AD4-
    +ADw-td+AD4-64+ADw-/td+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4-TKGI Database+ADw-/td+AD4-
    +ADw-td+AD4-2+ADw-/td+AD4-
    +ADw-td+AD4-8+ADw-/td+AD4-
    +ADw-td+AD4-64+ADw-/td+AD4-
  +ADw-/tr+AD4-
+ADw-/table+AD4-

+ADw-p class+AD0AIg-note+ACIAPgA8-strong+AD4-NOTE:+ADw-/strong+AD4- VMware recommends deploying TKGI on its own dedicated +AHsAew- vars.platform+AF8-name +AH0AfQ- instance, rather than on a shared +AHsAew- vars.platform+AF8-name +AH0AfQ- that also hosts other runtimes such as +AHsAew- vars.app+AF8-runtime +AH0AfQ-.+ADw-/p+AD4-

+AHsAewA+- +AF8-increase+AF8-persistent+AF8-disk +AH0AfQ-


+ADw-h3+AD4- Ephemeral VM Resources +ADw-/h3+AD4-

Each {{  vars.product }} deployment requires ephemeral VMs during installation and upgrades of {{  vars.product }}.
After you deploy {{  vars.product }}, BOSH automatically deletes these VMs.

To enable {{  vars.product }} to dynamically create the ephemeral VMs when needed, ensure that the following
resources are available in your vSphere infrastructure before deploying {{  vars.product }}:

+ADw-table+AD4-
  +ADw-tr+AD4-
    +ADw-th+AD4-Ephemeral VM+ADw-/th+AD4-
    +ADw-th+AD4-VM+ACY-nbsp+ADs-Count+ADw-/th+AD4-
    +ADw-th+AD4-CPU Cores+ADw-/th+AD4-
    +ADw-th+AD4-Memory (GB)+ADw-/th+AD4-
    +ADw-th+AD4-Ephemeral Disk (GB)+ADw-/th+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4-BOSH Compilation VMs+ADw-/td+AD4-
    +ADw-td+AD4-4+ADw-/td+AD4-
    +ADw-td+AD4-4+ADw-/td+AD4-
    +ADw-td+AD4-4+ADw-/td+AD4-
    +ADw-td+AD4-32+ADw-/td+AD4-
  +ADw-/tr+AD4-
+ADw-/table+AD4-

+ADw-h3+AD4- Kubernetes Cluster Resources +ADw-/h3+AD4-

Each Kubernetes cluster provisioned through {{  vars.product }} deploys the VMs listed below. If you deploy more
than one Kubernetes cluster, you must scale your allocated resources appropriately.

+ADw-table+AD4-
  +ADw-tr+AD4-
    +ADw-th+AD4-VM+ADw-/th+AD4-
    +ADw-th+AD4-VM+ACY-nbsp+ADs-Count+ADw-/th+AD4-
    +ADw-th+AD4-CPU Cores+ADw-/th+AD4-
    +ADw-th+AD4-Memory (GB)+ADw-/th+AD4-
    +ADw-th+AD4-Ephemeral Disk (GB)+ADw-/th+AD4-
    +ADw-th+AD4-Persistent Disk (GB)+ADw-/th+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4-Control Plane+ADw-/td+AD4-
    +ADw-td+AD4-1 or 3+ADw-/td+AD4-
    +ADw-td+AD4-2+ADw-/td+AD4-
    +ADw-td+AD4-4+ADw-/td+AD4-
    +ADw-td+AD4-8+ADw-/td+AD4-
    +ADw-td+AD4-5+ADw-/td+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4-Worker+ADw-/td+AD4-
    +ADw-td+AD4-1 or more+ADw-/td+AD4-
    +ADw-td+AD4-2+ADw-/td+AD4-
    +ADw-td+AD4-4+ADw-/td+AD4-
    +ADw-td+AD4-8+ADw-/td+AD4-
    +ADw-td+AD4-50+ADw-/td+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4-Errand (ephemeral)+ADw-/td+AD4-
    +ADw-td+AD4-1+ADw-/td+AD4-
    +ADw-td+AD4-1+ADw-/td+AD4-
    +ADw-td+AD4-1+ADw-/td+AD4-
    +ADw-td+AD4-8+ADw-/td+AD4-
    +ADw-td+AD4-none+ADw-/td+AD4-
  +ADw-/tr+AD4-
+ADw-/table+AD4-

+ACMAIw- +ADw-a id+AD0AIg-firewall-ports+ACIAPgA8-/a+AD4- Network Communication Requirements

For a complete list of network communication requirements for vSphere without NSX, see
+AFs-VMware Ports and Protocols+AF0-(https://ports.vmware.com/home/vSphere+NSU-Data-Center-for-vSphere+NSU-Data-Center)
on the VMware site.
