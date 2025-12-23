---
title: Installing Tanzu Kubernetes Grid Integrated Edition

---

This topics below describe how to install and configure {{  vars.product_full }}.



## <a id='overview'></a>Overview

You can install {{ vars.product_short }} manually as a {{ vars.platform_name }} tile or use the {{  vars.product }} Management Console which provides a graphical user interface to assist with
configuring and deploying {{ vars.product_short }} to vSphere.

To install and configure {{ vars.product_short }}:

* [{{  vars.product }} Management Console (vSphere Only)](#install-mc)
* [{{  vars.product }} on {{ vars.platform_name }}](#install-manual)


## <a id='install-mc'></a>{{ vars.product_short }} Management Console (vSphere Only)

See the following documentation for the {{ vars.product_short }} Management Console, which is the recommended method for installing {{ vars.product_short }} on vSphere:

* [Install {{  vars.product }} on vSphere with the Management Console](./console-install-vsphere.html)

For more information, see [When Should I Use {{  vars.product }} Management Console?](./vsphere-index.html#when-to-use-console).


## <a id='install-manual'></a>{{ vars.product_short }} on {{ vars.platform_name }}

To manually install {{ vars.product_short }} on {{ vars.platform_name }}:

<ul>
  <li>
    <a href="vsphere-cni.html">vSphere (Antrea Networking)</a>
  </li>
  <li>
    <a href="vsphere-nsxt-index.html">vSphere (NSX Networking)</a>
  </li>
  <li>
    <a href="aws-index.html">Amazon Web Services (Antrea Networking)</a>
  </li>
  <li>
    <a href="azure-index.html">Azure (Antrea Networking)</a>
  </li>
</ul>

<p class="note"><strong>Note:</strong> {{  vars.product }} supports air-gapped deployments on vSphere with Antrea networking or with NSX integration.</p>
