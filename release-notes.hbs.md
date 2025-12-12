---
title: Release Notes
owner: TKGI
topictype: releasenotes
---


This topic contains release notes for Tanzu Kubernetes Grid Integrated Edition (TKGI) {{{ vars.product_version }}}.

- [TKGI {{{ vars.product_version }}}.4](#1-22-4)
- [TKGI {{{ vars.product_version }}}.3](#1-22-3)
- [TKGI {{{ vars.product_version }}}.2](#1-22-2)
- [TKGI {{{ vars.product_version }}}.1](#1-22-1)
- [TKGI {{{ vars.product_version }}}.0](#1-22-0)

## <a id="1-22-4"></a>TKGI {{{ vars.product_version }}}.4

**Release Date**: December 16, 2025

### <a id="1-22-4-snapshot"></a><a id="product-snapshot"></a>Product Snapshot

<table class="nice">
    <tr>
        <th colspan=3><h4>Release Details</h4></th>
    </tr>
    <tr>
        <td>Version</td>
        <td colspan=2><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.4&os=&servicePk=&language=EN" target="_blank">v1.22.4</a></td>
    </tr>
    <tr>
        <td>Release date</td>
        <td colspan=2>December 16, 2025</td>
    </tr>
    <tr>
        <th colspan=3><h4>Internal Component Versions</h4></th>
    </tr>
    <tr>
        <td>Antrea</td>
        <td>v1.10.0</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/nsx/container-networking/1-x/release-notes.html" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>cAdvisor</td>
        <td colspan=2>v0.47.2</td>
    </tr>
    <tr>
        <td>Cloud Providers</td>
        <td>AWS: v1.31.8<br>Azure: v1.31.9<br>vSphere: v1.31.1</td>
        <td style="text-align: center;">Release Notes:
          <br><a href="https://github.com/kubernetes/cloud-provider-aws/releases/tag/v1.31.8">AWS</a>
          <br><a href="https://github.com/kubernetes-sigs/cloud-provider-azure/releases/tag/v1.31.9">Azure</a>
          <br><a href="https://github.com/kubernetes/cloud-provider-vsphere/releases/tag/v1.31.1">vSphere</a>
        </td>
    </tr>
    <tr>
        <td>Containerd</td>
        <td colspan=2>Linux: v1.7.27<br>Windows: v1.7.27</td>
    </tr>
    <tr>
        <td>CoreDNS</td>
        <td colspan=2>v1.11.3_vmware.2</td>
    </tr>
    <tr>
        <td>CSI Driver for vSphere</td>
        <td>v3.4.0</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/container-storage-plugin/3-0/release-notes/vmware-vsphere-container-storage-plugin-30-release-notes.html#vSphere%20Container%20Storage%20Plug-in%203.4.0" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>etcd</td>
        <td colspan=2>v3.5.15</td>
    </tr>
    <tr>
        <td>Harbor</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Harbor%20Registry&displayGroup=VMware%20Harbor%20Registry&release=2.13.2&os=&servicePk=&language=EN" target="_blank">v2.13.2</a></td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/harbor-registry/services/harbor/release-notes.html#v2.13.2" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Kubernetes</td>
        <td>v1.31.14</td>
        <td style="text-align: center;"><a href="https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Metrics Server</td>
        <td colspan=2>v0.7.2</td>
    </tr>
    <tr>
        <td>NCP</td>
        <td>v4.2.2.0</td>
        <td style="text-align: center;">
        <a href="https://techdocs.broadcom.com/us/en/vmware-cis/nsx/event-catalog/4-2/release-notes/vmware-nsx-container-plugin-4211-release-notes.html" target="_blank">Release Notes</a>
        </td>
    </tr>
    <tr>
        <td>Percona XtraDB Cluster (PXC)
        <br>(in BOSH&nbsp;pxc-release)</td>
        <td>v8.0.41-32
        <br>pxc-release: v1.0.42</td>
        <td style="text-align: center;">Release Notes:
        <br><a href="https://docs.percona.com/percona-xtradb-cluster/8.0/release-notes/8.0.41-32.html">PXC</a>
        <br><a href="https://github.com/cloudfoundry/pxc-release/releases/tag/v1.0.42">pxc-release</a>
        </td>
    </tr>
    <tr>
        <td>UAA</td>
        <td colspan=2>v77.20.8</td>
    </tr>
    <tr>
        <td>Velero</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&release=1.22.4&os=&servicePk=&language=EN" target="_blank">1.15.2</a></td>
        <td style="text-align: center;"><a href="https://github.com/vmware-tanzu/velero/releases/tag/v1.15.2" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <th colspan=3><h4>Stemcell Compatibility</h4></th>
    </tr>
    <tr>
        <td>Ubuntu Jammy stemcells</td>
        <td colspan=2>See <strong>Upgrade/Dependency Information</strong> at the top right of the <a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.4&os=&servicePk=&language=EN" target="_blank">TKGi CLI & Tile v1.22</a> download page on Broadcom Support.</td>
    </tr>
    <tr>
        <td>Windows stemcells</td>
        <td colspan=2>v2019.88 or later</td>
    </tr>
    <tr>
        <th colspan=3><h4>Interoperability</h4></th>
    </tr>
    <tr>
        <td>Operations Manager</td>
        <td colspan=2>See <strong>Upgrade/Dependency Information</strong> at the top right of the <a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.4&os=&servicePk=&language=EN" target="_blank">TKGi CLI & Tile v1.22</a> download page on Broadcom Support.</td>
    </tr>
    <tr>
        <td>VMware Aria Operations Management Pack for Kubernetes</td>
        <td>v2.1</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/aria/aria-operations-for-integrations/2-1/vrealize--operations-management-pack--for-pack-for-kubernetes-2-1/vrealize--operations-management-pack--for-kubernetes.html" target="_blank">v2.1 documentation</a></td>
    </tr>
    <tr>
        <td>VMware Cloud Foundation (VCF)</td>
        <td>v5.1.1, v5.1, v4.5.2</td>
        <td style="text-align: center;">Release Notes:
            <a href="https://docs.vmware.com/en/VMware-Cloud-Foundation/5.1.1/rn/vmware-cloud-foundation-511-release-notes/index.html" target="_blank">v5.1.1</a>, <a href="https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-5-2-and-earlier/5-1/vcf-release-notes/vmware-cloud-foundation-51-release-notes.html" target="_blank">v5.1</a>,
            <a href="https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-5-2-and-earlier/4-5/vcf-release-notes/vmware-cloud-foundation-452-on-dell-emc-vxrail-release-notes.html" target="_blank">v4.5.2</a>
        </td>
    </tr>
    <tr>
        <td>VMware NSX&#42;&#42;</td>
        <td rowspan=2 colspan=2>See <a href="https://interopmatrix.vmware.com/Interoperability?col=644&row=0," target="_blank">VMware Product Interoperability Matrices</a>&#42;&#42;&#42;.</td>
    </tr>
    <tr>
        <th colspan=3><h4>Management Console (vSphere)</h4></th>
    </tr>
    <tr>
        <td>TKGI Management Console</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&release=1.22.0&os=&servicePk=&language=EN" target="_blank">v1.22.0</a></td><td><p class="note"><strong>Note</strong>: The component versions supported by TKGI Management Console might differ from or be more limited than the versions supported by TKGI.</p></td>
    </tr>
    <tr>
        <td>Installed Ops Manager version</td>
        <td>v3.0.41</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/release-notes.html#3-0-41" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Installed Harbor Registry version</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Harbor%20Registry&displayGroup=VMware%20Harbor%20Registry&release=2.13.2&os=&servicePk=&language=EN" target="_blank">v2.13.2</a></td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/harbor-registry/services/harbor/release-notes.html#v2.13.2">Release Notes</a></td>
    </tr>
    <tr>
        <td>Ubuntu Jammy stemcell</td>
        <td>v1.906</td>
        <td style="text-align: center;"><a href="https://github.com/cloudfoundry/bosh-linux-stemcell-builder/releases/tag/ubuntu-jammy%2Fv1.906" target="_blank">Release Notes</a></td>
    </tr>
</table>

&#42; Components marked with an asterisk have been updated.

&#42;&#42; As of May 7, 2024, NSX networking and firewall components are sold separately from TKGI.

&#42;&#42;&#42; Migration from NSX Management Plane API to NSX Policy API requires VMware NSX v4.0.1.1 or later.
NSX v4.0.1.1 supports only 50% of NSX Management Plane API scale.
To use Policy API at 100% of Management Plane API scale, use NSX v4.1.1 or later.

### <a id="1-22-4-upgrade"></a>Upgrade Path

The supported upgrade paths to Tanzu Kubernetes Grid Integrated Edition v1.22.4 are from TKGI v1.22.2, v1.22.3, and from v1.21.x.

### <a id="1-22-4-breaking-changes"></a>Breaking Changes

TKGI v1.22.4 does not include any new breaking changes.

### <a id="1-22-4-features"></a>Features and Enhancements

TKGI v1.22.4 does not include any new features.

### <a id="1-22-4-bug-fixes"></a>Resolved Issues

TKGI v1.22.4 resolves the following issues:

#### <a id="1-22-3-TKGI-10593"></a>Snaphot-controller pod fails with `ImagePullBackOff`

The snapshot-controller pod in the `kube-system` namespace fails with `ImagePullBackOff` in TKGI clusters.

**Required Action**

If you have upgraded clusters to TKGI v1.22.4, or before upgrading clusters from TKGI 1.22.3, manually update the image URL in the cluster deployment to `registry.k8s.io/sig-storage/snapshot-controller:v7.0.2`.

### <a id='1-22-4-security'></a> Security Fixes

See [{{{ vars.product_version }}}.4 Security Fixes](cve.hbs.md#1-22-4) for the list of CVEs fixed in this release.

###<a id="1-22-4-known-issues"></a>Known Issues

Except where noted, the known issues in TKGI v1.22.0 are also in TKGI v1.22.4. For more information, see [TKGI v1.22.0 Known Issues](#1-22-0-known-issues) below.

## <a id="1-22-3"></a>TKGI {{{ vars.product_version }}}.3

**Release Date**: October 15, 2025

### <a id="1-22-3-snapshot"></a><a id="product-snapshot"></a>Product Snapshot

<table class="nice">
    <tr>
        <th colspan=3><h4>Release Details</h4></th>
    </tr>
    <tr>
        <td>Version</td>
        <td colspan=2><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.3&os=&servicePk=&language=EN" target="_blank">v1.22.3</a></td>
    </tr>
    <tr>
        <td>Release date</td>
        <td colspan=2>October 15, 2025</td>
    </tr>
    <tr>
        <th colspan=3><h4>Internal Component Versions</h4></th>
    </tr>
    <tr>
        <td>Antrea</td>
        <td>v1.10.0</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/nsx/container-networking/1-x/release-notes.html" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>cAdvisor</td>
        <td colspan=2>v0.47.2</td>
    </tr>
    <tr>
        <td>Cloud Providers</td>
        <td>AWS: v1.31.8&#42;<br>Azure: v1.31.9&#42;<br>vSphere: v1.31.1</td>
        <td style="text-align: center;">Release Notes:
          <br><a href="https://github.com/kubernetes/cloud-provider-aws/releases/tag/v1.31.8">AWS</a>
          <br><a href="https://github.com/kubernetes-sigs/cloud-provider-azure/releases/tag/v1.31.9">Azure</a>
          <br><a href="https://github.com/kubernetes/cloud-provider-vsphere/releases/tag/v1.31.1">vSphere</a>
        </td>
    </tr>
    <tr>
        <td>Containerd</td>
        <td colspan=2>Linux: v1.7.27<br>Windows: v1.7.27</td>
    </tr>
    <tr>
        <td>CoreDNS</td>
        <td colspan=2>v1.11.3_vmware.2</td>
    </tr>
    <tr>
        <td>CSI Driver for vSphere</td>
        <td>v3.4.0&#42;</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/container-storage-plugin/3-0/release-notes/vmware-vsphere-container-storage-plugin-30-release-notes.html#vSphere%20Container%20Storage%20Plug-in%203.4.0" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>etcd</td>
        <td colspan=2>v3.5.15</td>
    </tr>
    <tr>
        <td>Harbor</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Harbor%20Registry&displayGroup=VMware%20Harbor%20Registry&release=2.13.2&os=&servicePk=&language=EN" target="_blank">v2.13.2</a></td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/harbor-registry/services/harbor/release-notes.html#v2.13.2" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Kubernetes</td>
        <td>v1.31.12&#42;</td>
        <td style="text-align: center;"><a href="https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#changelog-since-v13112" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Metrics Server</td>
        <td colspan=2>v0.7.2</td>
    </tr>
    <tr>
        <td>NCP</td>
        <td>v4.2.2.0&#42;</td>
        <td style="text-align: center;">
        <a href="https://techdocs.broadcom.com/us/en/vmware-cis/nsx/event-catalog/4-2/release-notes/vmware-nsx-container-plugin-4211-release-notes.html" target="_blank">Release Notes</a>
        </td>
    </tr>
    <tr>
        <td>Percona XtraDB Cluster (PXC)
        <br>(in BOSH&nbsp;pxc-release)</td>
        <td>v8.0.41-32&#42;
        <br>pxc-release: v1.0.42</td>
        <td style="text-align: center;">Release Notes:
        <br><a href="https://docs.percona.com/percona-xtradb-cluster/8.0/release-notes/8.0.41-32.html">PXC</a>
        <br><a href="https://github.com/cloudfoundry/pxc-release/releases/tag/v1.0.42">pxc-release</a>
        </td>
    </tr>
    <tr>
        <td>UAA</td>
        <td colspan=2>v77.20.8</td>
    </tr>
    <tr>
        <td>Velero</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&release=1.22.2&os=&servicePk=&language=EN" target="_blank">1.15.2</a></td>
        <td style="text-align: center;"><a href="https://github.com/vmware-tanzu/velero/releases/tag/v1.15.2" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <th colspan=3><h4>Stemcell Compatibility</h4></th>
    </tr>
    <tr>
        <td>Ubuntu Jammy stemcells</td>
        <td colspan=2>See <strong>Upgrade/Dependency Information</strong> at the top right of the <a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.3&os=&servicePk=&language=EN" target="_blank">TKGi CLI & Tile v1.23</a> download page on Broadcom Support.</td>
    </tr>
    <tr>
        <td>Windows stemcells</td>
        <td colspan=2>v2019.88&#42; or later</td>
    </tr>
    <tr>
        <th colspan=3><h4>Interoperability</h4></th>
    </tr>
    <tr>
        <td>Operations Manager</td>
        <td colspan=2>See <strong>Upgrade/Dependency Information</strong> at the top right of the <a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.3&os=&servicePk=&language=EN" target="_blank">TKGi CLI & Tile v1.22</a> download page on Broadcom Support.</td>
    </tr>
    <tr>
        <td>VMware Aria Operations Management Pack for Kubernetes</td>
        <td>v2.1</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/aria/aria-operations-for-integrations/2-1/vrealize--operations-management-pack--for-pack-for-kubernetes-2-1/vrealize--operations-management-pack--for-kubernetes.html" target="_blank">v2.1 documentation</a></td>
    </tr>
    <tr>
        <td>VMware Cloud Foundation (VCF)</td>
        <td>v5.1.1, v5.1, v4.5.2</td>
        <td style="text-align: center;">Release Notes:
            <a href="https://docs.vmware.com/en/VMware-Cloud-Foundation/5.1.1/rn/vmware-cloud-foundation-511-release-notes/index.html" target="_blank">v5.1.1</a>, <a href="https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-5-2-and-earlier/5-1/vcf-release-notes/vmware-cloud-foundation-51-release-notes.html" target="_blank">v5.1</a>,
            <a href="https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-5-2-and-earlier/4-5/vcf-release-notes/vmware-cloud-foundation-452-on-dell-emc-vxrail-release-notes.html" target="_blank">v4.5.2</a>
        </td>
    </tr>
    <tr>
        <td>VMware NSX&#42;&#42;</td>
        <td rowspan=2 colspan=2>See <a href="https://interopmatrix.vmware.com/Interoperability?col=644&row=0," target="_blank">VMware Product Interoperability Matrices</a>&#42;&#42;&#42;.</td>
    </tr>
    <tr>
        <th colspan=3><h4>Management Console (vSphere)</h4></th>
    </tr>
    <tr>
        <td>TKGI Management Console</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&release=1.22.0&os=&servicePk=&language=EN" target="_blank">v1.22.0</a></td><td><p class="note"><strong>Note</strong>: The component versions supported by TKGI Management Console might differ from or be more limited than the versions supported by TKGI.</p></td>
    </tr>
    <tr>
        <td>Installed Ops Manager version</td>
        <td>v3.0.41</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/release-notes.html#3-0-41" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Installed Harbor Registry version</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Harbor%20Registry&displayGroup=VMware%20Harbor%20Registry&release=2.13.2&os=&servicePk=&language=EN" target="_blank">v2.13.2</a></td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/harbor-registry/services/harbor/release-notes.html#v2.13.2">Release Notes</a></td>
    </tr>
    <tr>
        <td>Ubuntu Jammy stemcell</td>
        <td>v1.906</td>
        <td style="text-align: center;"><a href="https://github.com/cloudfoundry/bosh-linux-stemcell-builder/releases/tag/ubuntu-jammy%2Fv1.906" target="_blank">Release Notes</a></td>
    </tr>
</table>

&#42; Components marked with an asterisk have been updated.

&#42;&#42; As of May 7, 2024, NSX networking and firewall components are sold separately from TKGI.

&#42;&#42;&#42; Migration from NSX Management Plane API to NSX Policy API requires VMware NSX v4.0.1.1 or later.
NSX v4.0.1.1 supports only 50% of NSX Management Plane API scale.
To use Policy API at 100% of Management Plane API scale, use NSX v4.1.1 or later.

### <a id="1-22-3-upgrade"></a>Upgrade Path

The supported upgrade paths to Tanzu Kubernetes Grid Integrated Edition v1.22.3 are from TKGI v1.22.1 and from v1.21.x.

### <a id="1-22-3-breaking-changes"></a>Breaking Changes

TKGI v1.22.3 includes NSX Container Plugin (NCP) 4.2.2. NCP 4.2.2 removes support for NSX-T 4.1.0.3 and NSX 3.2.4. If you are using these versions of NSX, you must upgrade to a version of NSX that is supported by NCP 4.2.2. The following table shows the supported NSX versions for NCP 4.2.2 and NCP 4.2.1.1.

| NSX | 4.2.2 | 4.2.1 | 4.2.0 | 4.1.2.5 | 4.1.2.4 | 4.1.0.3 | 3.2.5 | 3.2.4 |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| [NCP 4.2.2](https://techdocs.broadcom.com/us/en/vmware-cis/nsx/event-catalog/4-2/release-notes/vmware-nsx-container-plugin-422-release-notes.html) | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ | ✅ | ❌ |
| [NCP 4.2.1.1](https://techdocs.broadcom.com/us/en/vmware-cis/nsx/event-catalog/4-2/release-notes/vmware-nsx-container-plugin-4211-release-notes.html) | ❌ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

### <a id="1-22-3-features"></a>Features and Enhancements

TKGI v1.22.3 does not include any new features.

### <a id="1-22-3-bug-fixes"></a>Resolved Issues

TKGI v1.22.3 does not resolve any previously reported issues.

### <a id='1-22-3-security'></a> Security Fixes

See [{{{ vars.product_version }}}.3 Security Fixes](cve.hbs.md#1-22-3) for the list of CVEs fixed in this release.

###<a id="1-22-3-known-issues"></a>Known Issues

Except where noted, the known issues in TKGI v1.22.0 are also in TKGI v1.22.3. For more information, see [TKGI v1.22.0 Known Issues](#1-22-0-known-issues) below.

<hr>

## <a id="1-22-2"></a>TKGI {{{ vars.product_version }}}.2

**Release Date**: August 22, 2025

### <a id="1-22-2-snapshot"></a><a id="product-snapshot"></a>Product Snapshot

<table class="nice">
    <tr>
        <th colspan=3><h4>Release Details</h4></th>
    </tr>
    <tr>
        <td>Version</td>
        <td colspan=2><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.4&os=&servicePk=&language=EN" target="_blank">v1.22.2</a></td>
    </tr>
    <tr>
        <td>Release date</td>
        <td colspan=2>August 22, 2025</td>
    </tr>
    <tr>
        <th colspan=3><h4>Internal Component Versions</h4></th>
    </tr>
    <tr>
        <td>Antrea</td>
        <td>v1.10.0</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/nsx/container-networking/1-x/release-notes.html" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>cAdvisor</td>
        <td colspan=2>v0.47.2</td>
    </tr>
    <tr>
        <td>Cloud Providers</td>
        <td>AWS: v1.31.7&#42;<br>Azure: v1.31.8&#42;<br>vSphere: v1.31.1</td>
        <td style="text-align: center;">Release Notes:
          <br><a href="https://github.com/kubernetes/cloud-provider-aws/releases/tag/v1.31.7">AWS</a>
          <br><a href="https://github.com/kubernetes-sigs/cloud-provider-azure/releases/tag/v1.31.8">Azure</a>
          <br><a href="https://github.com/kubernetes/cloud-provider-vsphere/releases/tag/v1.31.1">vSphere</a>
        </td>
    </tr>
    <tr>
        <td>Containerd</td>
        <td colspan=2>Linux: v1.7.27&#42;<br>Windows: v1.7.27&#42;</td>
    </tr>
    <tr>
        <td>CoreDNS</td>
        <td colspan=2>v1.11.3_vmware.2</td>
    </tr>
    <tr>
        <td>CSI Driver for vSphere</td>
        <td>v3.3.1</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/container-storage-plugin/3-0/release-notes/vmware-vsphere-container-storage-plugin-30-release-notes.html#vSphere%20Container%20Storage%20Plug-in%203.3.1" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>etcd</td>
        <td colspan=2>v3.5.15</td>
    </tr>
    <tr>
        <td>Harbor</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Harbor%20Registry&displayGroup=VMware%20Harbor%20Registry&release=2.11.0&os=&servicePk=&language=EN" target="_blank">v2.11.0</a></td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/release-notes.html#v2110-0" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Kubernetes</td>
        <td>v1.31.9&#42;</td>
        <td style="text-align: center;"><a href="https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#changelog-since-v1319" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Metrics Server</td>
        <td colspan=2>v0.7.2</td>
    </tr>
    <tr>
        <td>NCP</td>
        <td>v4.2.1.1</td>
        <td style="text-align: center;">
        <a href="https://techdocs.broadcom.com/us/en/vmware-cis/nsx/event-catalog/4-2/release-notes/vmware-nsx-container-plugin-4211-release-notes.html" target="_blank">Release Notes</a>
        </td>
    </tr>
    <tr>
        <td>Percona XtraDB Cluster (PXC)
        <br>(in BOSH&nbsp;pxc-release)</td>
        <td>v8.0.41-32&#42;
        <br>pxc-release: v1.0.42&#42;</td>
        <td style="text-align: center;">Release Notes:
        <br><a href="https://docs.percona.com/percona-xtradb-cluster/8.0/release-notes/8.0.41-32.html">PXC</a>
        <br><a href="https://github.com/cloudfoundry/pxc-release/releases/tag/v1.0.42">pxc-release</a>
        </td>
    </tr>
    <tr>
        <td>UAA</td>
        <td colspan=2>v77.20.8&#42;</td>
    </tr>
    <tr>
        <td>Velero</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&release=1.22.2&os=&servicePk=&language=EN" target="_blank">1.15.2</a></td>
        <td style="text-align: center;"><a href="https://github.com/vmware-tanzu/velero/releases/tag/v1.15.2" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <th colspan=3><h4>Stemcell Compatibility</h4></th>
    </tr>
    <tr>
        <td>Ubuntu Jammy stemcells</td>
        <td colspan=2>See <strong>Upgrade/Dependency Information</strong> at the top right of the <a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.4&os=&servicePk=&language=EN" target="_blank">TKGi CLI & Tile v1.22</a> download page on Broadcom Support.</td>
    </tr>
    <tr>
        <td>Windows stemcells</td>
        <td colspan=2>v2019.78 or later</td>
    </tr>
    <tr>
        <th colspan=3><h4>Interoperability</h4></th>
    </tr>
    <tr>
        <td>Operations Manager</td>
        <td colspan=2>See <strong>Upgrade/Dependency Information</strong> at the top right of the <a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.4&os=&servicePk=&language=EN" target="_blank">TKGi CLI & Tile v1.22</a> download page on Broadcom Support.</td>
    </tr>
    <tr>
        <td>VMware Aria Operations Management Pack for Kubernetes</td>
        <td>v2.1</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/aria/aria-operations-for-integrations/2-1/vrealize--operations-management-pack--for-pack-for-kubernetes-2-1/vrealize--operations-management-pack--for-kubernetes.html" target="_blank">v2.1 documentation</a></td>
    </tr>
    <tr>
        <td>VMware Cloud Foundation (VCF)</td>
        <td>v5.1.1, v5.1, v4.5.2</td>
        <td style="text-align: center;">Release Notes:
            <a href="https://docs.vmware.com/en/VMware-Cloud-Foundation/5.1.1/rn/vmware-cloud-foundation-511-release-notes/index.html" target="_blank">v5.1.1</a>, <a href="https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-5-2-and-earlier/5-2/vcf-release-notes/vmware-cloud-foundation-521-release-notes.html" target="_blank">v5.1</a>,
            <a href="https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-5-2-and-earlier/5-2/vcf-release-notes/vmware-cloud-foundation-521-release-notes.html" target="_blank">v4.5.2</a>
        </td>
    </tr>
    <tr>
        <td>VMware NSX&#42;&#42;</td>
        <td rowspan=2 colspan=2>See <a href="https://interopmatrix.vmware.com/Interoperability?col=644&row=0," target="_blank">VMware Product Interoperability Matrices</a>&#42;&#42;&#42;.</td>
    </tr>
    <tr>
        <th colspan=3><h4>Management Console (vSphere)</h4></th>
    </tr>
    <tr>
        <td>TKGI Management Console</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&release=1.22.1&os=&servicePk=&language=EN" target="_blank">v1.22.1</a></td><td><p class="note"><strong>Note</strong>: The component versions supported by TKGI Management Console might differ from or be more limited than the versions supported by TKGI.</p></td>
    </tr>
    <tr>
        <td>Installed Ops Manager version</td>
        <td>v3.0.41&#42;</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/release-notes.html#3-0-41" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Installed Harbor Registry version</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Harbor%20Registry&displayGroup=VMware%20Harbor%20Registry&release=2.11.0&os=&servicePk=&language=EN" target="_blank">v2.11.0</a></td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/release-notes.html#v2110-0">Release Notes</a></td>
    </tr>
    <tr>
        <td>Ubuntu Jammy stemcell</td>
        <td>v1.866&#42;</td>
        <td style="text-align: center;"><a href="https://github.com/cloudfoundry/bosh-linux-stemcell-builder/releases/tag/ubuntu-jammy%2Fv1.803" target="_blank">Release Notes</a></td>
    </tr>
</table>

&#42; Components marked with an asterisk have been updated.

&#42;&#42; As of May 7, 2024, NSX networking and firewall components are sold separately from TKGI.

&#42;&#42;&#42; Migration from NSX Management Plane API to NSX Policy API requires VMware NSX v4.0.1.1 or later.
NSX v4.0.1.1 supports only 50% of NSX Management Plane API scale.
To use Policy API at 100% of Management Plane API scale, use NSX v4.1.1 or later.

### <a id="1-22-2-upgrade"></a>Upgrade Path

The supported upgrade paths to Tanzu Kubernetes Grid Integrated Edition v1.22.2 are from TKGI v1.22.0 and from v1.21.1 and earlier v1.21 patches.

### <a id="1-22-2-breaking-changes"></a>Breaking Changes

TKGI v1.22.2 does not include any new breaking changes.

### <a id="1-22-2-features"></a>Features and Enhancements

TKGI v1.22.2 does not include any new features.

### <a id="1-22-2-bug-fixes"></a>Resolved Issues

TKGI v1.22.2 resolves the following issues:

* <a id="TKGI-8321"></a> When upgrading from TKGI Management Console 1.21.1 to 1.22.1, the BPM and Syslog components were downgraded from v1.4.20 and v12.3.9 respectively in v1.21.1 to 1.4.17 and 12.3.7 in 1.22.1. In {{{ vars.product_version }}}.2, BPM v1.4.20 and Syslog v12.3.9 are installed.

* <a id="TKGI-8268"></a> Increased the client side timeout for NSX API calls. This resolves an issue in which cluster upgrades failed to upgrade with the following error on the master node: `pks-nsx-t-prepare-master-vm job has failed with context deadline exceeded`.

* <a id="TKGI-7840"></a> Kubernetes pod fails to start with a `failed to setup network for sandbox` error. This was due to a rotation issue with the certificate that NCP uses to communicate with NSX. Now you can update clusters and fix certificate issues later.

### <a id='1-22-2-security'></a> Security Fixes

See [{{{ vars.product_version }}}.2 Security Fixes](cve.hbs.md#1-22-2) for the list of CVEs fixed in this release.

###<a id="1-22-2-known-issues"></a>Known Issues

Except where noted, the known issues in TKGI v1.22.0 are also in TKGI v1.22.2. For more information, see [TKGI v1.22.0 Known Issues](#1-22-0-known-issues) below.

## <a id="1-22-1"></a>TKGI {{{ vars.product_version }}}.1

**Release Date**: April 15, 2025

### <a id="1-22-1-snapshot"></a><a id="product-snapshot"></a>Product Snapshot

<table class="nice">
    <tr>
        <th colspan=3><h4>Release Details</h4></th>
    </tr>
    <tr>
        <td>Version</td>
        <td colspan=2><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.1&os=&servicePk=&language=EN" target="_blank">v1.22.1</a></td>
    </tr>
    <tr>
        <td>Release date</td>
        <td colspan=2>April 15, 2025</td>
    </tr>
    <tr>
        <th colspan=3><h4>Internal Component Versions</h4></th>
    </tr>
    <tr>
        <td>Antrea</td>
        <td>v1.10.0</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/nsx/container-networking/1-x/release-notes.html" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>cAdvisor</td>
        <td colspan=2>v0.47.2</td>
    </tr>
    <tr>
        <td>Cloud Providers</td>
        <td>AWS: v1.31.5<br>Azure: v1.31.0<br>vSphere: v1.31.1</td>
        <td style="text-align: center;">Release Notes:
          <br><a href="https://github.com/kubernetes/cloud-provider-aws/releases/tag/v1.31.5">AWS</a>
          <br><a href="https://github.com/kubernetes-sigs/cloud-provider-azure/releases/tag/v1.31.0">Azure</a>
          <br><a href="https://github.com/kubernetes/cloud-provider-vsphere/releases/tag/v1.31.1">vSphere</a>
        </td>
    </tr>
    <tr>
        <td>Containerd</td>
        <td colspan=2>Linux: v1.7.23<br>Windows: v1.7.23</td>
    </tr>
    <tr>
        <td>CoreDNS</td>
        <td colspan=2>v1.11.3+vmware.2</td>
    </tr>
    <tr>
        <td>CSI Driver for vSphere</td>
        <td>v3.3.1</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/container-storage-plugin/3-0/release-notes/vmware-vsphere-container-storage-plugin-30-release-notes.html#vSphere%20Container%20Storage%20Plug-in%203.3.1" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>etcd</td>
        <td colspan=2>v3.5.15</td>
    </tr>
    <tr>
        <td>Harbor</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Harbor%20Registry&displayGroup=VMware%20Harbor%20Registry&release=2.11.0&os=&servicePk=&language=EN" target="_blank">v2.11.0</a></td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/release-notes.html#v2110-0" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Kubernetes</td>
        <td>v1.31.5</td>
        <td style="text-align: center;"><a href="https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#changelog-since-v1315" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Metrics Server</td>
        <td colspan=2>v0.7.2</td>
    </tr>
    <tr>
        <td>NCP</td>
        <td>v4.2.1.1</td>
        <td style="text-align: center;">
        <a href="https://techdocs.broadcom.com/us/en/vmware-cis/nsx/event-catalog/4-2/release-notes/vmware-nsx-container-plugin-4211-release-notes.html" target="_blank">Release Notes</a>
        </td>
    </tr>
    <tr>
        <td>Percona XtraDB Cluster (PXC)
        <br>(in BOSH&nbsp;pxc-release)</td>
        <td>v8.0.41-32&#42;
        <br>pxc-release: v1.0.38&#42;</td>
        <td style="text-align: center;">Release Notes:
        <br><a href="https://docs.percona.com/percona-xtradb-cluster/8.0/release-notes/8.0.41-32.html">PXC</a>
        <br><a href="https://github.com/cloudfoundry/pxc-release/releases/tag/v1.0.38">pxc-release</a>
        </td>
    </tr>
    <tr>
        <td>UAA</td>
        <td colspan=2>v77.20.4&#42;</td>
    </tr>
    <tr>
        <td>Velero</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&release=1.22.1&os=&servicePk=&language=EN" target="_blank">1.15.2</a></td>
        <td style="text-align: center;"><a href="https://github.com/vmware-tanzu/velero/releases/tag/v1.15.2" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <th colspan=3><h4>Stemcell Compatibility</h4></th>
    </tr>
    <tr>
        <td>Ubuntu Jammy stemcells</td>
        <td colspan=2>See <strong>Upgrade/Dependency Information</strong> at the top right of the <a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.1&os=&servicePk=&language=EN" target="_blank">TKGi CLI & Tile v1.22</a> download page on Broadcom Support.</td>
    </tr>
    <tr>
        <td>Windows stemcells</td>
        <td colspan=2>v2019.78 or later</td>
    </tr>
    <tr>
        <th colspan=3><h4>Interoperability</h4></th>
    </tr>
    <tr>
        <td>Ops Manager</td>
        <td colspan=2>See <strong>Upgrade/Dependency Information</strong> at the top right of the <a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.1&os=&servicePk=&language=EN" target="_blank">TKGi CLI & Tile v1.22</a> download page on Broadcom Support.</td>
    </tr>
    <tr>
        <td>VMware Aria Operations Management Pack for Kubernetes</td>
        <td>v2.1</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/aria/aria-operations-for-integrations/2-1/vrealize--operations-management-pack--for-pack-for-kubernetes-2-1/vrealize--operations-management-pack--for-kubernetes.html" target="_blank">v2.1 documentation</a></td>
    </tr>
    <tr>
        <td>VMware Cloud Foundation (VCF)</td>
        <td>v5.1.1, v5.1, v4.5.2</td>
        <td style="text-align: center;">Release Notes:
            <a href="https://docs.vmware.com/en/VMware-Cloud-Foundation/5.1.1/rn/vmware-cloud-foundation-511-release-notes/index.html" target="_blank">v5.1.1</a>, <a href="https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-5-2-and-earlier/5-2/vcf-release-notes/vmware-cloud-foundation-521-release-notes.html" target="_blank">v5.1</a>,
            <a href="https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-5-2-and-earlier/5-2/vcf-release-notes/vmware-cloud-foundation-521-release-notes.html" target="_blank">v4.5.2</a>
        </td>
    </tr>
    <tr>
        <td>VMware NSX&#42;&#42;</td>
        <td rowspan=2 colspan=2>See <a href="https://interopmatrix.vmware.com/Interoperability?col=644&row=0," target="_blank">VMware Product Interoperability Matrices</a>&#42;&#42;&#42;.</td>
    </tr>
    <tr>
        <th colspan=3><h4>Management Console (vSphere)</h4></th>
    </tr>
    <tr>
        <td>TKGI Management Console</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&release=1.22.1&os=&servicePk=&language=EN" target="_blank">v1.22.0</a></td><td><p class="note"><strong>Note</strong>: The component versions supported by TKGI Management Console might differ from or be more limited than the versions supported by TKGI.</p></td>
    </tr>
    <tr>
        <td>Installed Ops Manager version</td>
        <td>v3.0.37</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/release-notes.html#3-0-37" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Installed Harbor Registry version</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Harbor%20Registry&displayGroup=VMware%20Harbor%20Registry&release=2.11.0&os=&servicePk=&language=EN" target="_blank">v2.11.0</a></td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/release-notes.html#v2110-0">Release Notes</a></td>
    </tr>
    <tr>
        <td>Ubuntu Jammy stemcell</td>
        <td>v1.803&#42;</td>
        <td style="text-align: center;"><a href="https://github.com/cloudfoundry/bosh-linux-stemcell-builder/releases/tag/ubuntu-jammy%2Fv1.803" target="_blank">Release Notes</a></td>
    </tr>
</table>

&#42; Components marked with an asterisk have been updated.

&#42;&#42; As of May 7, 2024, NSX networking and firewall components are sold separately from TKGI.

&#42;&#42;&#42; Migration from NSX Management Plane API to NSX Policy API requires VMware NSX v4.0.1.1 or later.
NSX v4.0.1.1 supports only 50% of NSX Management Plane API scale.
To use Policy API at 100% of Management Plane API scale, use NSX v4.1.1 or later.

### <a id="1-22-1-upgrade"></a>Upgrade Path

The supported upgrade paths to Tanzu Kubernetes Grid Integrated Edition v1.22.1 are from TKGI v1.22.0 and from v1.21.1 and earlier v1.21 patches.
https://github.com/advisories/GHSA
### <a id="1-22-1-breaking-changes"></a>Breaking Changes

TKGI v1.22.1 does not include any new breaking changes.

### <a id="1-22-1-features"></a>Features and Enhancements

TKGI v1.22.1 does not include any new features.


### <a id="1-22-1-bug-fixes"></a>Resolved Issues

TKGI v1.22.1 resolves the following issue in v1.22.0:

* Downgrades UAA to more stable version [v77.20.4](https://github.com/cloudfoundry/uaa/releases/tag/v77.20.4).

### <a id='1-22-1-security'></a> Security Fixes

The following table lists CVEs that were fixed in each TKGI component since the latest {{{ vars.product_version_prev }}} patch version, as of the release date above.

See [{{{ vars.product_version }}}.1 Security Fixes](cve.hbs.md#1-22-1) for the list of CVEs fixed in this release.

###<a id="1-22-1-known-issues"></a>Known Issues

Except where noted, the known issues in TKGI v1.22.0 are also in TKGI v1.22.1. For more information, see [TKGI v1.22.0 Known Issues](#1-22-0-known-issues) below.

> **Important** For upgrading to TKGI v1.22.1, note the known issue [Upgrade to TKGI v1.22 fails from the TKGI MC v1.21 OVA](#1-22-0-no-upgrade-ova).


TKGI v1.22.1 has the following known issues:

<hr>

#### <a id="TKGI-8321"></a>Upgrading from TKGI Management Console 1.21.1 to 1.22.1 downgrades the BPM and Syslog components

**Symptom**

When upgrading from TKGI Management Console 1.21.1 to 1.22.1, the BPM and Syslog components are downgraded to an older version compared to v1.21.1.

|Component|Version in 1.21.1|Version in 1.22.1|
|---|---|---|
|BPM|1.4.20|1.4.17|
|Syslog|12.3.9|12.3.7|

**Workaround**

 This has been fixed in v1.22.2.

<hr>

## <a id="1-22-0"></a>TKGI {{{ vars.product_version }}}.0

**Release Date**: March 14, 2025

> **Important** TKGI v1.22.0 was retracted and is no longer available on Broadcom Support.

### <a id="1-22-0-snapshot"></a><a id="product-snapshot"></a>Product Snapshot

<table class="nice">
    <tr>
        <th colspan=3><h4>Release Details</h4></th>
    </tr>
    <tr>
        <td>Version</td>
        <td colspan=2><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.0&os=&servicePk=527514&language=EN" target="_blank">v1.22.0</a></td>
    </tr>
    <tr>
        <td>Release date</td>
        <td colspan=2>March 14, 2025</td>
    </tr>
    <tr>
        <th colspan=3><h4>Internal Component Versions</h4></th>
    </tr>
    <tr>
        <td>Antrea</td>
        <td>v1.10.0</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/nsx/container-networking/1-x/release-notes.html" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>cAdvisor</td>
        <td colspan=2>v0.47.2</td>
    </tr>
    <tr>
        <td>Cloud Providers</td>
        <td>AWS: v1.31.5&#42;<br>Azure: v1.31.0&#42;<br>vSphere: v1.31.1&#42;</td>
        <td style="text-align: center;">Release Notes:
          <br><a href="https://github.com/kubernetes/cloud-provider-aws/releases/tag/v1.31.5">AWS</a>
          <br><a href="https://github.com/kubernetes-sigs/cloud-provider-azure/releases/tag/v1.31.0">Azure</a>
          <br><a href="https://github.com/kubernetes/cloud-provider-vsphere/releases/tag/v1.31.1">vSphere</a>
        </td>
    </tr>
    <tr>
        <td>Containerd</td>
        <td colspan=2>Linux: v1.7.23<br>Windows: v1.7.23</td>
    </tr>
    <tr>
        <td>CoreDNS</td>
        <td colspan=2>v1.11.3+vmware.2&#42;</td>
    </tr>
    <tr>
        <td>CSI Driver for vSphere</td>
        <td>v3.3.1</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/container-storage-plugin/3-0/release-notes/vmware-vsphere-container-storage-plugin-30-release-notes.html#vSphere%20Container%20Storage%20Plug-in%203.3.1" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>etcd</td>
        <td colspan=2>v3.5.15</td>
    </tr>
    <tr>
        <td>Harbor</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Harbor%20Registry&displayGroup=VMware%20Harbor%20Registry&release=2.11.0&os=&servicePk=&language=EN" target="_blank">v2.11.0</a></td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/release-notes.html#v2110-0" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Kubernetes</td>
        <td>v1.31.5&#42;</td>
        <td style="text-align: center;"><a href="https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#changelog-since-v1315" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Metrics Server</td>
        <td colspan=2>v0.7.2</td>
    </tr>
    <tr>
        <td>NCP</td>
        <td>v4.2.1.1</td>
        <td style="text-align: center;">
        <a href="https://techdocs.broadcom.com/us/en/vmware-cis/nsx/event-catalog/4-2/release-notes/vmware-nsx-container-plugin-4211-release-notes.html" target="_blank">Release Notes</a>
        </td>
    </tr>
    <tr>
        <td>Percona XtraDB Cluster (PXC)
        <br>(in BOSH&nbsp;pxc-release)</td>
        <td>v8.0.39-30
        <br>pxc-release: v1.0.34</td>
        <td style="text-align: center;">Release Notes:
        <br><a href="https://docs.percona.com/percona-xtradb-cluster/8.0/release-notes/8.0.39-30.html">PXC</a>
        <br><a href="https://github.com/cloudfoundry/pxc-release/releases/tag/v1.0.34">pxc-release</a>
        </td>
    </tr>
    <tr>
        <td>UAA</td>
        <td colspan=2>v77.26.0&#42;</td>
    </tr>
    <tr>
        <td>Velero</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&release=1.22.0&os=&servicePk=527446&language=EN" target="_blank">1.15.2&#42;</a></td>
        <td style="text-align: center;"><a href="https://github.com/vmware-tanzu/velero/releases/tag/v1.15.2" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <th colspan=3><h4>Stemcell Compatibility</h4></th>
    </tr>
    <tr>
        <td>Ubuntu Jammy stemcells</td>
        <td colspan=2>See <strong>Upgrade/Dependency Information</strong> at the top right of the <a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.0&os=&servicePk=527514&language=EN" target="_blank">TKGi CLI & Tile v1.22</a> download page on Broadcom Support.</td>
    </tr>
    <tr>
        <td>Windows stemcells</td>
        <td colspan=2>v2019.78 or later</td>
    </tr>
    <tr>
        <th colspan=3><h4>Interoperability</h4></th>
    </tr>
    <tr>
        <td>Ops Manager</td>
        <td colspan=2>See <strong>Upgrade/Dependency Information</strong> at the top right of the <a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.22.0&os=&servicePk=527514&language=EN" target="_blank">TKGi CLI & Tile v1.22</a> download page on Broadcom Support.</td>
    </tr>
    <tr>
        <td>VMware Aria Operations Management Pack for Kubernetes</td>
        <td>v2.1</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-cis/aria/aria-operations-for-integrations/2-1/vrealize--operations-management-pack--for-pack-for-kubernetes-2-1/vrealize--operations-management-pack--for-kubernetes.html" target="_blank">v2.1 documentation</a></td>
    </tr>
    <tr>
        <td>VMware Cloud Foundation (VCF)</td>
        <td>v5.1.1, v5.1, v4.5.2</td>
        <td style="text-align: center;">Release Notes:
            <a href="https://docs.vmware.com/en/VMware-Cloud-Foundation/5.1.1/rn/vmware-cloud-foundation-511-release-notes/index.html" target="_blank">v5.1.1</a>, <a href="https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-5-2-and-earlier/5-2/vcf-release-notes/vmware-cloud-foundation-521-release-notes.html" target="_blank">v5.1</a>,
            <a href="https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-5-2-and-earlier/5-2/vcf-release-notes/vmware-cloud-foundation-521-release-notes.html" target="_blank">v4.5.2</a>
        </td>
    </tr>
    <tr>
        <td>VMware NSX&#42;&#42;</td>
        <td rowspan=2 colspan=2>See <a href="https://interopmatrix.vmware.com/Interoperability?col=644&row=0," target="_blank">VMware Product Interoperability Matrices</a>&#42;&#42;&#42;.</td>
    </tr>
    <tr>
        <th colspan=3><h4>Management Console (vSphere)</h4></th>
    </tr>
    <tr>
        <td>TKGI Management Console</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&release=1.22.0&os=&servicePk=527446&language=EN" target="_blank">v1.22.0</a></td><td><p class="note"><strong>Note</strong>: The component versions supported by TKGI Management Console might differ from or be more limited than the versions supported by TKGI.</p></td>
    </tr>
    <tr>
        <td>Installed Ops Manager version</td>
        <td>v3.0.37&#42;</td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/release-notes.html#3-0-37" target="_blank">Release Notes</a></td>
    </tr>
    <tr>
        <td>Installed Harbor Registry version</td>
        <td><a href="https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Harbor%20Registry&displayGroup=VMware%20Harbor%20Registry&release=2.11.0&os=&servicePk=&language=EN" target="_blank">v2.11.0</a></td>
        <td style="text-align: center;"><a href="https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/release-notes.html#v2110-0">Release Notes</a></td>
    </tr>
    <tr>
        <td>Ubuntu Jammy stemcell</td>
        <td>v1.775&#42;</td>
        <td style="text-align: center;"><a href="https://github.com/cloudfoundry/bosh-linux-stemcell-builder/releases/tag/ubuntu-jammy%2Fv1.775" target="_blank">Release Notes</a></td>
    </tr>
</table>

&#42; Components marked with an asterisk have been updated.

&#42;&#42; As of May 7, 2024, NSX networking and firewall components are sold separately from TKGI.

&#42;&#42;&#42; Migration from NSX Management Plane API to NSX Policy API requires VMware NSX v4.0.1.1 or later.
NSX v4.0.1.1 supports only 50% of NSX Management Plane API scale.
To use Policy API at 100% of Management Plane API scale, use NSX v4.1.1 or later.

### <a id="1-22-0-upgrade"></a>Upgrade Path

The supported upgrade paths to Tanzu Kubernetes Grid Integrated Edition v1.22.0 is from TKGI v1.21.0.

### <a id="1-22-0-breaking-changes"></a>Breaking Changes

TKGI v1.22.0 has no breaking changes.

### <a id="1-22-0-features"></a>Features and Enhancements

TKGI v1.22.0 has no new features and enhancements.

### <a id="1-22-0-bug-fixes"></a>Resolved Issues

TKGI v1.22.0 resolves the following issues:

* [Management Console does not display cluster information](https://techdocs.broadcom.com/us/en/vmware-tanzu/standalone-components/tanzu-kubernetes-grid-integrated-edition/1-21/tkgi/release-notes.html#1-21-0-no-cluster-info)
* [Pause image not pinned in upgraded clusters](https://techdocs.broadcom.com/us/en/vmware-tanzu/standalone-components/tanzu-kubernetes-grid-integrated-edition/1-21/tkgi/release-notes.html#1-21-0-pause-image-pin)
* Patched `vsphere-cloud-controller-manager` component to address [CVE 2016-2183](https://nvd.nist.gov/vuln/detail/cve-2016-2183)

<hr>

TKGI v1.22.0 also incorporates fixes from previous minor line patch releases, listed in [TKGI 1.21](https://techdocs.broadcom.com/us/en/vmware-tanzu/standalone-components/tanzu-kubernetes-grid-integrated-edition/1-21/tkgi/release-notes.html),
[TKGI 1.20](https://techdocs.broadcom.com/us/en/vmware-tanzu/standalone-components/tanzu-kubernetes-grid-integrated-edition/1-20/tkgi/release-notes.html),
[TKGI 1.19](https://techdocs.broadcom.com/us/en/vmware-tanzu/standalone-components/tanzu-kubernetes-grid-integrated-edition/1-19/tkgi/release-notes.html),
[TKGI 1.18](https://techdocs.broadcom.com/us/en/vmware-tanzu/standalone-components/tanzu-kubernetes-grid-integrated-edition/1-18/tkgi/release-notes.html), and
[TKGI 1.17](https://techdocs.broadcom.com/us/en/vmware-tanzu/standalone-components/tanzu-kubernetes-grid-integrated-edition/1-17/tkgi/release-notes.html) Release Notes.


###<a id="1-22-0-known-issues"></a>Known Issues

TKGI v1.22.x has the following known issues:

<hr>

#### <a id="TKGI-8372"></a>Windows stemcell missing after upgrading TKGI Management Console and components

**Symptom**

Following a successful ugrade of Tanzu Kubernetes Grid Integrated Edition Management Console when using Windows stemcells, the Operations Manager Windows stemcell is missing after the upgrade TKGiMC. Cluster details fail to display in the TKGI Management Console, with the following error:

```
Failed to retrieve current TKGI Instance clusters. cannot get clusters from TKGI: Status: 422 , Body: {"body":"Plan 228fe8fa-8e98-44f1-aaf3-5f931b995840 not found."}
```

**Explanation**

Windows stemcell and Windows plan are inactive.

**Workaround**

Re-enable the windows plan and re-upload the Windows stemcell.

<hr>

#### <a id="1-22-0-wavefront-ns"></a>Manually created Wavefront operator and namespace are deleted during cluster upgrade

**Symptom**

If you install TKGi v1.20+ and disable Wavefront, create a cluster and install the [Wavefront operator](https://github.com/wavefrontHQ/observability-for-kubernetes) manually, then upgrade the cluster, the Wavefront operator and the `observability-system` namespace get deleted.

**Explanation**

This happens because of a `wavefront-proxy-errand`.

**Workaround**

When you install the Wavefront operator, specify a custom namespace rather than the default `observability-system` namespace.

If the Wavefront operator is already installed in the `observability-system` namespace, see [KB 405433](https://knowledge.broadcom.com/external/article/405433) for steps to take to avoid encountering this issue during cluster upgrades.

<hr>

#### <a id="1-22-0-no-upgrade-ova"></a>Upgrade to TKGI v1.22 fails from the TKGI MC v1.21 OVA

**Symptom**

When upgrading to TKGI v1.22 from the TKGI Management Console v1.21.0 deployed from an older OVA that was previously downloadable from Broadcom support and listed as `tkgi-v1.21.0-rev.1-2b213e3f-910768.ova` and `Build Number: 29`, upgrade fails with an error `This upgrade requires that the currently installed version be 1.21.0.pre.build.32 or higher`.

**Explanation**

Upgrading to TKGI v1.22 from the TKGI Management Console v1.21.0 requires the OVA build currently on Broadcom Support, listed as `tkgi-v1.21.0-rev.1-786afb36-963796.ova` and `Build Number: 32`.

**Workaround**

How to work around this issue depends on whether the upgrade to TKGI v1.22 was already started from TKGI Management Console:

* **If the upgrade to TKGI v1.22 was already started** from TKGI Management Console v1.21.0 with `tkgi-v1.21.0-rev.1-2b213e3f-910768.ova` and `Build Number: 29` and you see the error above:

  1. Download the latest TKGI v1.21.0 tile version (`pivotal-container-service-1.21.0-build.32.pivotal`), from [Broadcom Support](https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.21.0&os=&servicePk=527600&language=EN).
  1. From Ops Manager, click **Import a Product** to upload the tile. Click on the **+** sign to add the tile to the Installation Dashboard.
  1. From the TKGI Management Console, click **TKGI Configuration** and then **Edit in Wizard**. The existing configuration details appear.
  1. Leave the configuration details as-is and re-apply without any changes. This should update TKGI v1.21.0 successfully.


* **(Recommended) If you have not yet started the upgrade process to v1.22**, do the following to avoid the issue:

  1. In the TKGI Management Console:

        1. Upgrade to `tkgi-v1.21.0-rev.1-786afb36-963796.ova` on the [TKGI MC v1.21.0 downloads page](https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20Mgmt%20Console&release=1.21.0&os=&servicePk=&language=EN).
        1. Upgrade to `tkgi-v1.22.1-rev.2-ad8c7435-1721891.ova` on the [TKGI MC v1.22.1 downloads page](https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20%28TKGi%29%20-%20Mgmt%20Console&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20%28TKGi%29%20-%20Mgmt%20Console&release=1.22.1&os=&servicePk=&language=EN).

  1. Log in to Ops Manager and check the version and build number listed on the TKGI tile to confirm that it was updated.

<hr>

#### <a id="1-22-0-csi-driver-limits-public-cloud"></a>Limitations on Using a Public Cloud CSI Driver

TKGI supports using a public cloud CSI Driver on a TKGI-provisioned cluster.

<hr>

#### <a id="1-22-0-csi-driver-limits-public-cloud-installing"></a> Installing a Public Cloud CSI Driver on a TKGI Cluster

If you plan to use a public cloud CSI Driver on a TKGI-provisioned cluster,
{{{ vars.recommended_by }}} recommends you take additional steps before installing the CSI Driver:

* For most public clouds, {{{ vars.recommended_by }}} recommends you follow the CSI Driver installation procedure recommended by the public cloud provider.

* For installing the Azure CSI Driver on a TKGI cluster, {{{ vars.recommended_by }}} recommends you follow the procedure in the [How to install Azure file/disk CSI driver onto TKGI 1.14 cluster](https://knowledge.broadcom.com/external/article/298706/) knowledge base article in the VMware Tanzu Support Hub.

<hr>

#### <a id="1-22-0-csi-driver-limits-public-cloud-managing"></a> Managing a TKGI Cluster That Uses a Public Cloud CSI Driver

If you have enabled a public cloud CSI Driver on a TKGI cluster,
you must take additional steps when deleting，upgrading, or updating the cluster:

* [Updating a Cluster on a Public Cloud](#1-22-0-csi-driver-limits-public-cloud-updating)
* [Upgrading a Cluster on a Public Cloud](#1-22-0-csi-driver-limits-public-cloud-upgrading)
* [Deleting a Cluster on a Public Cloud](#1-22-0-csi-driver-limits-public-cloud-deleting)

<hr>

#### <a id="1-22-0-csi-driver-limits-public-cloud-updating"></a> Updating a Cluster on a Public Cloud

When updating a cluster that uses a public cloud CSI Driver:

* No preparation steps are needed when updating a multi-worker node cluster.
* To prepare a single-worker node cluster for updating:

    1. Resize the cluster to two or more worker nodes before updating the cluster.
    For more information, see [Scaling Existing Clusters](scale-clusters.html).
    1. Update the cluster.

<hr>

#### <a id="1-22-0-csi-driver-limits-public-cloud-upgrading"></a> Upgrading a Cluster on a Public Cloud

When upgrading a cluster that uses a public cloud CSI Driver:

* No preparation steps are needed when upgrading a multi-worker node cluster.
* To prepare a single-worker node cluster for upgrading:

    1. Resize the cluster to two or more worker nodes before upgrading the cluster.
    For more information, see [Scaling Existing Clusters](scale-clusters.html).
    1. Upgrade the cluster.
    For  more information on upgrading clusters, see [Upgrading Clusters](upgrade-clusters.html).

<hr>

#### <a id="1-22-0-csi-driver-limits-public-cloud-deleting"></a> Deleting a Cluster on a Public Cloud

When deleting a cluster that uses a public cloud CSI Driver:

1. Manually delete the workload PVCs and PVs before deleting the cluster.
1. Delete the cluster.
For  more information on deleting clusters, see [Deleting Clusters](delete-cluster.html).

<hr>

#### <a id="1-22-0-change-cp-azs"></a> You cannot change multiple control plane AZs at the same time.

You can only change a cluster's control plane AZs, as described in [Using Compute Profiles (vSphere)](compute-profiles-use.html), under both of the following conditions:

- The cluster has at least three control plane nodes.

- You do not change multiple AZs at the same time. Each time you run `tkgi update-cluster --compute-profile ... --enforce-compute-profile-update`, the `cluster_customization.control_plane.az_names` value can only change one AZ name from its previous value.

Failure to meet these conditions can result in `etcd` data loss.

<hr>

#### <a id="1-22-0-containerd-istio"></a> TKGI version upgrade without new stemcell fails for Containerd runtime clusters with Istio CNI

**Symptom**

On clusters configured to use a containerd registry and Istio CNI, upgrading the TKGI version without also upgrading the stemcell fails with errors kubelet `cannot find istio-cni binary` and `nsx fails to recieve message header`.

This error does not occur when you upgrade to a new stemcell along with the new TKGI version.

**Explanation**

When TKGI cluster upgrades and drains the node during upgrade, it leaves the cluster nodes' Istio CNI agent and CNI configuration in a corrupted state.

If the cluster nodes are not automatically re-created by a stemcell change, the corrupted Istio CNI state remains.

**Workaround**

For clusters that use both Containerd and Istio CNI:

* If you have already encountered this issue, re-create all worker nodes using the `bosh recreate` command:

  1. Run the `bosh vms` command to list the cluster VMs:

      ```
      bosh -d service-instance-DEPLOYMENT-ID vms
      ```
      Where `DEPLOYMENT-ID` is the BOSH-generated ID of your Kubernetes cluster deployment.

  1. For each VM instance listed as `worker/UUID` in the output, run `bosh recreate VM-NAME`:

      ```
      bosh -d service-instance-DEPLOYMENT-ID recreate worker/UUID
      ```

* In the future, you can avoid this issue by upgrading a cluster's stemcell whenever you upgrade its TKGI version.

<hr>

#### <a id="1-22-0-profile-fields-antrea"></a> With Antrea, Cannot Fill In Compute Profile Fields

**Symptom**

In a TKGI environment with Antrea networking, when using the management console to create or edit a compute profile as described in [Define Compute Profile](console-compute-profile.html#compute-profile-define), the following form fields do not accept input:

- **Availability Zones**
- **Control plane AZs**
- **Control plane persistent disk size**

This issue does not apply to TKGI environments with NSX networking.

<hr>

#### <a id="1-22-0-tap-labels"></a> NSX pod creation fails when using Tanzu Application Platform

**Symptom**

When you deploy a workload on a TKGI-provisioned cluster with NSX networking that is running [Tanzu Application Platform](https://techdocs.broadcom.com/us/en/vmware-tanzu/standalone-components/tanzu-application-platform/1-12.html) (TAP), you see an error `Failed to create pod sandbox` and no resources are created in the cluster's `nsx-system` namespace.

**Explanation**

The total number of Kubernetes object labels and other tags created by both TKGI and TAP can exceed the number that is allowed by NSX.

**Workaround**

Create or update your network profile as described in [Creating and Managing Network Profiles (NSX Only)](network-profiles-define.md), setting the `cni_configurations` parameter `extensions.ncp.k8s.label_filtering_regex_list` as described under [label_filtering Settings](network-profiles-define.md#label-filtering).

<hr>

#### <a id="1-22-0-renamed-ops-man"></a> TKGI MC Unable to Manage TKGI after Restoring the TKGI Control Plane from Backup

**Symptom**

After you restore Ops Manager and the TKGI API VM from backup,
TKGI functions normally, but your TKGI MC tabs
include the following error: "...product 'pivotal-container service' is not deployed...".

**Explanation**

TKGI MC is associated with an Ops Manager with a specific name.
If you rename Ops Manager with a new name while restoring, your TKGI MC
will not recognize the restored Ops Manager and cannot manage it.

<hr>

#### <a id="1-22-0-vrops-windows-clusters"></a> VMware vRealize Operations Does Not Support Windows Worker-Based Kubernetes Clusters

VMware vRealize Operations (vROPs) does not support Windows worker-based Kubernetes clusters and
cannot be used to manage TKGI-provisioned Windows workers.

<hr>

#### <a id="1-22-0-wavefront-no-win"></a>TKGI Wavefront Requires Manual Installation for Windows Workers

To monitor Windows-based worker node clusters with a Wavefront collector and proxy, you must first install Wavefront on the clusters manually, using Helm.
For instructions, see the [Wavefront](windows-monitoring.html#wavefront) section of the
_Monitoring Windows Worker Clusters and Nodes_ topic.

<hr>

#### <a id="1-22-0-ping"></a>Pinging Windows Worker Kubernetes Clusters Does Not Work

TKGI-provisioned Windows worker-based Kubernetes clusters inherit a Kubernetes limitation that prevents outbound ICMP communication from workers.
As a result, pinging Windows workers does not work.

For information about this limitation, see [Limitations > Networking](https://kubernetes.io/docs/setup/production-environment/windows/intro-windows-in-kubernetes/#networking-1) in the _Windows in Kubernetes_ documentation.

<hr>

#### <a id="1-22-0-no-uaa-backup"></a> BOSH Backup and Restore Does Not Restore UAA Database.

When restoring the TKGI management plane from backup as described in [Restoring TKGI Management Plane Components](bbr-restore-tkgi.html), you may see an error like the following, along with errors for the `bbr-uaadb` and `pks-api` components:

  ```
  ERROR 3780 (HY000) at line 25: Referencing column 'SESSION_PRIMARY_ID' and referenced column 'PRIMARY_ID' in foreign key constraint 'SPRING_SESSION_ATTRIBUTES_FK' are incompatible.
  ```

With these errors, the User Account and Authentication (UAA) database fails to restore.

<hr>

#### <a id="1-22-0-windows-velero-limitations"></a> Velero Does Not Support Backing Up Stateful Windows Workloads

You can use Velero to back up stateless TKGI-provisioned Windows workers only.
You cannot use Velero to back up stateful Windows applications.
For more information, see [Velero on Windows](https://velero.io/docs/v1.6/basic-install/#velero-on-windows) in
_Basic Install_ in the Velero documentation.

<hr>

#### <a id="1-22-0-tmc-restic"></a>TMC Data Protection Feature Requires Privileged TKGI Containers

TMC Data Protection feature supports privileged TKGI containers only.
For more information, see [Plans](installing-vsphere.html#plans) in the _Installing TKGI_ topic for your IaaS.

<hr>

#### <a id="1-22-0-profile-no-win-gmsa"></a>Windows Worker Kubernetes Clusters with Group Managed Service Account Do Not Support Compute Profiles

Windows worker-based Kubernetes clusters integrated with group Managed Service Account (gMSA) cannot be managed using compute profiles.

<hr>

#### <a id="1-22-0-profile-resize-down"></a>TKGI CLI Does Not Prevent Reducing the Control Plane Node Count

TKGI CLI does not prevent accidentally reducing a cluster's control plane node count using a compute profile.

<p class="note warning"><strong>Warning:</strong>
    Reducing a cluster's control plane node count can destroy the cluster.
    Do not scale out or scale in existing control plane nodes by reconfiguring the TKGI tile or by using a compute profile.
    Reducing a cluster's number of control plane nodes might remove a control plane node and cause the cluster to become inactive.
</p>

<hr>

#### <a id="1-22-0-in-windows-notready-nodes"></a> Windows Cluster Nodes Not Deleted After VM Deleted

**Symptom**

After you delete a VM using the management console of your infrastructure provider, you notice a Windows worker node
that had been on that VM is now in a `notReady` state.

**Solution**

1. To identify the leftover node:

    ```
    kubectl get no -o wide
    ```
1. Locate nodes on the returned list that are in a `notReady` state and have the same IP address as another node in the list.
1. To manually delete a `notReady` node:

    ```
    kubectl delete node NODE-NAME
    ```
    Where `NODE-NAME` is the name of the node in the `notReady` state.

<hr>

#### <a id="1-22-0-oidc-response-header"></a>502 Bad Gateway After OIDC Login

**Symptom**

You experience a "502 Bad Gateway" error from the NSX load balancer after you log in to OIDC.

**Explanation**

A large response header has exceeded your NSX load balancer maximum response header size.
The default maximum response header size is 10,240 characters and should be resized to 16,384.

**Workaround**

If you experience this issue, manually reconfigure your NSX `request_header_size` to `4096` characters and your `response_header_size` to `16384`.
For information about configuring NSX default header sizes, see [OIDC Response Header Overflow](https://knowledge.broadcom.com/external/article/297308/) in the Knowledge Base.

<hr>

#### <a id="1-22-0-windows-proxy"></a> Difficulty Changing Proxy for Windows Workers

You must configure a global proxy in the Tanzu Kubernetes Grid Integrated Edition tile > **Networking** pane before you create any Windows workers that use the proxy.

You cannot change the proxy configuration for Windows workers in an existing cluster.

<hr>

#### <a id="1-22-0-http-proxy-password"></a> Character Limitations in HTTP Proxy Password

For vSphere with NSX, the HTTP Proxy password field does not support the following special characters: `&` or `;`.

<hr>

#### <a id="1-22-0-harbor-storage-config"></a> Error After Modifying Your Harbor Storage Configuration

**Symptom**

You receive the following error after modifying your existing Harbor installation's storage configuration:

```
Error response from daemon: manifest for ... not found: manifest unknown: manifest unknown
```

**Explanation**

Harbor does not support modifying an existing Harbor installation's storage configuration.

**Workaround**

To modify your Harbor storage configuration,
re-install Harbor. Before starting Harbor, configure the new Harbor installation with the desired configuration.

<hr>

#### <a id="1-22-0-resizing-worker-nodes"></a> Ingress Controller Statefulset Fails to Start After Resizing Worker Nodes

**Symptom**

Permissions are removed from your cluster's files and processes after resizing the persistent disk
during a cluster upgrade. The ingress controller statefulset fails to start.

**Explanation**

When resizing a persistent disk, Bosh migrates the data from the old disk to the new disk but
does not copy the files' extended attributes.

**Workaround**

To resolve the problem, complete the steps in
[Ingress controller statefulset fails to start after resize of worker nodes with permission denied]
(https://knowledge.broadcom.com/external/article/298618/)
in the Broadcom Support Knowledge Base.

<hr>

#### <a id="1-22-0-security-group"></a>Azure Default Security Group Is Not Automatically Assigned to Cluster VMs

**Symptom**

You experience issues when configuring a load balancer for a multi-control plane node Kubernetes cluster or creating a service of type `LoadBalancer`.
Additionally, in the Azure portal, the **VM** > **Networking** page does not display
any inbound and outbound traffic rules for your cluster VMs.

**Explanation**

As part of configuring the Tanzu Kubernetes Grid Integrated Edition tile for Azure, you enter **Default Security Group** in the **Kubernetes Cloud Provider** pane.
When you create a Kubernetes cluster, Tanzu Kubernetes Grid Integrated Edition automatically assigns this security group to each VM in the cluster.
However, on Azure the automatic assignment might not occur.

As a result, your inbound and outbound traffic rules defined in the security group are not applied to the cluster VMs.

**Workaround**

If you experience this issue, manually assign the default security group to each VM NIC in your cluster.

<hr>

#### <a id="1-22-0-uuid-length"></a> One Plan ID Longer than Other Plan IDs

**Symptom**

One of your plan IDs is one character longer than your other plan IDs.

**Explanation**

In TKGI, each plan has a unique plan ID.
A plan ID is normally a UUID consisting of 32 alphanumeric characters and 4 hyphens.
However, the **Plan 4** ID consists of 33 alphanumeric characters and 4 hyphens.

**Solution**

You can safely configure and use **Plan 4**.
The length of the **Plan 4** ID does not affect the functionality of **Plan 4** clusters.

If you require all plan IDs to have identical length, do not activate or use **Plan 4**.

<hr>

#### <a id="1-22-0-db-down-after-vm-stopped"></a> Database Cluster Stops After a Database Instance is Stopped

**Symptom**

After you stop one instance in a multiple-instance database cluster, the cluster stops,
or communication between the remaining databases times out, and the entire cluster becomes unreachable.

The following might be in your UAA log:

```
WSREP has not yet prepared node for application use
```

**Explanation**

The database cluster is unable to recover automatically because a member is no longer available to reconcile quorum.

<hr>

#### <a id="1-22-0-velero-vsphere-pvs"></a> Velero Back Up Fails for vSphere PVs Attached to Clusters on Kubernetes v1.20 and Later

**Symptom**

Backing up vSphere persistent volumes using Velero fails and your Velero backup log includes the following error:

```
rpc error: code = Unknown desc = Failed during IsObjectBlocked check: Could not translate selfLink to CRD name
```

**Explanation**

This is a known issue when backing up clusters on Kubernetes v1.20 and later using the
Velero Plugin for vSphere v1.1.0 or earlier.

**Workaround**

To resolve the problem, complete the steps in
[Velero backups of vSphere persistent volumes fail on Kubernetes clusters version 1.20 or higher (83314)](https://knowledge.broadcom.com/external/article?legacyId=83314)
in the Broadcom Support Knowledge Base.

<hr>

#### <a id="1-22-0-creating-two-windows-clusters-fails"></a> Creating Two Windows Clusters at the Same Time Fails

**Symptom**

The first time that you try to create two Windows clusters at the same time, the creation of one of
the clusters fails. If you run `pks cluster CLUSTER-NAME` to examine the last action taken on the
cluster, you see the following:

<pre class="terminal">
Last Action: Create
Last Action State: failed
Last Action Description: Instance provisioning failed: There was a problem completing your request.
. . .
operation: create, error-message: Failed to acquire lock
. . .
locking task id is 111, description: 'create deployment'
</pre>

**Explanation**

This is a known issue that occurs the first time that you create two Windows clusters concurrently.

**Workaround**

Recreate the failed cluster. This issue only occurs the first time that you create two Windows
clusters concurrently.


<hr>

#### <a id="1-22-0-delete-cluster-not-stopped"></a> Deleted Clusters are Listed in Cluster Lists

**Symptom**

After running `tkgi delete-cluster` and cluster deletion has completed,
the deleted cluster continues to be listed when running `tkgi clusters`.

**Workaround**

You must manually remove the deleted cluster using a customized version of the ncp_cleanup script.
For more information, see
[Deleting a Tanzu Kubernetes Grid Integrated Edition cluster with "tkgi delete-cluster" stuck "in progress" status](https://knowledge.broadcom.com/external/article/298683/)
in the Broadcom Support Knowledge Base.

<hr>

#### <a id="1-22-0-errors-after-reinstall"></a> BOSH Director Logs the Error 'Duplicate vm extension name'

**Symptom**

After you uninstall TKGI, then reinstall TKGI in the same environment,
BOSH Director logs errors similar to the following:

```
.../gems/bosh-director-0.0.0/lib/bosh/director/deployment_plan/cloud_manifest_parser.rb:120:in `parse_vm_extensions': Duplicate vm extension name 'disk_enable_uuid' (Bosh::Director::DeploymentDuplicateVmExtensionName)
```

**Explanation**

The `pivotal-container-service` cloud-config was not removed when you uninstalled the TKGI tile,
and it remained active.
When you reinstalled the TKGI tile, an additional `pivotal-container-service` cloud-config was created,
causing the metrics_server to fall into a crash-loop state.

**Workaround**

You must manually remove the `pivotal-container-service` cloud-config after removing your TKGI deployment,
including after removing the TKGI tile from Ops Manager.

For more information, see ["Duplicate vm extension name" error when metrics_server runs on Director VM in Tanzu Kubernetes Grid Integrated Edition](https://knowledge.broadcom.com/external/article/298692/)
in the VMware Tanzu Community Knowledge Base.

<hr>

#### <a id="1-22-0-whitespace-pksapi"></a> The TKGI API FQDN Must Not Include Trailing Whitespace

**Symptom**

Your TKGI logs include the following error:

```
'uaa'. Errors are:- Error filling in template 'uaa.yml.erb' (line 59: Client redirect-uri is invalid: uaa.clients.pks_cli.redirect-uri Client redirect-uri is invalid: uaa.clients.pks_cluster_client.redirect-uri)
```

**Explanation**

The TKGI API fully-qualified domain name (FQDN) for your cluster contains leading or trailing whitespace.

**Workaround**

Do not include whitespace in the TKGI tile **API Hostname (FQDN)** field.

<hr>

#### <a id="1-22-0-cannot-backup-with-tmc"></a> TMC Cluster Data Protection Backup Fails After Upgrading TKGI

The TMC Cluster Data Protection Backup fails in TKGI environments upgraded from an earlier version.

**Symptom**

The TMC Cluster Data Protection Backup fails to back up your existing clusters and logs the following error:

```
error executing custom action (groupResource=customresourcedefinitions.apiextensions.k8s.io, namespace=, name=ncpconfigs.nsx.vmware.com): rpc error: code = Unknown desc = error fetching v1beta1 version of ncpconfigs.nsx.vmware.com: the server could not find the requested resource
```

**Explanation**

Kubernetes v1.22 disallows the `spec.preserveUnknownFields: true` configuration in your existing clusters and the creation of a v1 CustomResourceDefinitions configuration fails.

<hr>

#### <a id="1-22-0-cannot-restore-with-tmc"></a> TMC Cluster Data Protection Restore Fails When Using Antrea CNI

The TMC Cluster Data Protection Restore operation can fail when restoring multiple Antea resources.

**Symptom**

The TMC Cluster Data Protection Restore fails and logs errors that requests to restore the `admission webhook` have been denied.

**Explanation**

Velero has encountered a race condition while operating a resource.
For more information, see
[Allow customizing restore order for Kubernetes controllers and their managed resources](https://github.com/vmware-tanzu/velero/issues/4045)
in the Velero GitHub repository.

<hr>

#### <a id="1-22-0-cvds-with-nvds"></a> TKGI Does Not Support CVDS / NVDS Mixed Environments

TKGI does not support environments where there are multiple matching networks, such as a mixed CVDS/NVDS environment.

**Symptom**

TKGI logs errors similar to the following in an environment with multiple matching networks:

```
LastOperationstatus='failed', description='Instance provisioning failed:
There was a problem completing your request. Please contact your operations team providing the following information:
service: p.pks, service-instance-guid: ..., broker-request-id: ..., task-id: ..., operation: create,
error-message: Unknown CPI error 'Unknown' with message 'undefined method `mob' for <VimSdk::Vim::OpaqueNetwork:' in create_vm' CPI method
```

**Explanation**

TKGI cannot identify which of the matching networks you intend to use and has selected the wrong network.

<hr>

#### <a id="1-22-0-ovsdb-server-failure"></a> Occasionally update-cluster Does Not Complete for Windows Workers

Occasionally, `tkgi update-cluster` hangs while updating a Windows worker node instance and the BOSH task cannot finish and exits.

**Symptom**

The `ovsdb-server` service has stopped but other processes report that it is running.

**Explanation**

The `ovsdb-server.pid` file uses the pid for a process that is not the ovsdb-server.

To confirm that this is the root cause for `tkgi update-cluster` to hang:

* To verify the `ovsdb-server` service has actually stopped, run the PowerShell `Get-services` command on the Windows worker node.
* To verify that other processes report the `ovsdb-server` service is still running:

    1. Review the ovsdb-server `job-service-wrapper.err.log` log file.

        The `job-service-wrapper.err.log` log file is located at:

        ```
        C:\var\vcap\sys\log\openvswitch-windows\ovsdb-server\job-service-wrapper.err.log
        ```
    1. Confirm that after the flushing processes, the log includes an error similar to the following:

        ```
        Pid-Guard : ovsdb-server is already runing, please stop it first
        At C:\var\vcap\jobs\openvswitch-windows\bin\ovsdb-server_ctl.ps1:30 char:5
        +     Pid-Guard $PIDFILE "ovsdb-server"
        +     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            + CategoryInfo          : NotSpecified: ( [Write-Error], WriteErrorException
            + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,Pid-Guard
        ```
* To verify the root cause:
    1. Run the following PowerShell commands on the Windows worker node:

        ```
        $RUN_DIR = "C:\var\vcap\sys\run\openvswitch-windows"
        $PIDFILE = "$RUN_DIR\ovsdb-server.pid"
        $pid1 = Get-Content $PidFile -First 1
        echo $pid1
        $rst = Get-Process -Id $pid1 -ErrorAction SilentlyContinue
        echo $rst
        ```
    1. Confirm the returned `ProcessName` is not `ovsdb-server`.

**Workaround**

To resolve this issue for a single Windows worker:

1. SSH to the affected worker node.
1. Run the following:

    ```
    rm C:\var\vcap\sys\run\openvswitch-windows\ovsdb-server.pid
    ```
1. Wait for the `ovsdb-server` process to start.
1. Confirm the dependent services also start.


<hr>

#### <a id="1-22-0-harbor-241"></a> Harbor Private Projects Are Inaccessible after Upgrading to TKGI v1.13.0

If LDAP is enabled, Harbor private projects are inaccessible after upgrading to TKGI v1.13.0.
For more information, see [Private projects become inaccessible after upgrading Harbor for TKGI to v2.4.x with LDAP feature enabled](https://knowledge.broadcom.com/external/article/298714/)
in the Broadcom Support Knowledge Base.

<hr>

#### <a id="1-22-0-stemcell-tar-support"></a> Deployments Fail on TKGI Windows Worker-based Kubernetes Clusters after the January 2022 Microsoft Windows Security Patch

Microsoft changed Microsoft Windows' support for tar file commands in the January 2022 Microsoft Windows security patch.

Packaging scripts that use tar commands for Windows worker-based Kubernetes Cluster deployments
can fail after the Microsoft tar command patch update has been applied.

The BOSH agent used by vSphere stemcells built by stembuild v2019.43 and earlier use tar commands that are no longer supported
and will fail if the Microsoft Windows security patch has been applied.


**Workaround**

stembuild v2019.44 and later include a version of the BOSH agent that does not use unsupported tar commands.

If you use vSphere stemcells, use stembuild 2019.44 or later to avoid the BOSH agent tar error.

<hr>

#### <a id="1-22-0-nsx-upgrade-w-policy-resources"></a> TKGI Clusters Fail after NSX Upgrade If They Use NSGroup Policy API Resources

TKGI supports clusters that use NSGroup Policy API resources, but Policy API NSGroups created in one NSX version will be empty after upgrading NSX to a newer version.

**Workaround**

BOSH reconfigures a deployment's NSGroup members if the deployment is redeployed.

After upgrading NSX, redeploy affected deployments to reconfigure their NSGroup members:

1. Re-**Apply Changes** on the Ops Manager UI to redeploy TKGI tile deployments.
1. Re-deploy the affected cluster deployments.

<hr>

#### <a id="1-22-0-pods-notready-from-dfw"></a> Pods on NSX v3.2.3 Can Enter a NotReady State

When TKGI is deployed on NSX v3.2.3 and there are large numbers of pods with [liveness probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-liveness-command), the pods on TKGI-provisioned clusters can enter a `NotReady` state.

**Symptom**

In addition to your pods being `NotReady`, if you restart NSX Manager:

* Your NSX API logs include numerous repetitions of
`"POST /nsxapi/api/v1/firewall/sections/.../rules?operation=insert_bottom HTTP/1.1" ...`.
* Your NCP logs include errors similar to:

    ```
    "nsx-container-ncp" subcomp="ncp" level="ERROR" security="True" errorCode="NCP00034"] nsx_ujo.ncp.nsx.manager.firewall_service Failed to create health check rule for port ...: Service cluster: 'https://nsx-manager.example.com' is unavailable. Please, check NSX setup and/or configuration.
    ```

**Description**

As pods are created or deleted, DFW firewall rules are replicated for the pod's liveness probe.
In NSX v3.2.3, the firewall rules are unintentionally duplicated during this replication.
After numerous pod creation/deletion events,
the compounded duplication creates a DFW firewall section large enough to create noticeable delays during pod operations and, eventually, a pod `NotReady` state.

**Workaround**

Upgrade NSX to a version that includes the fix, namely 3.2.4 or 4.1.1 or later.


