---
title: Firewall Ports and Protocols Requirements (Antrea Networking)

netenv: antrea
---

This topic describes the firewall ports and protocols requirements for using {{  vars.product_full }}
with Antrea container networking.

If you are using {{ vars.product_short }} on vSphere, see one of the follow topics instead:

* [Firewall Ports and Protocols Requirements for vSphere with NSX](ports-protocols-nsx-t.html)
* [Firewall Ports and Protocols Requirements for vSphere (Antrea Networking)](ports-protocols-wo-nsx-t.html)


## <a id="overview"></a> Overview

Apps frequently require the ability to pass internal communication between system components on
different networks.

Firewalls and Kubernetes NetworkPolicy are used to filter traffic and limit access in environments with strict
inter-network access control policies and your apps require one or more conduits through a secured environment's firewalls.

{{{ vars.recommended_by }}} recommends that you enable access to the apps through the standard Kubernetes load-balancers and ingress controller types, instead of using a Kubernetes NetworkPolicy to filter traffic between networks and {{ vars.product_short }} system components and clusters.
This enables you to designate specific ports and protocols as a firewall conduit.

Consult the following tables when configuring port settings to install or upgrade {{ vars.product_short }}
or configure a Kubernetes cluster:

* [{{ vars.product_short }} Users Ports and Protocols](#users)
* [{{ vars.product_short }} Core Ports and Protocols](#core)
* [Antrea Networking Ports and Protocols](#antrea)

<p class="note"><strong>Note</strong>: To control which groups access deploying and scaling
your organization's {{  vars.product }}-deployed Kubernetes clusters, configure your firewall settings
as described on the Operator –> {{ vars.product_short }} API server lines below.</p>

{{> ports-protocols }}

