---
title: Using Proxies with {{  vars.product }} on AWS

topic: proxies-aws
iaas: #Empty var to prevent build breaking
---

This topic describes how HTTP/HTTPS proxies work in {{  vars.product_full }} on AWS,
and how to set proxies globally.

To configure proxy settings specifically for individual TKGI clusters, see [Configure Cluster Proxies](proxies-cluster.html).


##<a id='overview'></a>Overview

If your environment includes HTTP proxies, you can configure {{  vars.product }}
on AWS to use these proxies so that {{  vars.product }}-deployed Kubernetes
control plane and worker nodes access public Internet services and other internal services through a proxy.

In addition, {{  vars.product }} proxy settings apply to the TKGI API instance.
When an {{  vars.product }} operator creates a Kubernetes cluster,
the TKGI API VM behind a proxy is able to manage AWS components on the standard network.

You can also proxy outgoing HTTP/HTTPS traffic from {{ vars.platform_name }} and the BOSH Director so that all
{{  vars.product }} components use the same proxy service.

The following diagram illustrates the network architecture:
<br>
    <img src="images/proxy-arch-global.png" alt="TKGI Proxy Architecture">
    {{{{raw}}}} <!-- = Image source: https://docs.google.com/presentation/d/1p2JE9iP-2Qz6tScmsyMucbaxKWYetMpG4eFhSPXgeZA/edit#slide=id.g8067ceefc5_1_0  --> {{{{/raw}}}}

## <a id='tkgi-nsxt-proxy'></a>Enable TKGI API and Kubernetes Proxy

To configure a global HTTP proxy for all outgoing HTTP/HTTPS traffic from the Kubernetes cluster nodes and the TKGI API server, perform the following steps:

1. Navigate to {{ vars.platform_name }} and log in.

1. Click the **{{  vars.product }}** tile.

1. Click **Networking**.
1. Under **HTTP/HTTPS Proxy**, select **Enabled** to configure an {{  vars.product }} global proxy
for all outgoing HTTP and HTTPS traffic from your Kubernetes clusters.
{{> global-proxy }}

1. To save your changes to the TKGI tile, click **Save**.
1. Proceed with any remaining {{  vars.product }} tile configurations and deploy {{  vars.product }}.
See <a href="./installing-aws.html">Installing {{  vars.product }} on AWS</a>.

## <a id='tkgi-om-bosh-proxy'></a>Enable {{ vars.platform_name }} and BOSH Proxy

{{> proxy-ops-man }}

