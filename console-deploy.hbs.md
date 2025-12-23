---
title: Deploy Tanzu Kubernetes Grid Integrated Edition from the Management Console

---

You can deploy a new {{  vars.product_full }} instance on vSphere either by using the {{  vars.product_full }} Management Portal configuration wizard to guide you through the configuration process, or by importing an existing YAML configuration file into the YAML editor.

- [Deploy {{  vars.product }} by Using the Configuration Wizard](console-deploy-wizard.html)
- [Deploy {{  vars.product }} by Importing a YAML Configuration File](console-deploy-yaml.html)

If you deploy  TKGI with plans that use Windows worker nodes, further configuration is required. See <a href="console-windows-workers.html">Enable Plans with Windows Worker Nodes</a> for information about how to install a Windows Server stemcell and other necessary configuration actions that you must perform after you deploy {{  vars.product }}.

## <a id='ops-man'></a>Additional {{ vars.platform_name }} Configurations

The Management Console takes values entered into the configuration wizard and sets them in {{ vars.platform_name }}, an older component that underlies  TKGI and has its own UI.  Because of this:

- The configuration wizard often makes using the {{ vars.platform_name }} UI unnecessary
- Values set in the configuration wizard override values set in {{ vars.platform_name }}

But there are configuration fields in {{ vars.platform_name }} that are not exposed by the configuration wizard,
and which you can apply to your TKGI deployment.
You can use the {{ vars.platform_name }} UI to configure the following,
and the management console will not override their values:

* **BOSH Director** tile fields, described in [Configuring BOSH Director on vSphere](https://techdocs.broadcom.com/us/en/vmware-tanzu/platform/tanzu-operations-manager/3-1/tanzu-ops-manager/vsphere-config.html) in the _{{ vars.platform_name }} Documentation_:
  * **Director Config** pane:
      * **Custom SSH Banner**
      * **Identification Tags**
      * **Health Monitor**
      * **CredHub Encryption Provider**
      * **Blobstore Location**
      * **Database Location**
  * **BOSH DNS Config** pane: all fields
  * **Syslog** pane: all fields
  * **Resource Config** pane:
      * **Master Compilation Job**

* **TKGI tile** tile fields, described in [Installing {{  vars.product }} on vSphere](installing-vsphere.html#configure):
  * **Networking** pane:
      * **Enable outbound internet access**
  * **Host Monitoring** pane:
      * **Enable Telegraf Outputs?**
  * **In-Cluster Monitoring** pane:
      * **Enable node exporter on workers**
  * **Errands** pane:
      * **NSX Validation errand**
      * **Run smoke tests**
      * **Delete all clusters errand**

* **Harbor** tile fields, described in [Installing and Configuring VMware Harbor Registry](https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/vmware-tanzu/platform-services/harbor-registry/services/harbor-cf/installing.html) in the _VMware Harbor Registry_ documentation:
  * **General** pane:
      * **Static IP Address**
      * **Wait time for Harbor Tile migration complete**
  * **Credentials** pane:
       * **Admin Password to run smoke test**
  * **Image Scanners** pane:
       * **Install Trivy**
  * **Errands** pane:
       * **smoke-testing**
       * **deregister Harbor UAA client**
* **Resource Config** pane:
       * **smoke-testing**
