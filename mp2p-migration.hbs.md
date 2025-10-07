---
title: Migrating from NSX Management Plane API to Policy API Using {{ vars.platform_name }}

---

This topic describes how to migrate {{  vars.product_full }} ({{ vars.product_short }}) from NSX Management Plane API to NSX Policy API (MP2P) using the TKGI tile in {{ vars.platform_name }}.

* [Overview](#overview)
  * [Prerequisites](#prerequisites)
* [Prepare for MP2P Migration](#migration-prep)
  * [Enable Migration](#migration-prep-enable)
  * [Migrate DFW Top Firewall Rules](#migration-prep-top-firewall)
  * [Activate NSX Policy API in TKGI](#migration-prep-create-api-objects)
  * [Configure the Environment for NSX Policy API](#migration-steps-configure-opsman)
* [Migrate TKGI Clusters from the NSX Management Plane API to NSX Policy API](#migration-steps)
  * [Migrate a TKGI Cluster to NSX Policy API](#migration-steps-cluster)
  * [Migrate DFW Bottom Firewall Rules](#migration-steps-bottom-firewall)
* [Post-Migration Cleanup](#migration-cleanup)

To migrate TKGI from NSX Management Plane API to NSX Policy API using the TKGI Management Console, see [Migrating from NSX Management Plane API to Policy API with the Management Console](mp2p-migration-mc.html).

For an overview of NSX Management Plane API to NSX Policy API Migration, see [Migrating from NSX Management Plane API to Policy API - Overview](mp2p-migration-concepts.html).

## <a id="overview"></a> Overview

The NSX Management Plane API to NSX Policy API (MP2P) Migration feature switches environments using the NSX Management Plane API TKGI to the NSX Policy API.

MP2P migration procedures for TKGI follow the Prepare -> Migrate -> Clean Up workflow described in [MP2P Workflow](#mp2p-migration-concepts.html#workflow).

To complete an MP2P Migration in your TKGI environment using {{ vars.platform_name }}:

1. Before migrating your TKGI environment to NSX Policy API, review the warnings and considerations in
[Migrating from NSX Management Plane API to Policy API - Overview](mp2p-migration-concepts.html).
1. Confirm your environment meets the [Prerequisites](#prerequisites).
1. [Prepare for MP2P Migration](#migration-prep).
1. [Migrate TKGI Clusters from the NSX Management Plane API to NSX Policy API](#migration-steps).
1. [Post-Migration Cleanup](#migration-cleanup).


<p class="note warning"><strong>Warning:</strong>
Limit upgrading NSX and TKGI to only resolving critical issues while your environment is in MP2P Migration mixed-mode.
</p>

### <a id="prerequisites"></a> Prerequisites

Before migrating TKGI from NSX Management Plane API to NSX Policy API,
verify your TKGI environment meets the following requirements:

* TKGI Version Requirements:
    * TKGI Tile and CLI: {{{ vars.product_version }}}.0 or later.
    * TKGI clusters: {{{ vars.product_version }}}.0 or later.

* Environment Version Requirements:
    * NSX:
        * NSX v4.0.1.1 or later.
        * NSX environment is a dedicated, single TKGI foundation environment.
        For example, an environment with one TKGI foundation and without VMware {{ vars.app_runtime }} or other installations in production.
    * {{ vars.platform_name }}:
        * {{ vars.platform_name }} {{{ vars.ops_man_version_v3 }}} or later.
        * {{ vars.platform_name }} CLI on the latest version.

* Cluster Requirements:

    * TKGI MP2P Migration does not support clusters configured with:

        * NSGroups, including [Bootstrap Security Group](network-profiles-ns-groups.html)
        and [BOSH VM Extensions](bosh-vm-extensions.html) NSGroup configurations.
        * The `ncp.nsx_v3.k8s_np_use_ip_sets` Network Profile parameter set to `false`.
        Before migrating a cluster, you must restore the parameter to `true`, the default value  for NSX Management Plane API.
        For more information, see [Migrate a TKGI Cluster to NSX Policy API](#migration-steps-cluster) below.
        * NSX Policy API Mode resources, such as the `default-balanced-client-ssl-profile`, `default-high-compatibility-client-ssl-profile` or `default-high-security-client-ssl-profile` default ssl profiles.
        MP2P Migration supports only clusters that reference only NSX Management Plane API resources.

* Other Requirements:

    * Administrator access to NSX, {{ vars.platform_name }}, BOSH, and TKGI.
    * For more information about TKGI MP2P Migration limitations, see
    [TKGI MP2P Migration Configurations](mp2p-migration-concepts.html#features-configs) and
    [TKGI MP2P Migration Operational Limitations](mp2p-migration-concepts.html#concerns-limitations)
    in _Migrating from NSX Management Plane API to Policy API - Overview_.


## <a id="migration-prep"></a> Prepare for MP2P Migration

To prepare your TKGI environment for MP2P Migration:

* [Enable Migration](#migration-prep-enable)
* [Migrate DFW Top Firewall Rules](#migration-prep-top-firewall)
* [Activate NSX Policy API in TKGI](#migration-prep-create-api-objects)
* [Configure the Environment for NSX Policy API](#migration-steps-configure-opsman)

### <a id="migration-prep-enable"></a> Enable Migration

You must enable support for MP2P Migration in NSX before promoting clusters to NSX Policy API.
Additionally, {{ vars.platform_name }} and BOSH must be configured to support a mixed environment of NSX Management Plane API and NSX Policy API clusters
before promoting clusters.

<p class="note"><strong>Note</strong>: After activating NSX Policy API,
    existing NSX backups created while using NSX Management Plane API cannot be used to restore your environment or your clusters.
</p>

<br>
To prepare TKGI for MP2P Migration:

1. Disable the TKGI Upgrade All Clusters errand.


<br>
To prepare NSX for MP2P Migration:

1. If your NSX Manager cluster is configured with VIP, configure the Source IP Persistence Profile for LB or
use a Source IP LB algorithm during TKGI foundation migration.
Make all migration requests on a single NSX Manager.


<br>
To prepare {{ vars.platform_name }} and BOSH for MP2P Migration:

* If you are using {{ vars.platform_name }} v3.0.0 or later:

    1. Open your {{ vars.platform_name }} BOSH Director for vSphere tile to the **vCenter Config** pane.

    1. Activate **Use NSX Policy API Migration Mode**.

        <p class="note"><strong>Note</strong>:
        Do not activate <strong>Use NSX Policy API</strong> at this time.
        </p>

    1. Click **Save**.

    1. On the {{ vars.platform_name }} **Installation Dashboard**, select **Review Pending Changes**, review the changes, and select **Apply Changes**.

* If you are using {{ vars.platform_name }} v2.10.45 or later:

    1. Download [bosh_migration_mode.sh](https://github.com/pivotal-cf/docs-pks/blob/{{{ vars.product_version_raw }}}/cli/bosh_migration_mode.sh),
    the BOSH Migration Mode script, from the {{  vars.product_full }} documentation GitHub repository.

    1. Select a virtual machine that is able to reach {{ vars.platform_name }},
    and can run the [{{ vars.platform_name }} CLI](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/2-10/tanzu-ops-manager/install-cli.html), [BOSH CLI](https://bosh.io/docs/cli-v2-install), and [yq CLI](https://github.com/mikefarah/yq).

    1. Copy the the BOSH Migration Mode script to the virtual machine.

    1. Export the `BOSH_CLIENT`, `BOSH_CLIENT_SECRET`, `BOSH_ENVIRONMENT`, and `BOSH_CA_CERT`
    environment variables. For more information, see
    [Set the BOSH Environment Variables on the {{ vars.platform_name }} VM](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/2-10/tanzu-ops-manager/install-trouble-advanced.html#export-bosh-envs)
    in _Advanced Troubleshooting with the BOSH CLI_.

        For example:

        ```console
        export BOSH_CLIENT=ops_manager  BOSH_CLIENT_SECRET=FHoiRmt3qq1LfbPncF4vAyxZWUSpqbZ-  BOSH_ENVIRONMENT=88.0.0.3 bosh  BOSH_CA_CERT=/var/tempest/workspaces/default/root_ca_certificate
        ```

    1. To activate BOSH Migration Mode run the BOSH Migration Mode script:

        ```
        ./bosh_migration_mode enable OPSMAN-IP USERNAME PASSWORD
        ```

        Where:

        * `OPSMAN-IP` is the IP address for the {{ vars.platform_name }}.
        * `USERNAME` is the account to use to run {{ vars.platform_name }} API commands.
        * `PASSWORD` is the password for the account.


### <a id="migration-prep-top-firewall"></a> Migrate DFW Top Firewall Rules

If your clusters are customized with DFW rules
or use Network Profiles configured with DFW section markers,
migrate the DFW rules:

1. Re-create your existing top section DFW rules from above your NSX Manager `top_firewall_section_marker`
    in the NSX Policy Environment section.  Include the `top_firewall_section_marker` in the new copy.

    <p class="note warning"><strong>Warning</strong>:
    If you do not configure your DFW Rules correctly, your workloads will lose network connectivity.
    Both the original copy of the <code>top_firewall_section_marker</code> section and the re-created copy in the NSX Policy Environment section
    must be in your DFW rules after you complete this step.
    </p>

For more information on configuring DFW rules,
see [DFW Migration](mp2p-migration-concepts.html#dfw)
in _Migrating from NSX Management Plane API to Policy API - Overview_.


### <a id="migration-prep-create-api-objects"></a> Activate NSX Policy API in TKGI

To migrate NSX Management Plane API shared network resources to NSX Policy API objects:

1. Create a simple test cluster.
1. Migrate the cluster to the NSX Policy API:

    ```
    tkgi promote-cluster-to-policy CLUSTER-NAME
    ```

    Where `CLUSTER-NAME` is the name of the promoted cluster.


1. Verify successful cluster migration to the NSX Policy API:

    ```
    tkgi cluster CLUSTER-NAME
    ```

    Where `CLUSTER-NAME` is the name of the promoted cluster.


To collect the newly created Resource Policy IDs:

1. Retrieve the existing NSX Management Plane API IDs:

    1. Open the TKGI tile UI.
    1. Open the **Networking** tab.
    1. Retain the following NSX Management Plane API IDs:

        * **Pods IP Block ID**
        * **Nodes IP Block ID**
        * **T0 Router ID**
        * **Floating IP Pool ID**

        For more information on **Networking** tab settings, see [Networking](installing-nsx-t.html#networking) in
        _Installing TKGI on vSphere with VMware NSX_.

1. Retrieve the new Resource Policy IDs:

    1. Log in to the NSX Web UI using an account with with admin privileges.
    1. Go to the homepage.
    1. Enter one of the NSX Management Plane API IDs retrieved in the last step into the search bar and search.
    1. Retrieve the corresponding Resource Policy ID From the **ID** field.
    Confirm that the indicated **Creation Time** matches the time when you promoted your test cluster.
    1. Retrieve and retain the Resource Policy ID for each NSX Management Plane API ID you collected in the last step.

        * MP2P migration via `tkgi promote-cluster-to-policy` creates Policy API ID strings identical to their corresponding original NSX Management Plane API UUIDs.
        * The Policy API resources configured in the TKGI tile that were not migrated by `tkgi promote-cluster-to-policy`, for example if they were migrated previously by another tool or were originally created as Policy objects, may have Policy IDs that do not correspond to NSX Management Plane object UUIDs

### <a id="migration-steps-configure-opsman"></a> Configure the Environment for NSX Policy API

To reconfigure TKGI with Resource Policy IDs:

1. Open the TKGI tile UI.
1. Open the **Networking** tab.
1. Activate **Policy API mode**.
1. Replace the Management Plane API IDs with the retained Resource Policy IDs:

    * **Pods IP Block ID**
    * **Nodes IP Block ID**
    * **T0 Router ID**
    * **Floating IP Pool ID**

    For more information on **Networking** tab settings, see [Networking](installing-nsx-t.html#networking) in
    _Installing TKGI on vSphere with VMware NSX_.

1. Select **Apply Changes**.

<p class="note"><strong>Note:</strong>
After configuring the TKGI tile, newly created clusters use the NSX Policy API.
</p>


## <a id="migration-steps"></a> Migrate TKGI Clusters from the NSX Management Plane API to NSX Policy API

To migrate TKGI to NSX Policy API, serially promote all of your TKGI clusters individually:

1. [Migrate a TKGI Cluster to NSX Policy API](#migration-steps-cluster)

After migrating all clusters:

1. [Migrate DFW Bottom Firewall Rules](#migration-steps-bottom-firewall)


<p class="note"><strong>Note:</strong>
Do not intentionally run TKGI in mixed mode for an extended period of time.
Promote all TKGI clusters to NSX Policy API as quickly as possible.
</p>

### <a id="migration-steps-cluster"></a> Migrate a TKGI Cluster to NSX Policy API

To migrate an individual cluster from the NSX Management Plane API to NSX Policy API:

1. If your cluster is custom configured with the `ncp.nsx_v3.k8s_np_use_ip_sets` Network Profile parameter set to `false`,
    restore the default `"ncp.nsx_v3.k8s_np_use_ip_sets": true` configuration by updating the cluster with a modified Network Profile.

1. Promote the cluster using the TKGI CLI:

    ```
    tkgi promote-cluster-to-policy CLUSTER-NAME
    ```

    Where `CLUSTER-NAME` is the name of the promoted cluster.

    <p class="note"><strong>Note:</strong>
    Do not attempt to promote an additional TKGI cluster to NSX Policy API
    before completing the promotion of the current clusters.
    </p>

1. Validate successful migration to NSX Policy API topology for the cluster before promoting subsequent clusters:

    1. Run the following:

        ```
        tkgi cluster CLUSTER-NAME
        ```

        Where `CLUSTER-NAME` is the name of the promoted cluster.

    1. Confirm successful cluster promotion by reviewing the migration log on the Kubernetes control plane VM.

        NCP returns one of three exit codes after promoting a cluster: `0`, `1`, or `2`:

        * `0`: The cluster has successfully promoted to NSX Policy API.
        * `1`: Cluster promotion has failed, and its NSX resources are a mixture of NSX Management Plane API
        and NSX Policy API resources. Restart cluster promotion for this cluster from the same master VM.
            <p class="note warning"><strong>Note:</strong>
            If you restart cluster promotion from a different VM, <code>mp_to_policy_importer</code> will attempt to recover the cluster by rolling back the successfully promoted NSX resources. Do not attempt to promote a different cluster until after this cluster has successfully promoted.
            </p>
        * `2`: Cluster promotion has failed, and the cluster's NSX resources remain Management Plane API resources.
        Do not restart cluster promotion for this cluster.
        Review the `mp_to_policy_importer` logs and confirm NCP can be manually restarted on all master VMs in Management Plane API mode.

For more information on cluster limitations while promoting a cluster,
see [During Cluster Promotion to NSX Policy API](mp2p-migration-concepts.html#nsx-api)
in _Migrating from NSX Management Plane API to Policy API - Overview_.

<p class="note"><strong>Note:</strong>
Do not attempt to promote an additional TKGI cluster to NSX Policy API
before completing the promotion of the current clusters.
</p>


### <a id="migration-steps-bottom-firewall"></a> Migrate DFW Bottom Firewall Rules

If your clusters are customized with DFW rules
or use Network Profiles configured with DFW section markers,
finish migrating the DFW rules:

1. Re-create your existing bottom section DFW rules from below your NSX Manager `bottom_firewall_section_marker`
 in the NSX Policy Application section BELOW all migrated NCP rules. Include the `bottom_firewall_section_marker`.

1. Remove all of the original NSX Management Plane customer-defined DFW rules.
When done, confirm there is only one copy of the top firewall rules, the one in the NSX Policy Environment section,
and only one copy of the bottom firewall rules, the one in the NSX Policy Application section.

     <p class="note warning"><strong>Warning</strong>:
    If you do not configure your DFW Rules correctly, your workloads will lose network connectivity.
    You must remove all NSX Management Plane user-defined DFW rules
    before starting post-migration cleanup.
    </p>

For more information on configuring DFW rules,
see [DFW Migration](mp2p-migration-concepts.html#dfw)
in _Migrating from NSX Management Plane API to Policy API - Overview_.



## <a id="migration-cleanup"></a> Post-Migration Cleanup

After all TKGI clusters have been promoted to NSX Policy API,
remaining NSX resources must be promoted
and the TKGI configurations for NSX Management Plane API objects removed.

To clean up after promoting all clusters:

1. Remove NSX Management Plane API-related configurations:

    1. Remove the original NSX Management Plane API-configured Network Profiles.

1.  Use the NSX Promoter to promote the remaining NSX resources:

    1. Log in to the NSX Web UI using an account with with admin privileges.
    1. Go to the **NSX** > **System** > **General Settings**.
    1. Select **Start Objects Promotion**.

        The following are reconfigured by the NSX Promoter:

        * NSX resources in TKGI tile **Resource Config**.
        * NSX resources in cluster `vm_extension` configurations.
        * Custom infra-level resources out of TKGI scope.
        For example, NAT, IP allocations, subnet allocations, and the load balancers that you have created.

    For information about the NSX Promoter, see
    [Promote Manager Objects to Policy Objects](https://techdocs.broadcom.com/us/en/vmware-cis/nsx/vmware-nsx/3-2/administration-guide/operations-and-management/promote-manager-objects-to-policy-objects.html).

1. (Optional) To deactivate the NSX Migration Coordinator Service on all NSX managers:

    1. SSH to the NSX Manager with administrative privileges.

    1. At the `nsxmanager>` prompt, run the following:

        ```
        nsxmanager> stop service migration-coordinator
        ```

1. If your NSX Manager cluster was configured with VIP before you started MP2P Migration, restore your VIP configuration.

1. To switch BOSH to Policy API mode:

    * If you are using {{ vars.platform_name }} v3.0.0 or later:

        1. Open your {{ vars.platform_name }} BOSH Director for vSphere tile to the **vCenter Config** pane.

        1. Deactivate **Use NSX Policy API Migration Mode**.

        1. Activate **Use NSX Policy API**.

        1. Click **Save**.

        1. On the {{ vars.platform_name }} **Installation Dashboard**, select **Review Pending Changes**.

        1. Ensure that **BOSH Director** is the only product selected.

        1. Select **Apply Changes**.

    * If you are using {{ vars.platform_name }} v2.10.45 or later:

        1. Access the virtual machine where you ran the BOSH Migration Mode script when you prepared {{ vars.platform_name }} and BOSH for MP2P Migration.

        1. Export the `BOSH_CLIENT`, `BOSH_CLIENT_SECRET`, `BOSH_ENVIRONMENT`, and `BOSH_CA_CERT`
        environment variables. For more information, see
        [Set the BOSH Environment Variables on the {{ vars.platform_name }} VM](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/2-10/tanzu-ops-manager/install-trouble-advanced.html#export-bosh-envs)
        in _Advanced Troubleshooting with the BOSH CLI_.

            For example:

            ```console
            export BOSH_CLIENT=ops_manager  BOSH_CLIENT_SECRET=FHoiRmt3qq1LfbPncF4vAyxZWUSpqbZ-  BOSH_ENVIRONMENT=88.0.0.3 bosh  BOSH_CA_CERT=/var/tempest/workspaces/default/root_ca_certificate
            ```

        1. Run the following BOSH Migration Mode script command:

            ```
            ./bosh_migration_mode disable OPSMAN-IP USERNAME PASSWORD
            ```

            Where:

            * `OPSMAN-IP` is the IP address for the {{ vars.platform_name }}.
            * `USERNAME` is the account to use to run {{ vars.platform_name }} API commands.
            * `PASSWORD` is the password for the account.
