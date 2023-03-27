# VMware Tanzu Kubernetes Grid Integrated Edition Documentation

This repository contains the content for the documentation for Tanzu Kubernetes Grid Integrated Edition (TKGI).

In versions 1.7 and earlier, the product was named Enterprise PKS, not TKGI, and those versions
of the document set continue to use the name Enterprise PKS.

## Sites

The content in this repository publishes to the documentation sites at
[https://docs.pivotal.io/tkgi/index.html](https://docs.pivotal.io/tkgi/index.html) and
[https://docs.pivotal.io/pks/index.html](https://docs.pivotal.io/pks/index.html).

## How To Contribute

Please help us improve the accuracy and completeness of the TKGI documentation by contributing.

One way to to contribute is to file a pull request through GitHub.

Every topic in the documentation has a corresponding file in this repository. Locate the correct
file and make a pull request against it. You can also navigate to a topic in the TKGI or Enterprise
PKS documentation site and click "View the source for this page in GitHub" at the bottom of the
topic to locate the source file of the topic.

## Versions and Branching

| **Branch Name** | **Content** | **Location** |
|-----------------|-------------|--------------|
| `1.17` | TKGI 1.17 pre-release content       | n/a |
| `1.16` | TKGI 1.16 released content          | https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid-Integrated-Edition/1.16/tkgi/GUID-release-notes.html |
| `1.15` | TKGI 1.15 released content          | https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid-Integrated-Edition/1.15/tkgi/GUID-release-notes.html |
| `1.14` | TKGI 1.14 released content          | https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid-Integrated-Edition/1.14/tkgi/GUID-release-notes.html |
| `1.13` | Reached End of General Support      | https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid-Integrated-Edition/1.13/tkgi/GUID-release-notes.html |
| `1.12` | Reached End of General Support      | https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid-Integrated-Edition/1.12/tkgi/GUID-release-notes.html |
| `1.11` | Reached End of General Support      | https://docs.pivotal.io/tkgi/1-11/index.html |
| `1.10` | Reached End of General Support      | https://docs.pivotal.io/tkgi/1-10/index.html |
| `1.9`  | Reached End of General Support      | https://docs.pivotal.io/tkgi/1-9/index.html  |
| `1.8`  | Reached End of General Support      | https://docs.pivotal.io/tkgi/1-8/index.html  |
| `1.7`  | Reached End of General Support      | https://docs.pivotal.io/pks/1-7/index.html   |
| `1.6`  | Reached End of General Support      | https://docs.pivotal.io/pks/1-6/index.html   |
| `1.5`  | Reached End of General Support      | https://docs.pivotal.io/pks/1-5/index.html   |
| `1.4`  | Reached End of General Support      | https://docs.pivotal.io/pks/1-4/index.html   |
| `1.3`  | Reached End of General Support      | https://docs.pivotal.io/pks/1-3/index.html   |
| `1.2`  | Not in use | N/A ([PDF available](https://resources.docs.pivotal.io/pdfs/pks-1-2.pdf)) |
| `1.1`  | Not in use | N/A ([PDF available](https://resources.docs.pivotal.io/pdfs/pks-1-1.pdf)) |
| `1.0-publish` | Not in use | N/A ([PDF available](https://resources.docs.pivotal.io/pdfs/pks-docs-1.0.pdf)) |
| `0.8`  | Not in use | N/A|
| `pks-patches` | Staging site for not-yet-released TKGI and Enterprise PKS patches. | Publishes to an internal staging site only. |

**1.17**: The `1.17` branch is used to publish the pre-release v1.17 version of the site. Create pull requests on `1.17` to contribute bug fixes or correct technical inaccuracies in the v1.17 documentation.

**1.16**: The `1.16` branch is used to publish the live v1.16 version of the site. Create pull requests on `1.16` to contribute bug fixes or correct technical inaccuracies in the v1.16 documentation.

**1.15**: The `1.15` branch is used to publish the live v1.15 version of the site. Create pull requests on `1.15` to contribute bug fixes or correct technical inaccuracies in the v1.15 documentation.

**1.14**: The `1.14` branch is used to publish the live v1.14 version of the site. Create pull requests on `1.14` to contribute bug fixes or correct technical inaccuracies in the v1.14 documentation.

**1.13**: This branch is no longer maintained.

**1.12**: This branch is no longer maintained.

**1.11**: This branch is no longer maintained.

**1.10**: This branch is no longer maintained.

**1.8**: This branch is no longer maintained.

**1.8**: This branch is no longer maintained.

**1.7**: This branch is no longer maintained.

**1.6**: This branch is no longer maintained.

**1.6.x-patch-releases**: This branch is no longer maintained.

**1.5**: This branch is no longer maintained.

**1.5.x-patch-releases**: This branch is no longer maintained.

**1.4**: This branch is no longer maintained.

**1.4.x-patch-releases**: This branch is no longer maintained.

**1.3**: This branch is no longer maintained.

**1.3.x-patch-releases**: This branch is no longer maintained.

The `1.2` branch is no longer maintained. A PDF of the Enterprise PKS v1.2 documentation is available at https://resources.docs.pivotal.io/pdfs/pks-docs-1.2.pdf.

The `1.1` branch is no longer maintained. A PDF of the Enterprise PKS v1.1 documentation is available at https://resources.docs.pivotal.io/pdfs/pks-docs-1.1.pdf.

The `1.0-publish` and `0.8` branches are no longer maintained. A PDF of the Enterprise PKS v1.0 documentation is available at https://resources.docs.pivotal.io/pdfs/pks-docs-1.0.pdf.



## Publishing TKGI documentation

TKGI v1.12 and later documentation is formatted for publishing via a VMware DocWorks Markdown Publishing pipeline. TKGI v1.11 and earlier documentation is formatted for use in a Bookbinder-based pipeline. You cannot reliably preview published document formatting of content formatted with VMware DocWorks pipeline-formatted content.

### How To Use Bookbinder To View Your Documentation

[Bookbinder](https://github.com/pivotal-cf/bookbinder/blob/master/README.md) is a command-line
utility for stitching Markdown documents into a hostable web app. The documentation team uses
Bookbinder to publish our documentation sites, but you can also use Bookbinder to view a live
version of your documentation on your local machine.

Bookbinder draws the content for the site from this repository, the left navigation menu ("subnav")
from [`docs-book-pks`](https://github.com/pivotal-cf/docs-book-pks), and various layout
configuration and assets from [`docs-layout-repo`](https://github.com/pivotal-cf/docs-layout-repo).

To use Bookbinder to view your documentation, perform the following steps:

1. Clone this repository to the `~/workspace` directory on your local machine.
1. Clone [`docs-book-pks`](https://github.com/pivotal-cf/docs-book-pks) and [`docs-layout-repo`](https://github.com/pivotal-cf/docs-layout-repo) to the `~/workspace` directory on your local machine.
1. Navigate into the `docs-book-pks` directory.
1. Run `bundle install` to install all of the necessary gems, including Bookbinder.
1. Run `bundle exec bookbinder bind local` to build a Rack web-app of the book. After the bind has completed, navigate into the `final_app` directory and run `rackup`. Then navigate to `localhost:9292/tkgi/1-10/index.html` in a browser.
