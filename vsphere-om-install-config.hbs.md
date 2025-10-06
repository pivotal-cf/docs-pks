---
title: Installing and Configuring +AHsAewB7- vars.platform+AF8-name +AH0AfQB9- on vSphere

---

This topic describes how to install and configure +AHsAewB7- vars.platform+AF8-name +AH0AfQB9-
before deploying VMware Tanzu Kubernetes Grid Integrated Edition (TKGI) on VMware vSphere.


+ACMAIw- +ADw-a id+AD0-'overview'+AD4APA-/a+AD4- Overview

Use +AHsAewB7- vars.platform+AF8-name +AH0AfQB9- to install and configure TKGI.

+AHsAewB7- vars.platform+AF8-name +AH0AfQB9- provides a dashboard UI for installing applications and components.
+AHsAewB7- vars.platform+AF8-name +AH0AfQB9- and the installed components include an interface for configuring the +AHsAewB7- vars.platform+AF8-name +AH0AfQB9- environment, component settings, and cluster configurations.

To install +AHsAewB7- vars.platform+AF8-name +AH0AfQB9-:

1. +AFs-Prerequisites+AF0-(+ACM-prerequisites)
1. +AFs-Install and Configure +AHsAewB7- vars.platform+AF8-name +AH0AfQB9AF0-(+ACM-install-om)

+ACMAIw- +ADw-a id+AD0-'prerequisites'+AD4APA-/a+AD4-Prerequisites

Before installing +AHsAewB7- vars.platform+AF8-name +AH0AfQB9-, review the following prerequisites:

+ACo- +AFs-vSphere Prerequisites and Resource Requirements+AF0-(vsphere-requirements.html)
+ACo- +AFs-VMware Ports and Protocols+AF0-(https://ports.vmware.com/home/vSphere+NSU-Data-Center-for-vSphere+NSU-Data-Center)
on the VMware site.
+ACo- +AFs-Creating Dedicated Users and Roles for vSphere (Optional)+AF0-(vsphere-prepare-env.html)

+ACMAIw- +ADw-a id+AD0AIg-install-om+ACIAPgA8-/a+AD4-Install and Configure +AHsAewB7- vars.platform+AF8-name +AH0AfQB9-

To install +AHsAewB7- vars.platform+AF8-name +AH0AfQB9-:

1. Determine the most recent version of +AHsAewB7- vars.platform+AF8-name +AH0AfQB9- that is compatible with the TKGI version you are deploying.
For information on +AHsAewB7- vars.platform+AF8-name +AH0AfQB9- compatibility with TKGI,
see +AFsAewB7AHs- vars.product+AF8-network +AH0AfQB9AF0-(https://support.broadcom.com/group/ecx/productfiles?subFamily+AD0-Tanzu+ACU-20Kubernetes+ACU-20Grid+ACU-20Integrated+ACU-20Edition+ACU-20(TKGi)+ACU-20-+ACU-20CLI+ACU-20+ACU-26+ACU-20Tile+ACY-displayGroup+AD0-Tanzu+ACU-20Kubernetes+ACU-20Grid+ACU-20Integrated+ACU-20Edition+ACU-20(TKGi)+ACU-20-+ACU-20CLI+ACU-20+ACU-26+ACU-20Tile+ACY-release+AD0-1.22.2+ACY-os+AD0AJg-servicePk+AD0AJg-language+AD0-EN).

1. To install and configure +AHsAewB7- vars.platform+AF8-name +AH0AfQB9-, follow the installation instructions for your selected +AHsAewB7- vars.platform+AF8-name +AH0AfQB9- version:

    +ADw-table+AD4-
      +ADw-tr+AD4-
        +ADw-th+AD4-Version+ADw-/th+AD4-
        +ADw-th+AD4-Instructions+ADw-/th+AD4-
      +ADw-/tr+AD4-
      +ADw-tr+AD4-
        +ADw-td+AD4AewB7AHs- vars.platform+AF8-name +AH0AfQB9- v3.0+ADw-/td+AD4-
        +ADw-td+AD4-
          +ADw-ol+AD4-
            +ADw-li+AD4APA-a href+AD0AIg-https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/vsphere-deploy.html+ACIAPg-Deploying +AHsAewB7- vars.platform+AF8-name +AH0AfQB9- on vSphere+ADw-/a+AD4APA-/li+AD4-
            +ADw-li+AD4APA-a href+AD0AIg-https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/vsphere-config.html+ACIAPg-Configuring BOSH Director on vSphere+ADw-/a+AD4APA-/li+AD4-
          +ADw-/ol+AD4-
        +ADw-/td+AD4-
      +ADw-/tr+AD4-
      +ADw-tr+AD4-
        +ADw-td+AD4AewB7AHs- vars.platform+AF8-name +AH0AfQB9- v2.10+ADw-/td+AD4-
        +ADw-td+AD4-
          +ADw-ol+AD4-
            +ADw-li+AD4APA-a href+AD0AIg-https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/2-10/tanzu-ops-manager/vsphere-deploy.html+ACIAPg-Deploying +AHsAewB7- vars.platform+AF8-name +AH0AfQB9- on vSphere+ADw-/a+AD4APA-/li+AD4-
            +ADw-li+AD4APA-a href+AD0AIg-https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/2-10/tanzu-ops-manager/vsphere-config.html+ACIAPg-Configuring BOSH Director on vSphere+ADw-/a+AD4APA-/li+AD4-
          +ADw-/ol+AD4-
        +ADw-/td+AD4-
      +ADw-/tr+AD4-
    +ADw-/table+AD4-

+ACMAIw- +ADw-a id+AD0AIg-next-steps+ACIAPgA8-/a+AD4-Next Installation Step

To install and configure Tanzu Kubernetes Grid Integrated Edition,
follow the instructions in +AFs-Installing Tanzu Kubernetes Grid Integrated Edition on vSphere+AF0-(installing-vsphere.html).
