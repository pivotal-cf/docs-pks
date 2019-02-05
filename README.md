# Pivotal Container Service (PKS) Documentation

This repository contains the content for the documentation for Pivotal Container Service (PKS).

The content in this repository publishes to the PKS documentation site at https://docs.pivotal.io/runtimes/pks/index.html.

## How To Contribute

Please help us improve the accuracy and completeness of the PKS documentation by contributing.

The easiest way to contribute is to file a pull request through GitHub.

Every topic in the [PKS documentation site](https://docs-pks.cfapps.io) has a corresponding file in this repository. Locate the correct file and make a pull request against it. You can also navigate to the topic in the PKS documentation site and click "View the source for this page in GitHub" at the bottom of the topic.

## Versions and Branching

| **Branch Name** | **Content** | **Location** |
|-----------------|-------------|--------------|
| `master` | PKS 1.4.x pre-release content | N/A |
| `1.3` | PKS 1.3.x released content | https://docs.pivotal.io/runtimes/pks/1-3/index.html |
| `1.2` | PKS 1.2.x released content | https://docs.pivotal.io/runtimes/pks/1-2/index.html |
| `1.1` | Not in use | N/A ([PDF available](https://docs.pivotal.io/archives/pks-docs-1.1.pdf)) |
| `1.0-publish` | Not in use | N/A ([PDF available](https://docs.pivotal.io/archives/pks-docs-1.0.pdf)) |
| `0.8` | Not in use | N/A |

The `master` branch is used to publish the pre-release v1.4 version of the site. Create pull requests on `master` to contribute bug fixes or correct technical inaccuracies in the v1.4 documentation.
**This documentation requires validation. Contact #pcf-docs on Pivotal Slack for access.**

The `1.3` branch is used to publish the live v1.3 version of the site. Create pull requests on `1.3` to contribute bug fixes or correct technical inaccuracies in the v1.3 documentation.

The `1.2` branch is used to publish the live v1.2 version of the site. Create pull requests on `1.2` to contribute bug fixes or correct technical inaccuracies in the v1.2 documentation.

The `1.1` branch is no longer maintained. A A PDF of the PKS v1.0 documentation is available at https://docs.pivotal.io/archives/pks-docs-1.1.pdf.

The `1.0-publish` and `0.8` branches are no longer maintained. A PDF of the PKS v1.0 documentation is available at https://docs.pivotal.io/archives/pks-docs-1.0.pdf.

## How To Use Bookbinder To View Your Documentation

[Bookbinder](https://github.com/pivotal-cf/bookbinder/blob/master/README.md) is a command-line utility for stitching Markdown documents into a hostable web app. The PCF Documentation Team uses Bookbinder to publish our documentation sites, but you can also use Bookbinder to view a live version of your documentation on your local machine.

Bookbinder draws the content for the site from this repository, the left navigation menu ("subnav") from [`docs-book-pks`](https://github.com/pivotal-cf/docs-book-pks), and various layout configuration and assets from [`docs-layout-repo`](https://github.com/pivotal-cf/docs-layout-repo).

To use Bookbinder to view your documentation, perform the following steps:

1. Clone this repository to the `~/workspace` directory on your local machine.
1. Clone [`docs-book-pks`](https://github.com/pivotal-cf/docs-book-pks) and [`docs-layout-repo`](https://github.com/pivotal-cf/docs-layout-repo) to the `~/workspace` directory on your local machine.
1. Change into the `docs-book-pks` directory.
1. Run `bundle install` to install all of the necessary gems, including Bookbinder.
1. Build your documentation site with `bookbinder` in one of the two following ways:
  * Run `bundle exec bookbinder watch` to build an interactive version of the documentation and navigate to `localhost:4567/runtime/pks/1-4/index.html` in a browser. (It may take a moment for the site to load at first.) This builds a site from your content repository at `docs-content`, and then watches that repository to update the site if you make any changes to the repository.
  * Run `bundle exec bookbinder bind local` to build a Rack web-app of the book. After the bind has completed, `cd` into the `final_app` directory and run `rackup`. Then navigate to `localhost:9292/runtime/pks/1-4/index.html` in a browser.
