---
title: Migrating from NSX Management Plane API to Policy API - Overview

---

This topic provides an overview of migrating {{  vars.product_full }} ({{ vars.product_short }}) from the NSX Management Plane API to NSX Policy API (MP2P).

* [Overview](#overview)
  * [MP2P Workflow](#workflow)
  * [NSX Management Plane API to NSX Policy API Migration Features](#features)
* [TKGI MP2P Migration Configurations](#features-configs)
  * [Supported Configurations](#features-supported-configs)
  * [Unsupported Configurations](#features-unsupported-configs)
* [TKGI MP2P Migration Operational Limitations](#concerns-limitations)
  * [Before MP2P Migration](#before)
  * [During MP2P Migration](#during)
  * [DFW Migration](#dfw)
  * [GFW Migration](#gfw)
  * [During Cluster Promotion to NSX Policy API](#nsx-api)

To migrate TKGI from NSX Management Plane API to NSX Policy API using the TKGI Management Console, see [Migrating from NSX Management Plane API to Policy API with the Management Console](mp2p-migration-mc.html).

To migrate TKGI from NSX Management Plane API to NSX Policy API using the TKGI tile in {{ vars.platform_name }}, see [Migrating from NSX Management Plane API to Policy API Using {{ vars.platform_name }}](mp2p-migration.html).

## <a id="overview"></a> Overview

The NSX Management Plane API has been deprecated.
{{{ vars.recommended_by }}} recommends that you instead use the NSX Policy API.
For more information about the deprecation of the NSX Management Plane API, see
[Deprecation announcement for NSX Manager APIs and NSX Advanced UIs](https://techdocs.broadcom.com/us/en/vmware-cis/nsx/vmware-nsx/3-2/release-notes/vmware-nsxt-data-center-32-release-notes.html#feature--api-deprecations-and-behavior-changes-deprecation-announcement-for-nsx-manager-apis-and-nsx-advanced-uis)
in _VMware NSX-T Data Center 3.2 Release Notes_.


The NSX Management Plane API to NSX Policy API (MP2P) Migration feature
switches TKGI environments using the NSX Management Plane API to the NSX Policy API.

<p class="note"><strong>Note:</strong>
TKGI supports NSX Management Plane API to NSX Policy API Migration only.
You cannot return TKGI to the NSX Management Plane API
after starting TKGI MP2P Migration.
</p>


### <a id="workflow"></a> MP2P Workflow

MP2P migration procedures for TKGI follow a Prepare -> Migrate -> Clean Up workflow:

<table>
    <tr>
        <th></th>
        <th>Procedure</th>
        <th>Description</th>
        <th>Outcomes</th>
    </tr>
    <tr>
        <th rowspan=3>Prepare</th>
        <td><strong>Enable Migration</strong></td>
        <td>Configure your environment for MP2P Migration in
            TKGI, NSX, and BOSH.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><strong>Re-Create Top DFW Firewall Rules</strong></td>
        <td>Re-create your high-priority user-defined DFW rules.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><strong>Activate Policy API in TKGI</strong></td>
        <td>To create and configure NSX Policy API objects:
            <ul>
                <li>Create and promote a single test cluster.</li>
                <li>Configure TKGI with Policy.</li>
            </ul>
        </td>
        <td>Migrates shared resources, including Tier-0, FIP block, Pod IP block, and Node IP block to NSX Policy API.
            <br><br>Newly created clusters will use NSX Policy API.</td>
    </tr>
    <tr>
        <th colspan=4>&nbsp;</th>
    </tr>
    <tr>
        <th rowspan=3>Migrate</th>
        <td><strong>Migrate a Cluster</strong></td>
        <td>Steps:
            <ul>
                <li>Back up your cluster's critical workloads.</li>
                <li>Promote the cluster.</li>
                <li>Verify the migration of the cluster.</li>
            </ul>
        </td>
        <td>
            Use <code>tkgi promote-cluster-to-policy</code> to promote the cluster.
        </td>
    </tr>
    <tr>
        <td><strong>Migrate All Production Clusters</strong></td>
        <td>Repeat the <strong>Migrate a Cluster</strong> procedure above for each production cluster.</td>
        <td>Notes:
            <ul>
                <li>Only promote clusters one at a time.</li>
                <li>Always verify the migration of your cluster before migrating another cluster.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td><strong>Re-Create Bottom DFW Firewall Rules</strong></td>
        <td>Steps:
            <ul>
                <li>Re-create your low-priority user-defined DFW rules.</li>
                <li>Remove original Management Plane section user-defined DFW rules.</li>
            </ul>
        </td>
        <td></td>
    </tr>
    <tr>
        <th colspan=4>&nbsp;</th>
    </tr>
    <tr>
        <th rowspan=4>Clean&nbsp;Up</th>
        <td><strong>Remove NSX Management Plane API-related configurations</strong></td>
        <td>Clean up:
            <ul>
                <li>Clean up Network Profiles.</li>
            </ul>
        </td>
        <td></td>
    </tr>
    <tr>
        <td><strong>Promote Remaining NSX Objects</strong></td>
        <td>
            Use the NSX Promoter to convert the NSX Objects that are configured outside of TKGI.
        </td>
        <td>Notes:
            <ul>
                <li>The NSX Promoter updates all objects in the environment to NSX Policy API.</li>
                <li>Use to promote the Deployment Router, and IP blocks, etc.</li>
                <li>Use with caution if TKGI shares NSX with other products.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td><strong>Migrate BOSH to NSX Policy API mode</strong></td>
        <td>Deactivate BOSH migration mode to support NSX Policy API clusters only.</td>
        <td></td>
    </tr>
    <tr>
        <td><strong>Verification</strong></td>
        <td>Verify the MP2P Migration.</td>
        <td></td>
    </tr>
</table>


### <a id="features"></a> NSX Management Plane API to NSX Policy API Migration Features

TKGI NSX Management Plane API to NSX Policy API Migration provides
the following advantages over manual migration:

* Supports TKGI MP2P Migration in most environments.

* Reduces a complex manual workflow to a few procedures:

    * Automates most NSX Manager and TKGI configuration steps.
    * Migrates cluster NSX resources to NSX Policy API objects without disrupting NSX data path.
    * Migrates all cluster deployment NSX resources to Policy IDs,
    including Network Profile configurations and BOSH deployment properties.

* Reduces the impact on the workloads in your environment:

    * By promoting clusters to NSX Policy API one by one,
    the MP2P Migration procedure affects only the cluster being promoted.
    Other clusters continue to operate as usual.

* Supports migrating common topologies.


For more information, see:

* [TKGI MP2P Migration Configurations](#features-configs)
* [TKGI MP2P Migration Operational Limitations](#concerns-limitations)


## <a id="features-configs"></a> TKGI MP2P Migration Configurations

Before initiating TKGI MP2P, consider the following supported and unsupported configurations:

* [Supported Configurations](#features-supported-configs)
* [Unsupported Configurations](#concerns-unsupported)

### <a id="features-supported-configs"></a> Supported Configurations

TKGI MP2P Migration supports migrating TKGI in only NSX environments dedicated to TKGI.
Do not start TKGI MP2P Migration if TKGI shares your NSX environment
with other products, for example, {{ vars.app_runtime }} or VMware Aria Automation.

TKGI MP2P Migration supports the following topologies:

* All deployment topologies defined in [NSX Deployment Topologies for TKGI](nsxt-topologies.html)
except vSAN Stretched Cluster topology.
* All Tier-1 Router topologies defined in [Shared and Dedicated Tier-1 Router Topologies](network-profiles-shared-t1.html).
* All Multi-Tier-0 topologies defined in [Isolating Tenants](nsxt-multi-t0.html).


Contact VMware Support before initiating MP2P Migration
if your TKGI environment uses a customized topology
or is a multi-foundation deployment of TKGI.


### <a id="features-unsupported-configs"></a> Unsupported Configurations

The following are not supported by TKGI MP2P Migration or TKGI using the NSX Policy API:

* Do not start TKGI MP2P Migration if TKGI shares your NSX environment with other products, for example, {{ vars.app_runtime }} or VMware Aria Automation.

* TKGI MP2P Migration does not support
clusters configured with NSGroups, including [Bootstrap Security Group](network-profiles-ns-groups.html)
and [BOSH VM Extensions](bosh-vm-extensions.html) NSGroup configurations.

* The TKGI Management Console can not be used to manage TKGI
after TKGI MP2P Migration.




## <a id="concerns-limitations"></a> TKGI MP2P Migration Operational Limitations

Review the following and resolve concerns before initiating TKGI MP2P Migration:

* [Before MP2P Migration](#before)
* [During MP2P Migration](#during)
* [During Cluster Promotion to NSX Policy API](#nsx-api)

<p class="note"><strong>Note:</strong>
To reduce the possibility of unexpected issues,
{{{ vars.recommended_by }}} recommends that you minimize the duration of your MP2P Migration mix-mode maintenance window
by promoting all clusters as soon as possible.
</p>

### <a id="before"></a> Before MP2P Migration

Consider the following before initiating TKGI MP2P Migration:

* Evaluate the complexity of your TKGI environment.
PSO assistance might be required to migrate some complex environments.
* You cannot rotate cluster certificates during TKGI MP2P Migration.
Verify your cluster cluster certificates, including the NSX certificate, are valid for the entire duration of your TKGI MP2P Migration before starting MP2P Migration.
* When planning your TKGI MP2P Migration, include redefining firewall rules in your cluster promotion procedure:
  - **Distributed Firewall (DFW)**: See [Dealing with DFW Sections Created by NSX Admin](https://techdocs.broadcom.com/us/en/vmware-cis/nsx/event-catalog/3-1/nsx-container-plugin-for-kubernetes-and-tanzu-application-service/migrating-ncp-clusters-and-foundations-to-policy/dealing-with-dfw-sections-created-by-nsx-admin-new.html) in the VMware NSX Container Plugin documentation.
  - **Gateway Firewall (GFW)**: Review firewall rules or set T0 rules to `BYPASS` as described in [Migrating NCP Clusters and {{ vars.app_runtime }} Foundations to Policy](https://techdocs.broadcom.com/de/de/vmware-cis/nsx/event-catalog/4-2/nsx-container-plugin-for-kubernetes-and-tanzu-application-service/migrating-ncp-clusters-and-foundations-to-policy.html)  in the VMware NSX Container Plugin documentation.

### <a id="during"></a> During MP2P Migration

During your MP2P Migration mixed-mode maintenance window:

* You cannot roll back your TKGI environment to the NSX Management Plane API.
* Migrate clusters serially. Do not attempt to migrate multiple clusters in parallel.
    NSX does not support multiple simultaneous MP2P Migration requests.

{{{ vars.recommended_by }}} recommends that you migrate your entire TKGI environment to NSX Policy API as quickly as possible
to avoid the extra complexity of an NSX Management Plane/Policy API mixed-mode environment.


<p class="note warning"><strong>Warning:</strong>
Limit upgrading NSX and TKGI to only resolving critical issues while your environment is in MP2P Migration mixed-mode.
</p>


#### <a id="dfw"></a> DFW Migration

Policy API supports new firewall sections.
The new firewall sections have a higher priority than existing Management Plane-based firewall rules,
including existing top firewall rules.

The DFW migration procedure described in [Migrating from NSX Management Plane API to Policy API](mp2p-migration.html)
documents the recommended two-step MP2P firewall migration procedure for typical DFW firewall configurations:

* Re-create the top firewall rules before promoting clusters.
* Re-create the bottom firewall rules immediately after promoting clusters.

Adhering to the recommended DFW migration sequence is critical to maintaining security and cluster workload network connectivity.
If a TKGI cluster is:

* Promoted before existing Management Plane API top firewall rules
have been recreated in the Policy API section: Cluster network policies will be enforced before the top firewall rules.
* Promoted after existing Management Plane API bottom firewall rules
have been recreated in the Policy API section: The top firewall rules will be enforced before Kubernetes network policies and might override them.

An example result of failing to migrate DFW rules correctly is clusters with access to CIDRs that had been intended to be globally blocked.

<p class="note warning"><strong>Warning</strong>:
If you do not configure your DFW Rules correctly, cluster workloads will lose network connectivity.
</p>


For information about migrating DFW rules for specific edge case configurations, see
[Dealing with DFW Sections Created by NSX Admin](https://techdocs.broadcom.com/us/en/vmware-cis/nsx/event-catalog/3-1/nsx-container-plugin-for-kubernetes-and-tanzu-application-service/migrating-ncp-clusters-and-foundations-to-policy/dealing-with-dfw-sections-created-by-nsx-admin-new.html)
in the VMware NSX Container Plugin documentation.

#### <a id="gfw"></a> GFW Migration

After migrating to Policy API, if you have a gateway firewall (GFW) enabled on T0 and are using a dedicated T1 cluster, review the GFW rules to ensure that traffic from containers is not blocked.

If traffic is blocked, do one of the following:

* Edit the T0 GFW rules to allow traffic from containers.
* Create and apply a network profile that configures NCP with a `BYPASS` setting, for example:

    ```
    {
        "name":"np-cust-b",
        "description":"Network Profile for Customer A",
        "parameters":{
            "cni_configurations":{
                "type":"nsxt",
                "parameters":{
                    "extensions":{
                        "ncp":{
                            "nsx_v3":{
                                "natfirewallmatch":"BYPASS"
                            }
                        }
                    }
                }
            }
        }
    }
    ```

### <a id="nsx-api"></a> During Cluster Promotion to NSX Policy API

Promoting a cluster to NSX Policy API migrates the cluster's NSX resources and updates the cluster.
Promote your clusters to the NSX Policy API serially only while the MP2P Migration mixed-mode maintenance window is active.
If a cluster promotion fails, the only affected cluster is the one being promoted.

While promoting a cluster to NSX Policy API:

* Do not manage the cluster.
* Do not update or delete any of the cluster's existing workloads.
* Do not create new workloads on the cluster.

Workloads run as usual while promoting the cluster.

Clusters that are not actively being promoted:

* Can be managed as usual.
* Workloads on these clusters continue to run as usual and can be managed as usual.

The amount of time it takes to promote a cluster depends on
the scale of resources NSX needs to migrate the cluster, and the time it takes to update the cluster.
