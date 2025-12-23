---
title: Delete Your Tanzu Kubernetes Grid Integrated Edition Deployment

---

This topic describes how to use the {{  vars.product_full }} Management Console (TKGI MC) to remove a TKGI deployment.



## <a id='overview'></a>Overview

If you no longer require a TKGI deployment deployed by the TKGI MC, you can use TKGI MC to delete it.
When TKGI MC deletes a TKGI deployment, it removes or cleans up deployment-related objects on the TKGI MC VM and in the vSphere inventory.

<p class="note"><strong>Note</strong>: If TKGI MC fails to deploy TKGI correctly, always use TKGI MC to cleanly remove the failed deployment.</p>

To remove a TKGI installation deployed by TKGI MC:

* [Remove the TKGI MC Deployment](#remove-deployment)



## <a id='remove-deployment'></a>Remove the TKGI MC Deployment

To remove a TKGI MC deployment:

1. Use the TKGI CLI to delete any existing clusters and nodes before deleting your TKGI deployment.
1. Open the TKGI MC.
1. Go to the **TKG Integrated Edition** view.
1. Click the **Action** drop-down menu and select **Delete {{  vars.product }} Deployment**.
1. Click **Delete** to confirm the deletion of the deployment.
