<table>
  <tr><th>Use Case</th><th>Description</th></tr>
  <tr>
    <td>Encrypt a secret in an etcd database.</td>
    <td>Use an encryption provider to encrypt secrets in a cluster's etcd database. For more information, see 
    <a href="./k8s-profiles-encrypt-etcd.html">Encrypt Secrets in an etcd Database</a>.</td>
  </tr>
  <tr>
    <td>Limit the resource usage of incoming requests.</td>
    <td>Use the <code>ResourceQuota</code> admission control plugin to restrict incoming requests by resource usage. 
    For more information, see <a href="#admission-quota">Admission Control: ResourceQuota</a> below.</td>
  </tr>
  <tr>
    <td>Assign an IP range for the NodePort Service</a>.</td>
    <td>Use <code>service-node-port-range</code> to specify an IP range for for <code>NodePort</code> services. 
    For more information, see <a href="#port-range">Set Service Node Port Range</a> below.</td>
  </tr>
  <tr>
    <td>Add an OIDC provider.</td>
    <td>Customize a cluster's OIDC provider by deploying a <a href="https://github.com/dexidp/dex">dex</a> connector or other OIDC provider to its pod. For more information, see <a href="./k8s-profiles-dex-oidc.html">Adding an OIDC Provider</a>.</td>
  </tr>
  <tr>
    <td>Restrict Apiserver client authentication.</td>
    <td>Set <code>requestheader-allowed-names</code> for Apiserver client authentication. 
    For more information, see <a href="#request-allowed">Restrict Request Header Names</a> below.</td>
  </tr>
  <tr>
    <td>Define the service cluster IP range.</td>
    <td>Change the service cluster IP range. 
    For more information, see <a href="#extend-service-ip-range">Modify the Service Cluster IP Range</a> below.</td>
  </tr>
  <tr>
    <td>Configure Pod Security Admission.</td>
    <td>Configure cluster-specific PSA in TKGI. For more information, see <a href="./pod-security-admission.html#psa-cluster">Pod Security Admission in a TKGI Cluster</a> in <em>Pod Security Admission in TKGI</em>.</td>
  </tr>
  <tr>
    <td>Customize etcd quota backend bytes.</td>
    <td>Configure the etcd quota-backend-bytes parameter to set the storage size limit for the etcd backend database. 
    For more information, see <a href="#etcd-quota">Set etcd Quota Backend Bytes</a> below.</td>
  </tr>
</table>

#### <a id='admission-quota'></a> Admission Control: ResourceQuota

To create a Kubernetes profile that includes the `ResourceQuota` admission control plugin:

