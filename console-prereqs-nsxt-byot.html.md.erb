---
title: Prerequisites for a Bring Your Own Topology Deployment to VMware NSX
owner: TKGI
---

This topic provides requirements for installing the Tanzu Kubernetes Grid Integrated Edition Management Console (TKGI MC) 
in a bring your own topology environment.

##<a id='overview'></a> Overview

A bring your own topology environment is an VMware NSX instance that you have fully configured yourself for use with Tanzu Kubernetes Grid Integrated Edition. 
For example, an VMware NSX instance that you have used in a previous deployment of Tanzu Kubernetes Grid Integrated Edition.  

The following objects must be in place before you start a production deployment.

- 3 NSX Manager Nodes deployed
- NSX Management Cluster formed
- Virtual IP address assigned for Management Cluster or load balancer

For information about the supported versions of VMware NSX, see the [release notes](./release-notes.html).  

<p class="note"><strong>Note</strong>: In BYOT mode, Tanzu Kubernetes Grid Integrated Edition Management Console automatically retrieves the tier0 HA mode from your VMware NSX environment and 
creates NAT rules on the tier 0 or tier 1 router.</p>

## <a id='general-requirements'></a> General Requirements

The following are requirements for deploying the Tanzu Kubernetes Grid Integrated Edition Management Console:  

- Do not use the network on which you deploy the Tanzu Kubernetes Grid Integrated Edition Management Console VM 
as the network for the management plane when you deploy Tanzu Kubernetes Grid Integrated Edition. 
    <p class="note"><strong>Note</strong>: Using the same network for the management console VM 
    and the management plane requires additional VMware NSX configuration and is not recommended.</p>
- A router. The TKGI Management Console supports Tier-0 and Tier-1 routers in either Active-Active or Active-Standby mode.
    <p class="note"><strong>Note</strong>: If you are deploying Tanzu Kubernetes Grid Integrated Edition in a multiple-tier0 topology, 
    	additional post-deployment configuration of the management console VM is required. For information, 
    	see <a href="console-troubleshooting.html#multi-T0-deployments">Tanzu Kubernetes Grid Integrated Edition Management Console Cannot Retrieve Cluster Data in a Multi-Tier0 Topology</a> 
    	in <em>Troubleshooting the Management Console</em>.</p>

- A logical switch on an NSX Virtual Distributed Switch (N-VDS) for use by the TKGI management plane is prepared. The switch must be either under the Tier-0 router, or under the Tier-1 router if the Tier-1 router is directly under the Tier-0 router.
- Edge Cluster with at least 2 VMware NSX Edge Nodes configured with connectivity to an uplink network.  
- Overlay Transport Zone created, with the edge nodes included.
- VLAN Transport Zone created, with the edge nodes included.
- MTU of all transport nodes and physical interfaces configured to 1600 or more.
- In NSX-T 3.0, you can create host transport nodes by installing NSX on a VDS switch. The NSX logical switch is created on the VDS as a distributed virtual port group.
- If your VMware NSX environment uses custom certificates, obtain the CA certificate for NSX Manager.
    <p class="note"><strong>Note</strong>: If VMware NSX uses custom certificates and you do not provide the CA certificate for NSX Manager, 
    	Tanzu Kubernetes Grid Integrated Edition Management Console automatically generates one and registers it with NSX Manager. 
    This can cause other services that are integrated with NSX Manager not to function correctly.</p>

## <a id='nsxt-config-requirements'></a> VMware NSX Configuration Requirements

The following are VMware NSX requirements for deploying the Tanzu Kubernetes Grid Integrated Edition Management Console: 

- Virtual IP for the Tier-0 Router configured
- Floating IP Pool configured
- Pod IP Block ID created
- Node IP Block ID created
- Logical Switch configured for TKGI Management Plane
- Tier-1 Router configured and connected to the Tier-0 Router
- Routing for TKGI Floating IPs configured to point to the Tier-0 HA Virtual IP

## <a id='poc-deployments'></a>Proof-of-Concept Deployments

The requirements above are for production environments. In proof-of-concept deployments one NSX Manager node is sufficient. The NSX management cluster and load balancer are also optional for proof-of-concept deployments.
