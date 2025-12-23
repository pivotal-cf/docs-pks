---
title: Installing the TKGI CLI

---

This topic describes how to install the {{  vars.product_full }} Command Line Interface
({{ vars.product_short }} CLI).


## <a id="overview"></a>Overview

The [{{ vars.product_short }} CLI](cli/index.html) is a command-line tool
to manage {{  vars.product }} provisioned Kubernetes clusters.
Use the {{ vars.product_short }} CLI to create, manage, and delete Kubernetes clusters.

For more information on the {{ vars.product_short }} CLI, see [{{ vars.product_short }} CLI](cli/index.html).

To download and install the {{ vars.product_short }} CLI, complete the steps in [Install the {{ vars.product_short }} CLI](#install) below.

<p class="note"><strong>Note:</strong> {{ vars.product_short }} CLI binaries are only provided for 64-bit architectures.</p>



## <a id="install"></a>Install the {{ vars.product_short }} CLI

To download and install the {{ vars.product_short }} CLI:

1. Log in to <a href="https://support.broadcom.com/">Broadcom Support</a> and navigate to **Software** > **Tanzu** > **My Downloads** > [{{  vars.product }} (TKGi) - CLI & Tile](https://support.broadcom.com/group/ecx/productfiles?subFamily=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&displayGroup=Tanzu%20Kubernetes%20Grid%20Integrated%20Edition%20(TKGi)%20-%20CLI%20%26%20Tile&release=1.23.0)
1. Click **{{  vars.product }} (TKGi) - CLI & Tile** and select your desired release version.
1. Enable the **I agree to the Terms and Conditions** checkbox and click the **{{ vars.product_short }} CLI** download link for your operating system:

    * **Mac OS X**: Click <strong>{{ vars.product_short }} CLI - Mac</strong> to download the Mac OS X binary.
    * **Linux**: Click <strong>{{ vars.product_short }} CLI - Linux</strong> to download the Linux binary.
    * **Windows**: Click <strong>{{ vars.product_short }} CLI - Windows</strong> to download the Windows executable file.
1. To install the {{ vars.product_short }} CLI, follow the procedures for your operating system:

    * [Mac OS X](#mac)
    * [Linux](#linux)
    * [Windows](#windows)


### <a id='mac'></a> Mac OS X

To install the {{ vars.product_short }} CLI on Mac OS X:

<ol><li>Rename the downloaded binary file to <code>tkgi</code>.</li>
<li>On the command line, run the following command to make the {{ vars.product_short }} CLI binary executable:
  <code>$ chmod +x tkgi</code></li>
<li>Move the binary file into your <code>PATH</code>.</li>
<li>Run <code>tkgi --version</code> to verify the version of your {{ vars.product_short }} CLI installed locally.</li>
</ol>

### <a id='linux'></a> Linux

To install the {{ vars.product_short }} CLI on Linux:

<ol><li>Rename the downloaded binary file to <code>tkgi</code>.</li>
<li>On the command line, run the following command to make the {{ vars.product_short }} CLI binary executable:
  <code>$ chmod +x tkgi</code></li>
<li>Move the binary file into your <code>PATH</code>.</li>
<li>Run <code>tkgi --version</code> to verify the version of your {{ vars.product_short }} CLI installed locally.</li>
</ol>

### <a id='windows'></a> Windows

To install the {{ vars.product_short }} CLI on Microsoft Windows:

<ol><li>Rename the downloaded binary file to <code>tkgi.exe</code>.</li>
<li>Move the binary file into your <code>PATH</code>.</li>
<li>Run <code>tkgi --version</code> to verify the version of your {{ vars.product_short }} CLI installed locally.</li>
</ol>