* Follow the [Create a Kubernetes Profile](./k8s-profiles.html#create)
instructions.
* Include the following `customizations` in your profile configuration file:

    ```
      "customizations": [
          {
              "component": "kube-apiserver",
              "arguments": {
                  "enable-admission-plugins": PLUGINS-LIST
              }
          }
      ],
    ```
    Where:  
    
    * `PLUGINS-LIST` is one of the following:  
        * The string `"ResourceQuota"`.  
        * A comma-delimited string list of validated plugins that includes `ResourceQuota`.  

For more information, see [ResourceQuota](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/#resourcequota) in the Kubernetes documentation.

#### <a id='port-range'></a> Set Service Node Port Range

To create a Kubernetes profile that uses `service-node-port-range` for `NodePort` type services:

* Follow the [Create a Kubernetes Profile](./k8s-profiles.html#create)
instructions.
* Include the following `customizations` in your profile configuration file:

    ```
      "customizations": [
          {
              "component": "kube-apiserver",
              "arguments": {
                  "service-node-port-range": PORT-RANGE
              }
          }
      ],
    ```
    Where `PORT-RANGE` is a CIDR notation IP range from which to assign service cluster IPs, such as `30000-40000`.

If the specified `PORT-RANGE` is not valid, the `tkgi create-k8s-profile` command returns an error `invalid value for service-node-port-range`.

For more information, see [Type NodePort](https://kubernetes.io/docs/concepts/services-networking/service/#nodeport) in the Kubernetes documentation.

#### <a id='request-allowed'></a> Restrict Request Header Names

To create a Kubernetes profile that uses `requestheader-allowed-names` for Apiserver client authentication:

* Follow the [Create a Kubernetes Profile](./k8s-profiles.html#create)
instructions.
* Include the following `customizations` in your profile configuration file:

    ```
      "customizations": [
          {
              "component": "kube-apiserver",
              "arguments": {
                  "requestheader-allowed-names": COMMON-NAMES
              }
          }
      ],
    ```
    Where `COMMON-NAMES` is a string list of valid Common Name values in the signed client certificate, such as `"cn1.com,c2.com"`.

For more information, see [Kubernetes Apiserver Client Authentication](https://kubernetes.io/docs/tasks/access-kubernetes-api/configure-aggregation-layer/) in the Kubernetes documentation.

#### <a id='extend-service-ip-range'></a> Modify the Service Cluster IP Range

To create a Kubernetes profile that modifies the service cluster IP range:

* Follow the [Create a Kubernetes Profile](./k8s-profiles.html#create)
instructions.
* Include the following `customizations` in your profile configuration file:

    ```
      "customizations": [
          {
              "component": "kube-apiserver",
              "arguments": {
                  "service-cluster-ip-range": IP-RANGE
              }
          }
      ],
    ```

    Where `IP-RANGE` is a CIDR notation IP range from which to assign service cluster IPs. 
    The IP range can be a maximum of two dual-stack CIDRs and must not overlap with any IP ranges assigned to nodes or pods.

For more information, see kube-apiserver [Options](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/#options) 
in the Kubernetes documentation.

#### <a id='etcd-quota'></a> Set etcd Quota Backend Bytes

To create a Kubernetes profile that configures the etcd `quota-backend-bytes` parameter:

* Follow the [Create a Kubernetes Profile](./k8s-profiles.html#create)
instructions.
* Include the following `customizations` in your profile configuration file:

    ```
      "customizations": [
          {
              "component": "etcd",
              "arguments": {
                  "quota-backend-bytes": QUOTA-SIZE
              }
          }
      ],
    ```
    Where `QUOTA-SIZE` is the storage size limit for the etcd backend database in bytes, such as `8589934592` (8 GB).

The `quota-backend-bytes` parameter sets the storage size limit for the etcd backend database. When the database size approaches this limit, etcd will raise alarms and only allow read operations and delete operations. This helps prevent the etcd cluster from running out of storage space.

<p class="note"><strong>Note:</strong> The default etcd quota-backend-bytes value is 2 GB. Consider your cluster's storage requirements when setting this value. Setting it too low may cause issues with cluster operations, while setting it too high may consume excessive storage resources.</p>

<p class="note warning"><strong>Warning:</strong> When the etcd database size approaches the quota limit, etcd will raise alarms and enter a read-only mode, preventing write operations. Monitor your etcd usage and ensure the quota is set appropriately for your workload.</p>

**Considerations when setting quota-backend-bytes:**

* **Cluster size**: Larger clusters with more nodes, pods, and resources require more etcd storage.
* **Workload type**: Clusters with frequent configuration changes or many secrets/configmaps need higher quotas.
* **Backup strategy**: Ensure your backup processes can handle the configured quota size.
* **Monitoring**: Implement monitoring to track etcd database size relative to the quota.

For example, to create a Kubernetes profile that sets the etcd quota to 8 GB:

1. Create a JSON configuration file named `etcd-quota-profile.json`:

    ```json
    {
        "name": "etcd-quota-8gb",
        "description": "Profile to set etcd quota backend bytes to 8 GB",
        "customizations": [
            {
                "component": "etcd",
                "arguments": {
                    "quota-backend-bytes": "8589934592"
                }
            }
        ]
    }
    ```

1. Create the Kubernetes profile:

    ```
    tkgi create-k8s-profile etcd-quota-profile.json
    ```

1. Create a cluster using this profile:

    ```
    tkgi create-cluster my-cluster --external-hostname my-cluster.example.com --plan small --kubernetes-profile etcd-quota-8gb
    ```

    Or apply the profile to an existing cluster:

    ```
    tkgi update-cluster my-cluster --kubernetes-profile etcd-quota-8gb
    ```

For more information about etcd quotas, see [Space quota](https://etcd.io/docs/v3.5/op-guide/maintenance/#space-quota) in the etcd documentation.  
