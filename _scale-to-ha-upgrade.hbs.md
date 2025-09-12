<div class="note warning"><strong>Warning:</strong><br><br> 	
    <ul>	
        <li>High availability mode is a beta feature.	
        Do not scale your <strong>TKGI API</strong> or <strong>TKGI Database</strong> to more than one instance in production environments.</li>	
        <li>Configure Tanzu Kubernetes Grid Integrated Edition for high availability 	
        only after completing the Tanzu Kubernetes Grid Integrated Edition v1.7 upgrade.</p>	
        </li>	
    </ul>	
</div>	

1. In the **Tanzu Kubernetes Grid Integrated Edition** tile, click **Resource Config**.	

1. To configure your Tanzu Kubernetes Grid Integrated Edition database for high availability (HA), 	
increase the **INSTANCES** value for **TKGI Database** to `3`.	
1. To configure your Tanzu Kubernetes Grid Integrated Edition API and UAA for HA,	
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
