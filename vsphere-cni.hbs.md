---
title: Install {{  vars.product }} with Antrea on vSphere Using {{ vars.platform_name }}

iaas: vSphere
---

The following topics describe how to use {{ vars.platform_name }} to manually install {{  vars.product_full }} ({{ vars.product_short }}) on vSphere with Antrea networking.

<p class="note"><strong>Note</strong>: The recommended method for installing {{  vars.product }} on vSphere is to use the {{  vars.product }} Management Console. For information, see <a href="console-install-vsphere.html">Install on vSphere with the Management Console</a>.</p>

To install {{  vars.product }} on vSphere with Antrea networking follow the instructions below:

<ul>
  <li>
    <a href="./vsphere-requirements.html">Prerequisites and Resource Requirements</a>
  </li>
  <li>
    <a href="https://ports.vmware.com/home/vSphere+NSX-Data-Center-for-vSphere+NSX-Data-Center">VMware Ports and Protocols</a> on the VMware site
  </li>
  <li>
    <a href="./vsphere-prepare-env.html">Creating Dedicated Users and Roles for vSphere (Optional)</a>
  </li>
  <li>
    <a href="./vsphere-om-install-config.html">Installing and Configuring {{ vars.platform_name }} on vSphere</a>
  </li>
  <li>
    <a href="./installing-vsphere.html">Installing {{  vars.product }} on vSphere</a>
  </li>
  <li>
    <a href="./vsphere-configure-api.html">Configuring a TKGI API Load Balancer</a>
  </li>
  <li>
    <a href="./vsphere-configure-users.html">Setting Up {{  vars.product }} Admin Users on vSphere</a>
  </li>
  <li>
    <a href="https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/integrating-pks.html">(Optional) Integrating VMware Harbor with {{  vars.product }}</a>
  </li>
</ul>

<p class="note"><strong>Note:</strong> VMware Harbor is an enterprise-class registry server for
container images. For more information, see
<a href="https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/index.html">VMware Harbor Registry</a> in the
<em>VMware Partner documentation</em>.</p>

## Install the TKGI and Kubernetes CLIs

The TKGI CLI and Kubernetes CLI help you interact with your {{  vars.product }}-provisioned Kubernetes clusters and Kubernetes workloads.

To install the CLIs, follow the instructions below:

<ul>
  <li>
    <a href="installing-cli.html">Installing the TKGI CLI</a>
  </li>
  <li>
    <a href="installing-kubectl-cli.html">Installing the Kubernetes CLI</a>
  </li>
</ul>
