1. Log in to the BOSH Director. For instructions, see [Log in to the BOSH Director VM](diagnostic-tools.html#alias).

1. To identify your TKGI deployment name, run the following command:  

    ```
    bosh -e ENVIRONMENT deployments
    ```

    Where `ENVIRONMENT` is your BOSH environment alias.  
<br>
    For example:  
    ```console
    $ bosh -e tkgi deployments
    ```  
    Your TKGI deployment name begins with `pivotal-container-service` and includes
    a BOSH-generated identifier.  

1. To identify your TKGI API VM name, run the following command:  

    ```
    bosh -e ENVIRONMENT -d DEPLOYMENT vms
    ```

    Where:  

     * `ENVIRONMENT` is the BOSH environment alias.  
     * `DEPLOYMENT` is your TKGI deployment name.  

    For example:
    ```console
    $ bosh -e tkgi -d pivotal-container-service-a1b2c333d444e5f66a77 vms
    ```

    Your TKGI API VM name begins with `pivotal-container-service` and includes a
    BOSH-generated identifier.  
    <p class="note"><strong>Note:</strong> The TKGI API VM identifier is different from the identifier in your TKGI
    deployment name.
    </p>

1. To SSH into the TKGI API VM:  

    ```
    bosh -e ENVIRONMENT -d DEPLOYMENT ssh TKGI-API-VM
    ```

    Where:  

    * `ENVIRONMENT` is the BOSH environment alias.  
    * `DEPLOYMENT` is your TKGI deployment name.  
    * `TKGI-API-VM` is your TKGI API VM name.  

    For example:  
    ```console
    $ bosh -e tkgi \
    -d pivotal-container-service-a1b2c333d444e5f66a77 \
    ssh pivotal-container-service/000a1111-222b-3333-4cc5-de66f7a8899b
    ```
