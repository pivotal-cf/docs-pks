To configure the networks used by the Tanzu Kubernetes Grid Integrated Edition control plane:

1. Click **Assign Networks**.

    ![Assign Networks pane in Ops Manager](images/azure/azs-networks-azure.png)

1. Under **Network**, select the infrastructure subnet that you created for Tanzu Kubernetes Grid Integrated Edition component VMs, such as the TKGI API and TKGI Database VMs. For example, `infrastructure`.
1. Under **Service Network**, select the services subnet that you created for Kubernetes cluster VMs. For example, `services`.
1. Click **Save**.
