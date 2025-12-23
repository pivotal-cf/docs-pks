
1. In the **{{  vars.product }}** tile, click **Resource Config**.

1. To configure your {{  vars.product }} database for high availability (HA),
increase the **INSTANCES** value for **{{ vars.product_short }} Database** to `3`.
1. To configure your {{  vars.product }} API and UAA for HA,
increase the **INSTANCES** value for **{{ vars.product_short }} API** to `2` or more.
    <p class="note"><strong>Note</strong>: On Azure, you must reconfigure your
    {{ vars.product_short }} API load balancer backend pool
    whenever you modify your {{ vars.product_short }} API VM group.
    For more information about configuring your {{ vars.product_short }} API
    load balancer backend pool, see
    <a href="azure-api-load-balancer.html#create-load-balancer">Create a Load Balancer</a>
    in <i>Configuring an Azure Load Balancer for the {{ vars.product_short }} API</i>.
    </p>
1. Click **Save**.

1. Click **Apply Changes**.
