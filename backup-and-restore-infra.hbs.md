---
title: Backing Up and Restoring the Data Center for TKGI
owner: TKGI
---

This topic describes how to back up and restore the VMware Tanzu Kubernetes Grid Integrated Edition (TKGI) infrastructure.

## Overview

Backing up and restoring the TKGI infrastructure includes the following components:

- VMware NSX. See [Backing Up and Restoring NSX Manager](./backup-and-restore-nsxt.html).
- vCenter Server. See [Backing Up and Restoring the vCenter Server](./backup-and-restore-vcenter.html).

<p class="note"><strong>Note</strong>: In terms of TKGI, the primary focus is the back up and restore of VMware NSX. vCenter back up and restore is outside the scope of this documentation, but a mention of it is included to ensure it is part of your end-to-end back up and restore workflow.</p>

## Test Considerations

As part of your TKGI back up and restore planning and testing, consider the following test scenarios for NSX.

- Back up NSX.
- Shut down (or delete) NSX Manager nodes. 
- Deploy new NSX Manager node and restore configuration from backup. 
- Restore additional NSX Manager nodes.

- If you deploy a Kubernetes application with a service endpoint, and it is included in the NSX backup, on restore of NSX there is no loss in application connectivity. However, the application must be redeployed if it was deployed after the backup was taken.

- If you create a Kubernetes namespace, and it is included in the NSX backup, on restore of NSX, the namespace is present. However, the namespace must be recreated if it was created after the backup was taken. If you delete a namespace when NSX is down, on restore of NSX the namespace is removed.

- If you create a Kubernetes cluster, and it is included in the NSX backup, on restore of NSX the cluster is reachable. However, if the cluster was created after the NSX backup  was taken, the cluster is not reachable. In this case, delete cluster and create new one.

- If you create a Kubernetes namespace, and backing up NSX, then deploy pods, on restore of NSX, restarting pods brings them to running state since the namespace was created before backing up. However, if the namespace was not created before backing up NSX, the pods are stuck in ContainerCreating state. Both the namespace and the pods must be recreated.

- If you create a load balancer service before backing up NSX, on restore the service is present. However, if you create the service after backing up NSX, on restore of NSX the load balancer VIP is pending. You must redeploy the service for it to work. If you delete a load balancer service in-between taking a back up of NSX and restoring NSX, on restore the load balancer VIP is deleted.






