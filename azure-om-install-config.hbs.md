---
title: Installing and Configuring {{ vars.platform_name }} on Azure
owner: {{ vars.platform_name }}
---

This topic describes how to install and configure {{ vars.platform_name }} on Microsoft Azure
before deploying {{  vars.product_full }} ({{ vars.product_short }}).

## <a id='overview'></a> Overview

Use {{ vars.platform_name }} to install and configure TKGI.

{{ vars.platform_name }} provides a dashboard UI for installing applications and components.
{{ vars.platform_name }} and the installed components include an interface for configuring the {{ vars.platform_name }} environment, component settings, and cluster configurations.

To install {{ vars.platform_name }}:

1. [Prerequisites](#prerequisites)
1. [Install and Configure {{ vars.platform_name }}](#install-om)

## <a id='prerequisites'></a>Prerequisites

Before installing {{ vars.platform_name }}, review [Azure Prerequisites and Resource Requirements](azure-requirements.html).

## <a id="install-om"></a>Install and Configure {{ vars.platform_name }}

To install {{ vars.platform_name }}:

1. Determine the most recent version of {{ vars.platform_name }} that is compatible with the TKGI version you are deploying.
For information on {{ vars.platform_name }} compatibility with TKGI,
see [{{{ vars.product_network }}}](https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.23.0).

1. To install and configure {{ vars.platform_name }}, follow the installation instructions for your selected {{ vars.platform_name }} version:

    <table>
      <tr>
        <th>Version</th>
        <th>Instructions</th>
      </tr>
        <tr>
        <td>{{ vars.platform_name }} v3.1</td>
        <td>
          <ol>
            <li><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/azure-prepare-env-manual.html">Preparing to Deploy {{ vars.platform_name }} on Azure</a></li>
            <li><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/azure-deploy-manual.html">Deploying {{ vars.platform_name }} on Azure</a></li>
            <li><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/azure-config-manual.html">Configuring BOSH Director on Azure</a></li>
          </ol>
        </td>
      </tr>
      <tr>
        <td>{{ vars.platform_name }} v3.0</td>
        <td>
          <ol>
            <li><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/azure-prepare-env-manual.html">Preparing to Deploy {{ vars.platform_name }} on Azure</a></li>
            <li><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/azure-deploy-manual.html">Deploying {{ vars.platform_name }} on Azure</a></li>
            <li><a href="https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-0/tanzu-ops-manager/azure-config-manual.html">Configuring BOSH Director on Azure</a></li>
          </ol>
        </td>
      </tr>
    </table>

## <a id="next-steps"></a>Next Installation Step

To create managed identities for {{  vars.product }},
follow the instructions in [Creating Managed Identities in Azure for {{  vars.product }}](azure-managed-identities.html).
