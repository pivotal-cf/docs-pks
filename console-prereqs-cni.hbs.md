---
title: Prerequisites for vSphere (Antrea Networking)
owner: TKGI
---

To deploy Tanzu Kubernetes Grid Integrated Edition on vSphere with Antrea container networking, you can select the option for Tanzu Kubernetes Grid Integrated Edition Management Console to provision an Antrea CNI for you during Tanzu Kubernetes Grid Integrated Edition deployment on vSphere.

Obtain the following IP addresses to use for deployment to vSphere without an NSX network:

- DNS server, subnet, subnet mask, and gateway of the network on which to deploy Tanzu Kubernetes Grid Integrated Edition
- DNS server, subnet, subnet mask, and gateway of the vSphere without NSX service network
- Subnet range and subnet mask for the Kubernetes pod and Kubernetes service networks
