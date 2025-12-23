---
title: Deleting Tanzu Kubernetes Grid Integrated Edition

---

This topic describes how to delete the {{  vars.product }} tile from the {{ vars.platform_name }} Installation Dashboard.

<p class='note'><strong>Note</strong>:
If you used the {{  vars.product_full }} Management Console to deploy TKGI, you must remove TKGI from the TKGI Management Console. For more information, see
<a href="console-delete-deployment.html">Delete Your {{  vars.product }} Deployment</a>.
</p>



## <a id='overview'></a>Overview

If you no longer require a TKGI deployment, you can remove the TKGI tile from {{ vars.platform_name }}.

To remove a TKGI installation:

1. Use the TKGI CLI to delete any existing clusters and nodes before deleting your TKGI deployment.
For more information, see [Deleting Clusters](delete-cluster.html).
1. [Delete the {{  vars.product }} Tile](#delete).


## <a id="delete"></a>Delete the {{  vars.product }} Tile

To delete the TKGI tile, perform the following steps:

1. Navigate to the {{ vars.platform_name }} Installation Dashboard.

1. Click the trash can icon on the TKGI tile.

1. Click **Confirm**.

1. Click **Review Pending Changes**.

1. (Optional) To preserve clusters created by TKGI, click **Errands** and deactivate the **Delete all clusters errand** check box under **Pre-Delete Errands**.
  - By default, the **Delete all clusters** errand is activated, which deletes all
  TKGI clusters before {{ vars.platform_name }} deletes the TKGI tile.


1. Click **Apply Changes**.
