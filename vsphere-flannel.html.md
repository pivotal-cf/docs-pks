---
title: Manual Installation on vSphere with Flannel
owner: PKS
iaas: vSphere
---

This topic lists the procedures to follow to install <%= vars.product_full %> on vSphere manually.

<p class="note"><strong>Note</strong>: The recommended method for installing <%= vars.product_short %> on vSphere is to use the <%= vars.product_short %> Management Console. For information, see <a href="console-install-vsphere.html">Install on vSphere with the Management Console</a>.</p>

To install <%= vars.product_short %> on vSphere without NSX-T, follow the instructions below:

<ul>
  <li>
    <a href="./vsphere-requirements.html">Prerequisites and Resource Requirements</a>
  </li>
  <li>
    <a href="./ports-protocols-wo-nsx-t.html">Firewall Ports and Protocols Requirements for vSphere without NSX-T</a>
  </li>
  <li>
    <a href="./vsphere-prepare-env.html">Creating Dedicated Users and Roles for vSphere (Optional)</a>
  </li>
  <li>
    <a href="./vsphere-om-install-config.html">Installing and Configuring Ops Manager on vSphere</a>
  </li>
  <li>
    <a href="./installing-pks-vsphere.html">Installing <%= vars.product_short %> on vSphere</a>
  </li>
  <li>
    <a href="./vsphere-configure-pks-api.html">Configuring PKS API Load Balancer</a>
  </li>
  <li>
    <a href="./vsphere-configure-pks-users.html">Setting Up <%= vars.product_short %> Admin Users on vSphere</a>
  </li>
  <li>
    <a href="https://docs.pivotal.io/partners/vmware-harbor/integrating-pks.html">(Optional) Integrating VMware Harbor with <%= vars.product_short %></a>
  </li>
</ul>

<p class="note"><strong>Note:</strong> VMware Harbor is an enterprise-class registry server for
container images. For more information, see
<a href="https://docs.pivotal.io/partners/vmware-harbor/index.html">VMware Harbor Registry</a> in the
<em>VMware Partner documentation</em>.</p>

## Install the PKS and Kubernetes CLIs

The PKS CLI and Kubernetes CLI help you interact with your <%= vars.product_short %>-provisioned Kubernetes clusters and Kubernetes workloads.

To install the CLIs, follow the instructions below:

<ul>
  <li>
    <a href="installing-pks-cli.html">Installing the PKS CLI</a>
  </li>
  <li>
    <a href="installing-kubectl-cli.html">Installing the Kubernetes CLI</a>
  </li>
</ul>
