
1. In the **{{  vars.product }}** tile, click **Resource Config**.

1. To configure your {{  vars.product }} database for high availability (HA),
increase the **INSTANCES** value for **TKGI Database** to `3`.
1. To configure your {{  vars.product }} API and UAA for HA,
increase the **INSTANCES** value for **TKGI API** to `2` or more.
    <p class="note"><strong>Note</strong>: On Azure, you must reconfigure your
    TKGI API load balancer backend pool
    whenever you modify your TKGI API VM group.
    For more information about configuring your TKGI API
    load balancer backend pool, see
    <a href="azure-api-load-balancer.html#create-load-balancer">Create a Load Balancer</a>
    in <i>Configuring an Azure Load Balancer for the TKGI API</i>.
    </p>
1. Click **Save**.

1. Click **Apply Changes**.
