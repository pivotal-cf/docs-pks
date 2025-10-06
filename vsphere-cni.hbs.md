---
title: Install Tanzu Kubernetes Grid Integrated Edition with Antrea on vSphere Using +AHsAewB7- vars.platform+AF8-name +AH0AfQB9-
owner: TKGI
iaas: vSphere
---

The following topics describe how to use +AHsAewB7- vars.platform+AF8-name +AH0AfQB9- to manually install VMware Tanzu Kubernetes Grid Integrated Edition (TKGI) on vSphere with Antrea networking.  

+ADw-p class+AD0AIg-note+ACIAPgA8-strong+AD4-Note+ADw-/strong+AD4-: The recommended method for installing Tanzu Kubernetes Grid Integrated Edition on vSphere is to use the Tanzu Kubernetes Grid Integrated Edition Management Console. For information, see +ADw-a href+AD0AIg-console-install-vsphere.html+ACIAPg-Install on vSphere with the Management Console+ADw-/a+AD4-.+ADw-/p+AD4-

To install Tanzu Kubernetes Grid Integrated Edition on vSphere with Antrea networking follow the instructions below:

+ADw-ul+AD4-
  +ADw-li+AD4-
    +ADw-a href+AD0AIg-./vsphere-requirements.html+ACIAPg-Prerequisites and Resource Requirements+ADw-/a+AD4-
  +ADw-/li+AD4-
  +ADw-li+AD4-
    +ADw-a href+AD0AIg-https://ports.vmware.com/home/vSphere+NSU-Data-Center-for-vSphere+NSU-Data-Center+ACIAPg-VMware Ports and Protocols+ADw-/a+AD4- on the VMware site
  +ADw-/li+AD4-
  +ADw-li+AD4-
    +ADw-a href+AD0AIg-./vsphere-prepare-env.html+ACIAPg-Creating Dedicated Users and Roles for vSphere (Optional)+ADw-/a+AD4-
  +ADw-/li+AD4-
  +ADw-li+AD4-
    +ADw-a href+AD0AIg-./vsphere-om-install-config.html+ACIAPg-Installing and Configuring +AHsAewB7- vars.platform+AF8-name +AH0AfQB9- on vSphere+ADw-/a+AD4-
  +ADw-/li+AD4-
  +ADw-li+AD4-
    +ADw-a href+AD0AIg-./installing-vsphere.html+ACIAPg-Installing Tanzu Kubernetes Grid Integrated Edition on vSphere+ADw-/a+AD4-
  +ADw-/li+AD4-
  +ADw-li+AD4-
    +ADw-a href+AD0AIg-./vsphere-configure-api.html+ACIAPg-Configuring a TKGI API Load Balancer+ADw-/a+AD4-
  +ADw-/li+AD4-
  +ADw-li+AD4-
    +ADw-a href+AD0AIg-./vsphere-configure-users.html+ACIAPg-Setting Up Tanzu Kubernetes Grid Integrated Edition Admin Users on vSphere+ADw-/a+AD4-
  +ADw-/li+AD4-
  +ADw-li+AD4-
    +ADw-a href+AD0AIg-https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/integrating-pks.html+ACIAPg-(Optional) Integrating VMware Harbor with Tanzu Kubernetes Grid Integrated Edition+ADw-/a+AD4-
  +ADw-/li+AD4-
+ADw-/ul+AD4-

+ADw-p class+AD0AIg-note+ACIAPgA8-strong+AD4-Note:+ADw-/strong+AD4- VMware Harbor is an enterprise-class registry server for
container images. For more information, see
+ADw-a href+AD0AIg-https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/index.html+ACIAPg-VMware Harbor Registry+ADw-/a+AD4- in the
+ADw-em+AD4-VMware Partner documentation+ADw-/em+AD4-.+ADw-/p+AD4-

+ACMAIw- Install the TKGI and Kubernetes CLIs

The TKGI CLI and Kubernetes CLI help you interact with your Tanzu Kubernetes Grid Integrated Edition-provisioned Kubernetes clusters and Kubernetes workloads.

To install the CLIs, follow the instructions below:

+ADw-ul+AD4-
  +ADw-li+AD4-
    +ADw-a href+AD0AIg-installing-cli.html+ACIAPg-Installing the TKGI CLI+ADw-/a+AD4-
  +ADw-/li+AD4-
  +ADw-li+AD4-
    +ADw-a href+AD0AIg-installing-kubectl-cli.html+ACIAPg-Installing the Kubernetes CLI+ADw-/a+AD4-
  +ADw-/li+AD4-
+ADw-/ul+AD4-
