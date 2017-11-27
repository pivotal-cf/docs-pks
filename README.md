# Pivotal Container Service (PKS) Documentation

This repo contains the content for the documentation for Pivotal Container Service (PKS).

The content in this repo publishes to the PKS documentation site at https://docs-pks.cfapps.io.

**This documentation is currently in development.**

## How To Contribute

Please help us improve the accuracy and completeness of the PKS documentation by contributing.

The easiest way to contribute is to file a pull request through GitHub.

Every topic in the [PKS documentation site](https://docs-pks.cfapps.io) has a corresponding file in this repo. Locate the correct file and make a pull request against it. You can also navigate to the topic in the PKS documentation site and click "View the source for this page in GitHub" at the bottom of the topic.

**Make sure to make your PR against the correct branch, depending on which version of the docs you want to modify. See the Versioned Branches section below.**

## Versioned Branches

This repo publishes two different versions of PKS docs:

* The [0.5.0-26](https://github.com/pivotal-cf/docs-pks/tree/0.5.0-26) branch publishes the v0.5.0-26 docs at https://docs-pks.cfapps.io/pks/0-5-0/.
* The [0.5.2](https://github.com/pivotal-cf/docs-pks/tree/0.5.2) branch publishes the v0.5.2 docs at https://docs-pks.cfapps.io/pks/0-5-2.

**Master is not a published branch.**

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
