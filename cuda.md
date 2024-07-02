# Create GPU Clusters with CUDA

This page explains how to create TKGI clusters on vSphere with NVIDIA GPU worker nodes and Compute Unified Device Architecture (CUDA) enabled for hosted applications.

## <a id="overview"></a> Overview

To create a CUDA-enabled GPU cluster with TKGI on vSphere, you:

1. Plug compatible GPU cards into your ESXi hosts.
1. Configure PCI passthrough for the cards, and retrieve the `vendor_id` and `device_id` that identify them.
1. Configure a BOSH VM Extension for a VM instance group that uses the GPUs, as set by `pci_passthroughs`.
1. (Optional) To enable the cluster to run workloads on either non-GPU or GPU processors, configure a compute profile that defines both non-GPU and GPU node pools.
1. Create the cluster.
1. Install the [NVIDIA GPU Operator](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/overview.html) on the cluster to integrate the GPU with Kubernetes.
  - By default, the NVIDIA GPU Operator installs a default GPU driver on worker nodes, but you can also customize the GPU driver image.


## <a id="prereqs"></a> Prerequisites

* TKGI v1.20 or later.
* ESXi hosts running vSphere 7.0 Update 3 or later. Listed below are the builds for 7.0u3 which is the minimum required to support this.
  * [VMware vCenter Server 7.0 Update 3 | ISO Build 18700403](https://docs.vmware.com/en/VMware-vSphere/7.0/rn/vsphere-vcenter-server-703-release-notes.html).
  * [VMware ESXi 7.0 Update 3c | ISO Build 19193900](https://docs.vmware.com/en/VMware-vSphere/7.0/rn/vsphere-esxi-70u3c-release-notes.html).
* NVIDIA GPU cards from G8x series or later, such as GeForce, Quadro, or Tesla
  * These cards support CUDA.
* Helm, the Kubernetes package manager. To install, see [Installing Helm](https://helm.sh/docs/intro/install/) in the Helm documentation.


## <a id="prep"></a> Prepare the Hardware

To prepare GPU hardware for supporting TKGI clusters with CUDA:

1. Plug a GPU card into each ESXi host.
  - To simplify management, VMware recommends grouping the hosts that have GPUs into the same cluster, so they run within a single availability zone (AZ).

1. Enable PCI passthrough and record the GPU IDs:
   1. In your vSphere Client, select the target ESXi host in the `GPU` cluster.
   1. Select **Configure > Hardware > PCI Devices**.
   1. Select the **All PCI Devices** tab.
   1. For each target GPU:

      1. Select the GPU from the list.
      1. Click **Toggle Passthrough**.
      1. Under **General Information**, record the **Device ID** and **Vendor ID**. Both IDs are the same for identical GPU cards.

![CUDA preparation](images/cudaprep.png)

## <a id="cluster"></a> Create Cluster

To create a kubernetes cluster with GPU workers, we need to use the
compute-profile/vm-extension feature of TKGI. For example, if you want
to create a kubernetes cluster with two node pools, one for regular
workers, and one for gpu workers, you can use the following compute
profile to achieve this.

Note: If you want to create a kubernetes cluster with only GPU workers,
you do not need a compute profile since all the nodes are heterogeneous.

```
{
    "name": "gpu-compute-profile",
    "description": "gpu-compute-profile",
    "parameters": {
        "cluster_customization": {
            "node_pools": [
                {
                    "name": "normal-pool",
                    "instances": 3,
                    "max_worker_instances": 5
                },
                {
                    "name": "gpu-pool",
                    "instances": 3,
                    "max_worker_instances": 5
                }
            ]
        }
    }
}
```

and to attach GPUs to the nodes in gpu-pool, you need to specify
vm_extension, such as:


```
---
instance_groups:
- name: master
  vm_extension:
    vmx_options:
      disk.enableUUID: '1'
- name: worker-gpu-pool
  vm_extension:
    cpu: 8
    ram: 16384
    pci_passthroughs:
    - vendor_id: 0x10de
      device_id: 0x1db6
    vmx_options:
      disk.enableUUID: '1'
      pciPassthru.use64bitMMIO: 'TRUE'
      pciPassthru.64bitMMIOSizeGB: 128
```

or in json format, notice for json the vendor_id/device_id is in base10,
you need to convert it from base16 to base10.

```
{
    "instance_groups": [
        {
            "name": "master",
            "vm_extension": {
                "vmx_options": {
                    "disk.enableUUID": "1"
                }
            }
        },
        {
            "name": "worker-gpu-pool",
            "vm_extension": {
                "cpu": 8,
                "ram": 16384,
                "pci_passthroughs": [
                    {
                        "vendor_id": 4318,
                        "device_id": 7606
                    }
                ],
                "vmx_options": {
                    "disk.enableUUID": "1",
                    "pciPassthru.use64bitMMIO": "TRUE",
                    "pciPassthru.64bitMMIOSizeGB": 128
                }
            }
        }
    ]
}
```

The pool name in the vm_extension has the prefix “worker-” for
corresponding pool name defined in the compute profile. The
pci_passthroughs accepts a list of devices you want to attach to the
worker, you need to lookup the device_id/vendor_id that is present in
your environment. And you need to make sure you have enough GPUs for the
workers. Each worker will need the GPUs defined above, so the required
GPUs = (Number of workers in the pool)\*(Number of GPUs defined in the
vm_extension) It is possible to attach multiple GPUs on the worker so
long as the hardware can satisfy what the worker asks. For example if
you have two GPUs present in every ESXi hosts that hosting the GPU
workers, you can define it in the pci_passthrough section, such as,
since it accepts list:

```
    pci_passthroughs:
    - vendor_id: 0x10de
      device_id: 0x1db6 
    - vendor_id: 0x10de
      device_id: 0x1db6
```

vmx_options section will set extra properties for the GPU worker. -
pciPassthru.use64bitMMIO: ‘TRUE’, for GPUs that require 16 GB or more of
memory mapping, you need to add this option. -
pciPassthru.64bitMMIOSizeGB: 128, this option is for the size of memory
mapped I/O (MMIO), you need to calculate according to the GPU memory on
the card.

The 64bitMMIOSizeGB value is calculated by adding up the total GB of
framebuffer memory on all GPUs attached to the VM. If the total GPU
framebuffer memory falls on a power-of-2, setting
pciPassthru.64bitMMIOSizeGB to the next power of 2 works.

If the total GPU framebuffer memory falls between two powers-of-2, round
up to the next power of 2, then round up again, to get a working
setting.

## <a id="create"></a>Create the Cluster

Now you can create cluster with following commands:

```
tkgi create-compute-profile  ~/work/x/tkgi-gpu/src/tkgi/gpu-compute-profile.json

tkgi create-cluster my-gpu-cluster \
 --external-hostname my-gpu-cluster.example.com \
--plan small \
--compute-profile < compute profile defined above > \
--config-file < path to the vm_extension file save above >
```

## <a id="operator"></a>GPU Operator

To enable GPU integration with the kubernetes environment, Nvidia
provided a
[<u>GPU-Operator</u>](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/overview.html)
helm chart for managing GPUs. It can handle driver life-cycle
management, node labeling, container-toolkit installation etc.

Please follow the GPU-Operator [<u>installation
guide</u>](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/getting-started.html#operator-install-guide)
to install it to the cluster.

Here is an example for typical installation, you can customize the helm
chart installation to suit your needs. You can reference nvidia
documentation for the
[<u>chart-customization-options</u>](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/getting-started.html#chart-customization-options).

```
# install helm if not done already:
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh

# Add the NVIDIA Helm repository:
helm repo add nvidia https://helm.ngc.nvidia.com/nvidia \
    && helm repo update

# Install GPU operator
helm install --wait --generate-name \
  -n gpu-operator --create-namespace \
  nvidia/gpu-operator \
    --set driver.enabled=true \
    --set toolkit.enabled=true \
    --set toolkit.env[0].name=CONTAINERD_CONFIG \
    --set toolkit.env[0].value=/var/vcap/jobs/containerd/config/config.toml \
    --set toolkit.env[1].name=CONTAINERD_SOCKET \
    --set toolkit.env[1].value=/var/vcap/sys/run/containerd/containerd.sock \
    --set toolkit.env[2].name=CONTAINERD_RUNTIME_CLASS \
    --set toolkit.env[2].value=nvidia \
    --set toolkit.env[3].name=CONTAINERD_SET_AS_DEFAULT \
    --set-string toolkit.env[3].value="true"
```

## <a id="custom"></a> Custom Driver Image

You may choose to customize the driver image if default one does not
work, or it does not suit your needs, you can [<u>customize driver
image</u>](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/getting-started.html#running-a-custom-driver-image),
once you choose this path, you need to add the
driver.repository/driver.version options when installing the
gpu-operator.

## <a id="resources"></a> Resources

- [<u>GPU Device in PCI
  Passthrough</u>](https://docs.vmware.com/en/VMware-Edge-Compute-Stack/3.0/ecs-enterprise-edge-ref-arch/GUID-412AD9B3-6B9B-4BE0-B833-9205ACBCF956.html)

- [<u>64bitMMIOSizeGB</u>](https://earlruby.org/2022/02/calculating-the-value-for-64bitmmiosizegb/)

- [<u>PCI
  passthrough</u>](https://knowledge.broadcom.com/external/article/312208/vsphere-vmdirectpath-io-and-dynamic-dire.html)
