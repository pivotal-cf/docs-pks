---
title: vSphere with NSX Version Requirements

topictype: vspherewithnsxt
---

This topic describes the version requirements for installing {{  vars.product_full }} ({{ vars.product_short }}) on vSphere with NSX integration.

* [vSphere Version Requirements](#vsphere-version)
* [NSX Integration Component Version Requirements](#tkgi-with-nsx-t)

For prerequisites and resource requirements for installing {{  vars.product }} on vSphere without NSX
integration, see
[vSphere Prerequisites and Resource Requirements](vsphere-requirements.html).

For hardware and resource requirements for deploying {{  vars.product }} on vSphere with NSX
in production environments, see [Hardware Requirements for {{  vars.product }} on vSphere with NSX](./vsphere-nsxt-rpd-mpd.html).

{{  vars.product }} supports air-gapped deployments on vSphere with or without NSX integration.

You can also configure integration with the Harbor tile, an enterprise-class registry server for
container images. For more information, see
[VMware Harbor Registry](https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/index.html) in the
_VMware Partner documentation_.

##<a id="vsphere-version"></a> vSphere Version Requirements

{{> _vsphere_versions }}


##<a id='tkgi-with-nsx-t'></a> NSX Integration Component Version Requirements

Refer to the <a href="./release-notes.html">{{  vars.product }} Release Notes</a> for supported NSX versions.
