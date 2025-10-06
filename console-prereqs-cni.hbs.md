---
title: Prerequisites for vSphere (Antrea Networking)

---

To deploy {{  vars.product }} on vSphere with Antrea container networking, you can select the option for {{  vars.product }} Management Console to provision an Antrea CNI for you during {{  vars.product }} deployment on vSphere.

Obtain the following IP addresses to use for deployment to vSphere without an NSX network:

- DNS server, subnet, subnet mask, and gateway of the network on which to deploy {{  vars.product }}
- DNS server, subnet, subnet mask, and gateway of the vSphere without NSX service network
- Subnet range and subnet mask for the Kubernetes pod and Kubernetes service networks
