# docs-layout-repo

This is the centralized layout repository for Pivotal documentation, for use with [Bookbinder](https://github.com/pivotal-cf/bookbinder).

This repository is intended to contain layouts, formatting, and styles used across all (or most) documentation sets.  

**Note**: Content specific to a book should be stored in the book, and not in this repo. For example, all subnav templates for the documentation set published by the docs-book-pcfservices book should be stored in the docs-book-pcfservices repository.

To include this centralized layout repository in your book, add the following line to your book's config.yml:

```
layout_repo: pivotal-cf/docs-layout-repo
```

Note: You must clone this repo in order to bind locally.

Upon running bind or watch, all files from the layout repo will be used in the bound book. 

### Overview

All book-specific overrides should be done in the following files in your book's `master_middleman/source` directory, according to the type of changes you would like to make.

Upon running `bind` or `watch`, all files from the layout repo will be used in the bound book.


### Styles
Overrides are held in two files:

* `stylesheets/book-styles.css.scss`

	Redefining or adding entire styles (classes, elements, etc.)

* `stylesheets/partials/_book-base-values.scss`

	Redefining or adding base values, such as specific colors, fonts, or sizes.
	
	E.g.,
	
	```
	$navy: #333333;
	```

* `stylesheets/partials/_book-vars.scss`
	
	Redefining or adding variables that point to the variable-ized base values in `_vars.scss` (under ["BEGIN BASE VALUES"](https://github.com/pivotal-cf/docs-layout-repo/blob/master/source/stylesheets/partials/_vars.scss#L5)) or `_book-base-values.scss` (as in the above example).
	
	E.g.,
	
	```
	$color-bg: $navy;
	```

### Javascript

Overrides are held in `javascripts/book.js`.

If any additional libraries are to be added to the book (e.g. `my-javascript-file.js`), include them in the javascripts folder and then require them in this file, as follows:

```
\\= require 'my-javascript-file'
```

### Layout

The Pivotal and Cloud Foundry books all use the layout repo's layout `layouts/layout.erb`. They define partials and template variables to change the layout contents where needed. 

The following items are defined by books, and used by `layouts/layout.erb`:

##### Template variables:

* `cse_id`: Google Custom Search Engine ID
* `support_link`: Generic text (e.g. "Support") linking to support site
* `support_call_to_action`: Call to action text (e.g. "Need Support?") linking to support site
* `product_link`: Generic text (e.g. "Pivotal Web Services") linking to product site
* `ga_account_id`: Google Analytics account ID
* `domain_name`: Domain name for the book (used to scope the Google Custom Search)
* `book_title_short`: Used in page's title (on browser tab)

##### Partials:

* `layouts/_book_title.erb`: On home page, how the title and logo are displayed
* `layouts/_book_footer.erb`: Copyright and support information in footer
* `layouts/_book_search.erb` [**Optional**]: Google Custom Search Engine box
