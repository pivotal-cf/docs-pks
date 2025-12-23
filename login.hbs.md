---
title: Logging in to Tanzu Kubernetes Grid Integrated Edition

---

This topic describes how to log in to {{  vars.product_full }}.

## <a id='overview'></a>Overview

To manage {{  vars.product }}-deployed clusters, you use the {{ vars.product_short }} Command
Line Interface ({{ vars.product_short }} CLI). When you log in to {{  vars.product }} successfully
for the first time, the {{ vars.product_short }} CLI generates a local `creds.yml` file that contains
the API endpoint, refresh token, access token, and CA certificate, if applicable.

By default, `creds.yml` is saved in the `~/.pks` directory on your local system.
You can use the `PKS_HOME` environment variable to override this location and
store `creds.yml` in any directory on your system.

## <a id='prerequisites'></a>Prerequisites

Before you can log in to {{  vars.product }}, you must have the following:

- A running {{  vars.product }} environment,
including an external load balancer configured to forward traffic to the {{ vars.product_short }} API endpoint. See the _Installing {{  vars.product }}_
section for your cloud provider.
- A user name and password that has access to the {{ vars.product_short }} API.
See [Managing {{  vars.product }} Users with UAA](manage-users.html).
- The {{ vars.product_short }} CLI installed on your local system. See [Installing the {{ vars.product_short }} CLI](installing-cli.html).

## <a id='login'></a>Log in to the {{ vars.product_short }} CLI

Use the command in this section to log in as an individual user.
The login procedure is the same for users created in UAA or users from external LDAP groups.

On the command line, run the following command in your terminal to log in to the {{ vars.product_short }} CLI:

```
tkgi login -a TKGI-API -u USERNAME -p PASSWORD --ca-cert CERT-PATH
```

Where:

* `TKGI-API` is the domain name for the {{ vars.product_short }} API that you entered in **{{ vars.platform_name }}** > **{{  vars.product }}** > **{{ vars.product_short }} API** > **API Hostname (FQDN)**.
For example, `api.tkgi.example.com`.

* `USERNAME` and `PASSWORD` belong to the account you created in the [Grant {{  vars.product }} Access to an Individual User](manage-users.html#uaa-user) section of _Managing {{  vars.product }} Users with UAA_.
If you do not use `-p` to provide a password, the {{ vars.product_short }} CLI prompts for the password interactively.
{{{ vars.recommended_by }}} recommends running the login command without the `-p` flag for added security.

* `CERT-PATH` is the path to your root CA certificate.
Provide the certificate to validate the {{ vars.product_short }} API certificate with SSL.

For example:

```console
$ tkgi login -a api.tkgi.example.com -u alana \
--ca-cert /var/tempest/workspaces/default/root_ca_certificate
```

If you are logging in to a trusted environment, you can use `-k` to skip SSL verification instead of `--ca-cert CERT-PATH`.

For example:

```console
$ tkgi login -a api.tkgi.example.com -u alana -k
```

{{> saml-sso-login }}


##<a id='client'></a> Log in to the {{ vars.product_short }} CLI as an Automated Client

To log in to the {{ vars.product_short }} CLI as an automated client for a script or service, run the following command:

```
tkgi login -a TKGI-API --client-name CLIENT-NAME --client-secret CLIENT-SECRET --ca-cert CERTIFICATE-PATH
```
Where:

* `TKGI-API` is the domain name for the {{ vars.product_short }} API that you entered in **{{ vars.platform_name }}** > **{{  vars.product }}** > **{{ vars.product_short }} API** > **API Hostname (FQDN)**. For example, `api.tkgi.example.com`.
* `CLIENT-NAME` is an OAuth client ID for either:
    - A UAA admin client created with `--authorities "pks.clusters.admin"`
    - The default admin client **Pks Uaa Management Admin Client**
* `CLIENT-SECRET` the OAuth client secret for the `--client-name` value above.
* `CERTIFICATE-PATH` is the path to your root CA certificate.
Provide the certificate to validate the {{ vars.product_short }} API certificate with SSL.

    For example:

    ```console
    $ tkgi login -a api.tkgi.example.com \
    --client-name automated-client \
    --client-secret randomly-generated-secret \
    --ca-cert /var/tempest/workspaces/default/root_ca_certificate
    ```

For information on how to create a UAA client, see
[Grant {{  vars.product }} Access to a Client](manage-users.html#uaa-client)
in _Managing {{  vars.product }} Users with UAA_.

## <a id="tkgi-api-access"></a> Export {{ vars.product_short }} API Access Token

This procedure stores a {{ vars.product_short }} API access token as an environment variable that
you can use when executing {{ vars.product_short }} API calls on the command line.

{{> create-auth-token-var }}


