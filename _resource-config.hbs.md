For each job, review the **Automatic** values in the following fields:
  * **INSTANCES**: {{  vars.product }} defaults to the minimum configuration.
  If you want a highly available configuration, scale the number of VM instances as follows:
      1. To configure your {{  vars.product }} database for high availability,
      increase the **INSTANCES** value for **{{ vars.product_short }} Database** to `3`.
      2. To configure your {{  vars.product }} API and UAA for high availability,
      increase the **INSTANCES** value for **{{ vars.product_short }} API** to `2` or more.

      {{# evalExpression "current_page.data.iaas == 'Azure'"}}
        <p class="note"><strong>Note</strong>: On Azure, you must reconfigure your
        {{ vars.product_short }} API load balancer backend pool
        whenever you modify your {{ vars.product_short }} API VM group.
        For more information about configuring your {{ vars.product_short }} API
        load balancer backend pool, see
        <a href="azure-api-load-balancer.html#create-load-balancer">Create a Load Balancer</a>
        in <i>Configuring an Azure Load Balancer for the {{ vars.product_short }} API</i>.
        </p>
      {{/ evalExpression }}
      {{# evalExpression "current_page.data.iaas == 'vSphere-NSX-T'"}}
        <p class="note"><strong>Note</strong>: On vSphere with NSX, you must manually deploy
        an NSX load balancer so that you can select it as part of the resource configuration.
        For more information, see
        <a href="nsxt-lb-tkgi-api.html">Provisioning an NSX Load Balancer for the {{ vars.product_short }} API Server</a>.
        </p>
      {{/ evalExpression }}
  * **VM TYPE**: By default, the **{{ vars.product_short }} Database** and **{{ vars.product_short }} API** jobs are set to the same **Automatic** VM type.
  If you want to adjust this value, we recommend that you select the same VM type for both jobs.
    <p class="note"><strong>Note:</strong> The <strong>Automatic</strong> <strong>VM TYPE</strong> values match the recommended resource configuration for the <strong>{{ vars.product_short }} API</strong>
    and <strong>{{ vars.product_short }} Database</strong> jobs.
    </p>
  * **PERSISTENT DISK TYPE**: By default, the **{{ vars.product_short }} Database** and **{{ vars.product_short }} API** jobs are set to the same persistent disk type.
  If you want to adjust this value, you can change the persistent disk type for each of the jobs independently.
  Using the same persistent disk type for both jobs is not required.
