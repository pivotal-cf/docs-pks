---
title: Migrating to a New Datastore

iaas: vsphere-nsxt
---

This topic explains how to migrate a {{ vars.product_short }} control plane and cluster container volumes to a new vSphere datastore without impacting workload cluster functioning.

For prerequisites and notes, see [How to migrate {{ vars.product_short }} environment from one datastore to another datastore](https://knowledge.broadcom.com/external/article?legacyId=67277) in the Broadcom Support KB.

## <a id="overview"></a> Overview

A growing {{ vars.product_short }} environment may outgrow its host vSphere datastore.
To avoid this, you can move {{ vars.product_short }} to a new datastore by migrating its components in the following order:

1. Datastore for container volumes
2. {{ vars.platform_name }} and the BOSH Director
3. {{ vars.product_short }} Tile
4. {{ vars.product_short }}-managed clusters

The following sections explain how to perform these migration steps.

## <a id="volumes"></a> Step 1: Change the Datastore for Container Volumes

1. Log in to your vCenter and navigate to the datacenter, datastore, or vSphere cluster that hosts your {{ vars.product_short }} infrastructure.

2. In the **Monitor** tab, select **Cloud Native Storage** > **Container Volumes**.

3. Select the volumes used by {{ vars.product_short }} and click **Migrate**.

4. On the **Migrate Volume** page, select the target datastore to migrate to.

5. Confirm in the **Acknowledge** checkbox and click **Migrate**. The migration operation proceeds.

For limitations and considerations, see:

    * [Migrating Container Volumes in vSphere](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/7-0/vsphere-storage-7-0/getting-started-with-cloud-native-storage-in-vsphere/cloud-native-storage-for-vsphere-administrators/migrating-container-volumes-in-vsphere.html) in the vSphere 8.0 documentation
    * [Guidelines/Limitations for Cloud Native Storage (CNS) Relocate on vSphere and known issues](https://kb.vmware.com/s/article/90607) in the Broadcom Support KB

## <a id="foundation"></a> Step 2: Change the Datastore for {{ vars.platform_name }} and the BOSH Director

1. Log in to the Tanzu Operations Manager Installation Dashboard.

2. Click into the **BOSH Director** tile.

3. Select **vCenter Config**.

4. Update the **Ephemeral Datastore Names** and **Persistent Datastore Names** text boxes to reflect the new datastore names.

5. Click **Save**.

6. Click **Review Pending Changes**.

7. Disable the **Select All Products** check box so that only BOSH Director selected.

8. Click **Apply Changes**. The BOSH Director redeploys.

9. Confirm that the BOSH Director VM has a persistent disk on the new datastore:

    1. Log in to vCenter and find the BOSH Director VM.

    1. Review the BOSH Director VM's **Related Objects** to verify its storage location has updated to the new datastore.

## <a id="tile"></a> Step 3: Change the Datastore for the {{ vars.product_short }} Tile

1. Log in to the Tanzu Operations Manager Installation Dashboard.

2. In the **BOSH Director** tile, click **Director Config**.

3. Select the **Recreate VMs deployed by the BOSH Director** option.

4. Click **Review Pending Changes**.

5. If using any service tiles, select the **Recreate All On-Demand
    > Service Instances** errand for each tile you migrate.

6. Click **Apply Changes**.

7. Confirm that the {{ vars.product_short }} VMs are on the new datastore:

    - From the vCenter, find the {{ vars.product_short }} VM.

    - In the **Related Objects** section, verify the storage has been
      > updated to the new datastore.

## <a id="clusters"></a> Step 4: Change the Datastore for {{ vars.product_short }}-managed Clusters

1. Go to the **{{ vars.product_short }}** tile and select **Kubernetes Cloud Provider**.

2. Change the datastore to the new datastore.

3. Click **Apply Changes**.

4. Get deployment IDs for all {{ vars.product_short }} clusters:

  ```
  bosh deployments --column=name | grep service-instance_
  ```

5. Run `bosh recreate` for each `service-instance` deployment re-create each {{ vars.product_short }} cluster:

  ```
  bosh -d service-instance_CLUSTER-ID
  ```

  - If the cluster has only one control plane node, to ensure no downtime and that etcd maintains the correct status, scale out the control plane to three instances first, then run bosh recreate to recreate the cluster VM, and finally scale the control plane back down from three nodes to one.
