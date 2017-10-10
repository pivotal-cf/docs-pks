# Pivotal Container Service (PKS) Documentation

This repo contains the documentation for Pivotal Container Service (PKS).

The content in this repo publishes to the the PKS documentation site at https://docs-pks.cfapps.io.

**This documentation is currently in development.**

## How To Contribute

Please help us improve the accuracy and completeness of the PKS documentation by contributing.

The easiest way to contribute is to file a pull request through GitHub.

Every topic in the [PKS documentation site](https://docs-pks.cfapps.io) has a corresponding file in the [docs-content](https://github.com/pivotal-cf/docs-pks/tree/master/docs-content) directory of this repo. Locate the correct file and make a pull request against it.

## How To Use Bookbinder To View Your Docs

[Bookbinder](https://github.com/pivotal-cf/bookbinder/blob/master/README.md) is a command-line utility for stitching Markdown docs into a hostable web app. The PCF Docs Team uses Bookbinder to publish our documentation sites, but you can also use Bookbinder to view a live version of your documentation on your local machine.

Bookbinder draws the content for the site from `docs-content`, the left navigation menu ("subnav") from `docs-book`, and various layout configuration and assets from `docs-layout`.

To use Bookbinder to view your documentation, perform the following steps:

1. Clone this repo to your local machine.
1. Change into the `docs-book` directory within the repo.
1. Run `bundle install` to install all the necessary gems, including Bookbinder.
1. Build your documentation site with `bookbinder` in one of the two following ways:
	* Run `bundle exec bookbinder watch` to build an interactive version of the docs and navigate to `localhost:4567/myservice/` in a browser. (It may take a moment for the site to load at first.) This builds a site from your content repo at `docs-content`, and then watches that repo to update the site if you make any changes to the repo.
	* Run `bundle exec bookbinder bind local` to build a Rack web-app of the book. After the bind has completed, `cd` into the `final_app` directory and run `rackup`. Then navigate to `localhost:9292/myservice/` in a browser.
