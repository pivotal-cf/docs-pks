---
title: TKGI API Authentication
owner: TKGI
---

This topic describes how the VMware Tanzu Kubernetes Grid Integrated Edition API (TKGI API) works with User Account and Authentication (UAA) to manage TKGI deployment authentication and authorization.  

##<a id='authenticating'></a> Authentication of TKGI API Requests

Before users can log in and use the TKGI CLI, you must configure TKGI API access with UAA. For more information, 
see [Managing Tanzu Kubernetes Grid Integrated Edition Users with UAA](manage-users.html) and [Logging in to Tanzu Kubernetes Grid Integrated Edition](login.html).

You use the UAA Command Line Interface (UAAC) to target the UAA server and request an access token for the UAA admin user.
If your request is successful, the UAA server returns the access token.
The UAA admin access token authorizes you to make requests to the TKGI API using the TKGI CLI and grant cluster access to new or existing users.

When a user with cluster access logs in to the TKGI CLI, the CLI requests an access token for the user from the UAA server.
If the request is successful, the UAA server returns an access token to the TKGI CLI.
When the user runs TKGI CLI commands, for example, `tkgi clusters`, the CLI sends the request to the TKGI API server and includes the user's UAA token.

The TKGI API sends a request to the UAA server to validate the user's token.
If the UAA server confirms that the token is valid, the TKGI API uses the cluster information from the TKGI broker to respond to the request.
For example, if the user runs `tkgi clusters`, the CLI returns a list of the clusters that the user is authorized to manage.

##<a id='routing'></a>Routing to the TKGI API VM

The TKGI API server and the UAA server use different port numbers on the API VM.
For example, if your TKGI API domain is `api.tkgi.example.com`, you can reach your TKGI API and UAA servers at the following URLs:

<table>
  <tr>
    <th>Server</th>
    <th>URL</th>
  </tr>
  <tr>
    <td>TKGI API</td>
    <td>api.tkgi.example.com:9021</td>
  </tr>
  <tr>
    <td>UAA</td>
    <td>api.tkgi.example.com:8443</td>
  </tr>
</table>

Refer to **Ops Manager** > **Tanzu Kubernetes Grid Integrated Edition tile** > **TKGI API** > **API Hostname (FQDN)** for your TKGI API domain.

Load balancer implementations differ by deployment environment.
For Tanzu Kubernetes Grid Integrated Edition deployments on AWS or vSphere without NSX, you configure a load balancer to access 
the TKGI API when you install the Tanzu Kubernetes Grid Integrated Edition tile.
For example, see [Configuring TKGI API Load Balancer](./vsphere-configure-api.html).

For overview information about load balancers in Tanzu Kubernetes Grid Integrated Edition, see [Load Balancers in Tanzu Kubernetes Grid Integrated Edition Deployments without NSX](about-lb.html#without-nsx-t).
