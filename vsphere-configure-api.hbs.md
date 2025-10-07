---
title: Configuring a TKGI API Load Balancer

iaas: vSphere
---

This topic describes how to configure an external load balancer for the {{  vars.product_full }} Control Plane (TKGI API).

## <a id='overview'></a> Overview

You must configure an external load balancer to make the TKGI API accessible from outside the network.
This external load balancer forwards traffic to the TKGI API endpoint on ports 8443 and 9021.
You can use any external load balancer for the TKGI API.

To set up an external load balancer for the TKGI API, do the following after you install the {{  vars.product }} tile:

1. [Retrieve the TKGI API Endpoint](#retrieve-tkgi-api)
1. [Configure an External Load Balancer](#loadbalancer-tkgi-api)

## <a id='prerequisites'></a> Prerequisites

Before configuring an external load balancer for the TKGI API, you must have the following:

* The TKGI API certificate that you provided in the **{{  vars.product }}** tile > **TKGI API** > **Certificate to secure the TKGI API**.
* The TKGI API hostname that you entered in the **{{  vars.product }}** tile > **TKGI API** > **API Hostname (FQDN)**.

## <a id='retrieve-tkgi-api'></a> Step 1: Retrieve the TKGI API Endpoint

{{> share-endpoint }}


## <a id='loadbalancer-tkgi-api'></a>Step 2: Configure an External Load Balancer

To set up an external load balancer for the TKGI API, configure the external load balancer to resolve to the domain name you entered in the **{{  vars.product }}** tile > **TKGI API** > **API Hostname (FQDN)**
using the following information:

  - IP address from [Retrieve TKGI API Endpoint](#retrieve-tkgi-api)
  - Ports 8443 and 9021
  - HTTPS or TCP protocol

## <a id='next-install-step'></a> Next Installation Step

To set up {{  vars.product }} admin users who can create and manage Kubernetes clusters, follow the instructions
in [Setting Up {{  vars.product }} Admin Users on vSphere](vsphere-configure-users.html).
