---
title: Installing Tanzu Kubernetes Grid Integrated Edition on vSphere

iaas: vSphere
---

This topic describes options for installing {{  vars.product_full }} on vSphere.

## <a id='overview'></a>Overview

You can install {{ vars.product_short }} on vSphere in four ways:

- [Install {{ vars.product_short }} on vSphere with the Management Console](console-install-vsphere.html)
- [Install {{ vars.product_short }} on vSphere with NSX Using {{ vars.platform_name }}](vsphere-nsxt-index.html)
- [Install {{ vars.product_short }} on vSphere with Antrea Using {{ vars.platform_name }}](vsphere-cni.html)
- [Install {{ vars.product_short }} on VMware Cloud Foundation](vsphere-vcf.html)

Which way you chose to install {{ vars.product_short }} depends on whether you use the {{ vars.product_short }} Management Console,
and which container networking overlay you use.

Where possible, {{{ vars.recommended_by }}} recommends using the {{ vars.product_short }} Management Console
to install {{ vars.product_short }} on vSphere.
For more information, see [Decide When to Use {{ vars.product_short }} Management Console](console-install-vsphere.html#decide-when-to-use-console)
in _Install {{  vars.product }} on vSphere with the Management Console_.
