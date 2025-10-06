---
title: Network Planning for Installing Tanzu Kubernetes Grid Integrated Edition with VMware NSX
owner: TKGI
---

This topic describes how to plan your environment before installing VMware Tanzu Kubernetes Grid Integrated Edition (TKGI) on VMware vSphere with NSX integration.  


+ACMAIwA8-a id+AD0-'overview'+AD4APA-/a+AD4-Overview

Before installing VMware Tanzu Kubernetes Grid Integrated Edition on VMware vSphere with NSX integration, plan your environment as described in the following sections:  

+ACo- +AFs-Prerequisites+AF0-(+ACM-prerequisites)  
+ACo- +AFs-Understand Component Interactions+AF0-(+ACM-components)  
+ACo- +AFs-Plan Deployment Topology+AF0-(+ACM-plan-topology)  
+ACo- +AFs-Plan Network CIDRs+AF0-(+ACM-plan-cidrs)  
+ACo- +AFs-Gather Other Required IP Addresses+AF0-(+ACM-plan-ip-blocks)  




+ACMAIwA8-a id+AD0-'prerequisites'+AD4APA-/a+AD4-Prerequisites

Familiarize yourself with the following VMware documentation:

+ACo- +AFs-vSphere, vCenter, vSAN, and ESXi documentation+AF0-(https://techdocs.broadcom.com/us/en/vmware-cis/vsphere.html)
+ACo- +AFs-VMware NSX Documentation+AF0-(https://techdocs.broadcom.com/us/en/vmware-cis/nsx.html)
+ACo- +AFs-NSX Container Plugin (NCP) documentation+AF0-(https://techdocs.broadcom.com/us/en/vmware-cis/nsx/event-catalog/4-2/nsx-container-plugin-for-kubernetes-and-tanzu-application-service.html)

Familiarize yourself with the following related documentation:  

+ACo- +AFsAewB7AHs- vars.platform+AF8-name +AH0AfQB9- documentation+AF0-(https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/vsphere-deploy.html)  
+ACo- +AFs-BOSH documentation+AF0-(https://bosh.io/docs/bosh-components/)  
+ACo- +AFs-Kubernetes documentation+AF0-(https://kubernetes.io/docs/home/)  
+ACo- +AFs-containerd documentation+AF0-(https://containerd.io/docs/)  

Review the following Tanzu Kubernetes Grid Integrated Edition documentation:

+ACo- +AFs-VMware vSphere with NSX Version Requirements+AF0-(vsphere-nsxt-requirements.html)
+ACo- +AFs-Hardware Requirements for Tanzu Kubernetes Grid Integrated Edition on VMware vSphere with NSX+AF0-(vsphere-nsxt-rpd-mpd.html)
+ACo- +AFs-VMware Ports and Protocols+AF0-(https://ports.vmware.com/home/vSphere+NSU-Data-Center-for-vSphere+NSU-Data-Center)
on the VMware site.
+ACo- +AFs-Network Objects Created by NSX for Tanzu Kubernetes Grid Integrated Edition+AF0-(./vsphere-nsxt-cluster-objects.html)


+ACMAIwA8-a id+AD0-'components'+AD4APA-/a+AD4-Understand Component Interactions

Tanzu Kubernetes Grid Integrated Edition on VMware vSphere with NSX requires the following component interactions:

+ACo- vCenter, NSX Manager Nodes, NSX Edge Nodes, and ESXi hosts must be able to communicate with each other.
+ACo- The BOSH Director VM must be able to communicate with vCenter and the NSX Management Cluster.
+ACo- The BOSH Director VM must be able to communicate with all nodes in all Kubernetes clusters.
+ACo- Each Tanzu Kubernetes Grid Integrated Edition-provisioned Kubernetes cluster deploys the NSX Node Agent and the Kube Proxy that run as BOSH-managed processes on each worker node.
+ACo- NCP runs as a BOSH-managed process on the Kubernetes control plane node. In a multi-control plane node deployment, the NCP process runs on all control plane nodes, but is active only on one control plane node. If the NCP process on an active control plane node is unresponsive, BOSH activates another NCP process.


+ACMAIwA8-a id+AD0-'plan-topology'+AD4APA-/a+AD4-Plan Deployment Topology

Review the +AFs-Deployment Topologies+AF0-(nsxt-topologies.html) for Tanzu Kubernetes Grid Integrated Edition on VMware vSphere with NSX. The most common deployment topology is the +AFs-NAT topology+AF0-(./nsxt-topologies.html+ACM-topology-nat). Decide which deployment topology you will implement, and plan accordingly. 


+ACMAIwA8-a id+AD0-'plan-cidrs'+AD4APA-/a+AD4-Plan Network CIDRs

Before you install Tanzu Kubernetes Grid Integrated Edition on VMware vSphere with NSX, plan the CIDRs and IP blocks that you are using in your deployment.

Plan for the following network CIDRs in the IPv4 address space according to the instructions in +AFs-VMware NSX documentation+AF0-(https://techdocs.broadcom.com/us/en/vmware-cis/nsx.html):  

+ACo- +ACoAKg-VTEP CIDRs+ACoAKg-: One or more of these networks host your GENEVE Tunnel Endpoints on your NSX Transport Nodes. Size the networks to support all of your expected Host and Edge Transport Nodes. For example, a CIDR of +AGA-192.168.1.0/24+AGA- provides 254 usable IPs.

+ACo- +ACoAKg-TKGI MANAGEMENT CIDR+ACoAKg-: This small network is used to access Tanzu Kubernetes Grid Integrated Edition management components such as +AHsAewB7- vars.platform+AF8-name +AH0AfQB9-, BOSH Director, and Tanzu Kubernetes Grid Integrated Edition VMs as well as the Harbor Registry VM if deployed. For example, a CIDR of +AGA-10.172.1.0/28+AGA- provides 14 usable IPs. For the +AFs-No-NAT deployment topologies+AF0-(nsxt-topologies.html+ACM-topology-no-nat-virtual-switch), this is a corporate routable subnet /28. For the +AFs-NAT deployment topology+AF0-(nsxt-topologies.html+ACM-topology-nat), this is a non-routable subnet /28, and DNAT needs to be configured in NSX to access the Tanzu Kubernetes Grid Integrated Edition management components.

+ACo- +ACoAKg-TKGI LB CIDR+ACoAKg-: This network provides your load balancing address space for each Kubernetes cluster created by Tanzu Kubernetes Grid Integrated Edition. The network also provides IP addresses for Kubernetes API access and Kubernetes exposed services. For example, +AGA-10.172.2.0/24+AGA- provides 256 usable IPs. This network is used when creating the +AGA-ip-pool-vips+AGA- described in +AFs-Creating VMware NSX Objects for Tanzu Kubernetes Grid Integrated Edition+AF0-(nsxt-create-objects.html), or when the services are deployed. You enter this network in the
+ACoAKg-Floating IP Pool ID+ACoAKg- field in the +ACoAKg-Networking+ACoAKg- pane of the Tanzu Kubernetes Grid Integrated Edition tile.


+ACMAIwA8-a id+AD0-'plan-ip-blocks'+AD4APA-/a+AD4-Plan IP Blocks

When you install Tanzu Kubernetes Grid Integrated Edition on VMware NSX, you are required to specify the +ACoAKg-Pods IP Block ID+ACoAKg- and +ACoAKg-Nodes IP Block ID+ACoAKg- in the +ACoAKg-Networking+ACoAKg- pane of the Tanzu Kubernetes Grid Integrated Edition tile. 

+ACoAKg-Pods IP Block ID+ACoAKg- and +ACoAKg-Nodes IP Block ID+ACoAKg- IDs map to the two IP blocks you must configure in VMware NSX: the Pods IP Block for Kubernetes pods, and the Node IP Block for Kubernetes nodes (VMs).  

To configure +ACoAKg-Pods IP Block ID+ACoAKg- and +ACoAKg-Nodes IP Block ID+ACoAKg-:  

+ACo- +AFs-Plan IP Blocks+AF0-(+ACM-plan-ip-blocks)  
+ACo- +AFs-Pods IP Block+AF0-(+ACM-pods-ip-block)  
+ACo- +AFs-Nodes IP Block+AF0-(+ACM-nodes-ip-block)  
+ACo- +AFs-Reserved IP Blocks+AF0-(+ACM-reserved-ip-blocks)  

For more information, see the +AFs-Networking+AF0-(installing-nsx-t.html+ACM-networking) section of +AF8-Installing Tanzu Kubernetes Grid Integrated Edition on VMware vSphere with NSX Integration+AF8-.  

  +ADw-img src+AD0AIg-images/nsxt/nsxt-ip-blocks.png+ACI- alt+AD0AIg-Required IP Blocks for VMware NSX.+ACIAPg-


+ACMAIwAjADw-a id+AD0-'pods-ip-block'+AD4APA-/a+AD4-Pods IP Block

Each time a Kubernetes namespace is created, a subnet from the +ACoAKg-Pods IP Block+ACoAKg- is allocated. The subnet size carved out from this block is /24, which means a maximum of 256 pods can be created per namespace. 

When a Kubernetes cluster is deployed by Tanzu Kubernetes Grid Integrated Edition, by default 3 namespaces are created. Often additional namespaces will be created by operators to facilitate cluster use. As a result, when creating the +ACoAKg-Pods IP Block+ACoAKg-, you must use a CIDR range larger than /24 to ensure that NSX has enough IP addresses to allocate for all pods. The recommended size is /16. For more information, see +AFs-Creating VMware NSX Objects for Tanzu Kubernetes Grid Integrated Edition+AF0-(nsxt-create-objects.html).  

+ADw-p class+AD0AIg-note+ACIAPgA8-strong+AD4-Note+ADw-/strong+AD4-: By default, +ADw-strong+AD4-Pods IP Block+ADw-/strong+AD4- is a block of non-routable, private IP addresses.
After you deploy Tanzu Kubernetes Grid Integrated Edition, you can define a network profile that specifies a routable IP block for your pods.
The routable IP block overrides the default non-routable +ADw-strong+AD4-Pods IP Block+ADw-/strong+AD4- when a Kubernetes cluster is deployed using that network profile. For more information, see +ADw-a href+AD0AIg-network-profiles.html+ACM-routable-pods+ACIAPg-Routable Pods+ADw-/a+AD4- in +ADw-em+AD4-Using Network Profiles (VMware NSX Only)+ADw-/em+AD4-.+ADw-/p+AD4-

  +ADw-img src+AD0AIg-images/nsxt/pods-ip-block.png+ACI- alt+AD0AIg-Pods IP Block+ACIAPg-

+ACMAIwAjADw-a id+AD0-'nodes-ip-block'+AD4APA-/a+AD4-Nodes IP Block

Each Kubernetes cluster deployed by Tanzu Kubernetes Grid Integrated Edition owns a /24 subnet.  

To deploy multiple Kubernetes clusters, set the +ACoAKg-Nodes IP Block ID+ACoAKg- in the +ACoAKg-Networking+ACoAKg- pane of the Tanzu Kubernetes Grid Integrated Edition tile to larger than /24. The recommended size is /16. For more information, see +AFs-Creating VMware NSX Objects for Tanzu Kubernetes Grid Integrated Edition+AF0-(nsxt-create-objects.html).  

+ADw-p class+AD0AIg-note+ACIAPgA8-strong+AD4-Note+ADw-/strong+AD4-: You can use a smaller nodes block size for no-NAT environments with a limited number of routable subnets.
For example, /20 allows up to 16 Kubernetes clusters to be created.+ADw-/p+AD4-

  +ADw-img src+AD0AIg-images/nsxt/nodes-ip-block.png+ACI- alt+AD0AIg-Nodes IP Block+ACIAPg-


+ACMAIwAjADw-a id+AD0-'reserved-ip-blocks'+AD4APA-/a+AD4-Reserved IP Blocks

TKGI reserves several CIDR blocks and IP addresses for internal use. 
When deploying TKGI, do not use a reserved IP address or CIDR block.  

+ADw-p class+AD0AIg-note warning+ACIAPgA8-strong+AD4-Note:+ADw-/strong+AD4- 
+ADw-strong+AD4-Do not use reserved IP addresses or CIDR blocks when configuring TKGI+ADw-/strong+AD4-.
+ADw-/p+AD4-
+ADw-table+AD4-
  +ADw-tr+AD4-
    +ADw-th+AD4-Reserved Address/Range+ADw-/th+AD4-
    +ADw-th+AD4-Component+ADw-/th+AD4-
    +ADw-th+AD4-Customizable+ADw-/th+AD4-
    +ADw-th+AD4-Description+ADw-/th+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4APA-code+AD4-10.100.200.0/24+ADw-/code+AD4APA-/td+AD4-
    +ADw-td+AD4-Nodes IP Block+ADw-/td+AD4-
    +ADw-td+AD4-No.+ADw-/td+AD4-
    +ADw-td+AD4-Each Kubernetes cluster uses the +ADw-code+AD4-10.100.200.0/24+ADw-/code+AD4- subnet for Kubernetes services.
        +ADw-br+AD4APA-br+AD4-Do not use this IP range for the Nodes IP Block.+ADw-/td+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4APA-code+AD4-172.17.0.0/16+ADw-/code+AD4APA-/td+AD4-
    +ADw-td+AD4-Worker node VM+ADw-/td+AD4-
    +ADw-td+AD4-No.+ADw-/td+AD4-
    +ADw-td+AD4-
      containerd is installed on each Tanzu Kubernetes Grid Integrated Edition worker node and is assigned the +ADw-code+AD4-172.17.0.0/16+ADw-/code+AD4- network interface.
      +ADw-br+AD4APA-br+AD4-Do not use this CIDR range for any TKGI component, including +AHsAewB7- vars.platform+AF8-name +AH0AfQB9-, BOSH Director, the TKGI API VM, the TKGI DB VM, and the Harbor Registry VM. 
      Note: This range is also reserved for the Management Console VM, but is unused. 
    +ADw-/td+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4APA-code+AD4-172.17.0.0/16+ADw-/code+AD4APA-/td+AD4-
    +ADw-td+AD4-Management Console VM+ADw-/td+AD4-
    +ADw-td+AD4-No.+ADw-/td+AD4-
    +ADw-td+AD4-The TKGI Management Console VM also reserves an unused +ADw-em+AD4-docker0+ADw-/em+AD4- interface on +ADw-code+AD4-172.17.0.0/16+ADw-/code+AD4-. This cannot be customized.+ADw-/td+AD4-
  +ADw-/tr+AD4-  
  +ADw-tr+AD4-
    +ADw-td+AD4APA-code+AD4-172.18.0.0/16+ADw-/code+AD4APA-/td+AD4-
    +ADw-td+AD4-Management Console VM+ADw-/td+AD4-
    +ADw-td+AD4-Yes.+ADw-br+AD4-See OVA configuration.+ADw-/td+AD4-
    +ADw-td+AD4-
      The Tanzu Kubernetes Grid Integrated Edition Management Console runs the Docker daemon and reserves +ADw-code+AD4-172.18.0.0/16+ADw-/code+AD4- for the subnet. 
      +ADw-br+AD4APA-br+AD4-Do not use this CIDR range unless you customize them during OVA configuration.
    +ADw-/td+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4APA-code+AD4-172.18.0.1+ADw-/code+AD4APA-/td+AD4-
    +ADw-td+AD4-Management Console VM+ADw-/td+AD4-
    +ADw-td+AD4-Yes.+ADw-br+AD4-See OVA configuration.+ADw-/td+AD4-
    +ADw-td+AD4-
      The Tanzu Kubernetes Grid Integrated Edition Management Console runs the Docker daemon and reserves +ADw-code+AD4-172.18.0.1+ADw-/code+AD4- for the gateway. 
      +ADw-br+AD4APA-br+AD4-Do not use this CIDR range or IP address unless you customize them during OVA configuration.
    +ADw-/td+AD4-
  +ADw-/tr+AD4-
  +ADw-tr+AD4-
    +ADw-td+AD4APA-code+AD4-172.20.0.0/16+ADw-/code+AD4APA-/td+AD4-
    +ADw-td+AD4-Harbor Registry VM +ADw-/td+AD4-
    +ADw-td+AD4-Yes.+ADw-br+AD4-See Harbor tile +AD4- Networking.+ADw-/td+AD4-
    +ADw-td+AD4-The Harbor Registry requires IP blocks in the range +ADw-code+AD4-172.20.0.0/16+ADw-/code+AD4-.  
      +ADw-br+AD4APA-br+AD4-Do not use this CIDR range, unless you change it in the 
      +AFs-Harbor tile configuration+AF0-(https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/installing.html+ACM-configure+AF8-networking).
    +ADw-/td+AD4-
  +ADw-/tr+AD4-
+ADw-/table+AD4-


+ACMAIwA8-a id+AD0-'plan-ip-blocks'+AD4APA-/a+AD4-Gather Other Required IP Addresses

To install Tanzu Kubernetes Grid Integrated Edition on vSphere with VMware NSX, you will need to know the following:

+ACo- Subnet name where you will install Tanzu Kubernetes Grid Integrated Edition
+ACo- VLAN ID for the subnet
+ACo- CIDR for the subnet
+ACo- Netmask for the subnet
+ACo- Gateway for the subnet
+ACo- DNS server for the subnet
+ACo- NTP server for the subnet
+ACo- IP address and CIDR you plan to use for the VMware NSX Tier-0 Router 
