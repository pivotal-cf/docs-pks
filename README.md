# Pivotal Container Service (PKS) Documentation

This repo contains the content for the documentation for Pivotal Container Service (PKS).

The content in this repo publishes to the PKS documentation site at https://docs.pivotal.io/runtimes/pks/index.html.

## How To Contribute

Please help us improve the accuracy and completeness of the PKS documentation by contributing.

The easiest way to contribute is to file a pull request through GitHub.

Every topic in the [PKS documentation site](https://docs-pks.cfapps.io) has a corresponding file in this repo. Locate the correct file and make a pull request against it. You can also navigate to the topic in the PKS documentation site and click "View the source for this page in GitHub" at the bottom of the topic.

## Versions and Branching

| **Branch Name** | **Content** | **Location** |
|-----------------|-------------|--------------|
| `master` | PKS 1.2.x pre-release content | https://docs-pcf-staging.cfapps.io/runtimes/pks/1-2/index.html |
| `1.1` | PKS 1.1.x released content | https://docs.pivotal.io/runtimes/pks/1-1/index.html |

The `master` branch is used to publish the pre-release v1.2 version of the site. Create pull requests on `master` to contribute bug fixes or correct technical inaccuracies in the v1.2 documentation. **This documentation requires validation. Contact #pcf-docs on Pivotal Slack to for access.**

The `1.1` branch is used to publish the live v1.1 version of the site. Create pull requests on `1.1` to contribute bug fixes or correct technical inaccuracies in the v1.1 documentation.

## How To Use Bookbinder To View Your Docs

[Bookbinder](https://github.com/pivotal-cf/bookbinder/blob/master/README.md) is a command-line utility for stitching Markdown docs into a hostable web app. The PCF Docs Team uses Bookbinder to publish our documentation sites, but you can also use Bookbinder to view a live version of your documentation on your local machine.

Bookbinder draws the content for the site from this repo, the left navigation menu ("subnav") from [`docs-book-pks`](https://github.com/pivotal-cf/docs-book-pks), and various layout configuration and assets from [`docs-layout-repo`](https://github.com/pivotal-cf/docs-layout-repo).

To use Bookbinder to view your documentation, perform the following steps:

1. Clone this repo to the `~/workspace` directory on your local machine.
1. Clone [`docs-book-pks`](https://github.com/pivotal-cf/docs-book-pks) and [`docs-layout-repo`](https://github.com/pivotal-cf/docs-layout-repo) to the `~/workspace` directory on your local machine.
1. Change into the `docs-book-pks` directory.
1. Run `bundle install` to install all of the necessary gems, including Bookbinder.
1. Build your documentation site with `bookbinder` in one of the two following ways:
  * Run `bundle exec bookbinder watch` to build an interactive version of the docs and navigate to `localhost:4567/myservice/` in a browser. (It may take a moment for the site to load at first.) This builds a site from your content repo at `docs-content`, and then watches that repo to update the site if you make any changes to the repo.
  * Run `bundle exec bookbinder bind local` to build a Rack web-app of the book. After the bind has completed, `cd` into the `final_app` directory and run `rackup`. Then navigate to `localhost:9292/myservice/` in a browser.
