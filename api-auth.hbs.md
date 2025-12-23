---
title: {{ vars.product_short }} API Authentication
---

This topic describes how the {{  vars.product_full }} API ({{ vars.product_short }} API) works with User Account and Authentication (UAA) to manage {{ vars.product_short }} deployment authentication and authorization.

##<a id='authenticating'></a> Authentication of {{ vars.product_short }} API Requests

Before users can log in and use the {{ vars.product_short }} CLI, you must configure {{ vars.product_short }} API access with UAA. For more information,
see [Managing {{  vars.product }} Users with UAA](manage-users.html) and [Logging in to {{  vars.product }}](login.html).

You use the UAA Command Line Interface (UAAC) to target the UAA server and request an access token for the UAA admin user.
If your request is successful, the UAA server returns the access token.
The UAA admin access token authorizes you to make requests to the {{ vars.product_short }} API using the {{ vars.product_short }} CLI and grant cluster access to new or existing users.

When a user with cluster access logs in to the {{ vars.product_short }} CLI, the CLI requests an access token for the user from the UAA server.
If the request is successful, the UAA server returns an access token to the {{ vars.product_short }} CLI.
When the user runs {{ vars.product_short }} CLI commands, for example, `tkgi clusters`, the CLI sends the request to the {{ vars.product_short }} API server and includes the user's UAA token.

The {{ vars.product_short }} API sends a request to the UAA server to validate the user's token.
If the UAA server confirms that the token is valid, the {{ vars.product_short }} API uses the cluster information from the {{ vars.product_short }} broker to respond to the request.
For example, if the user runs `tkgi clusters`, the CLI returns a list of the clusters that the user is authorized to manage.

##<a id='routing'></a>Routing to the {{ vars.product_short }} API VM

The {{ vars.product_short }} API server and the UAA server use different port numbers on the API VM.
For example, if your {{ vars.product_short }} API domain is `api.tkgi.example.com`, you can reach your {{ vars.product_short }} API and UAA servers at the following URLs:

<table>
  <tr>
    <th>Server</th>
    <th>URL</th>
  </tr>
  <tr>
    <td>{{ vars.product_short }} API</td>
    <td>api.tkgi.example.com:9021</td>
  </tr>
  <tr>
    <td>UAA</td>
    <td>api.tkgi.example.com:8443</td>
  </tr>
</table>

Refer to **{{ vars.platform_name }}** > **{{  vars.product }} tile** > **{{ vars.product_short }} API** > **API Hostname (FQDN)** for your {{ vars.product_short }} API domain.

Load balancer implementations differ by deployment environment.
For {{  vars.product }} deployments on AWS or vSphere without NSX, you configure a load balancer to access
the {{ vars.product_short }} API when you install the {{  vars.product }} tile.
For example, see [Configuring {{ vars.product_short }} API Load Balancer](./vsphere-configure-api.html).

For overview information about load balancers in {{  vars.product }}, see [Load Balancers in {{  vars.product }} Deployments without NSX](about-lb.html#without-nsx-t).
