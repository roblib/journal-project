This is a Composer-based installer for the [Journal](https://github.com/roblib/journal-profile) Drupal distribution based on [Lightning](http://drupal.org/project/lightning). Welcome to the future of scholarly publishing!

## Get Started
```
git clone this repository into your local environment and rename the folder to what you want
$ cd my-journal
$ composer install
$ cd docroot; php ./core/scripts/drupal quick-start journal
Once the site is up, in a new terminal,:
$ cd my-journal-/scripts
$ ./generate-sample-content.sh http://127.0.0.1:8888 admin
(where 'admin' is the password for the sample created users)

This will create a functioning Journal site, open a web browser, and log you into the site using Drupal's built-in Quick Start command. If you'd rather use your own database and web server, you can skip the second step above and install Journal like you would any other Drupal site.

The Journal site ships with Submitter and Reviewer roles, and content types for Journal, Issue and Article. These types have a hierarchical relationship via [Entity Reference Hierarchy](https://www.drupal.org/project/entity_hierarchy).

generate-sample-content.sh  creates sample users and assign the Submitter and Reviewer roles to them,  then using [Devel](https://drupal.org/project/devel)'s devel-generate module, will populate your new site with Lorem Ipsum content that can let you see how the Issues and Article pages look structurally.

It also creates sample terms in the Disciplines, Keywords, Sections, and Subjects vocabularies.

See the comment at the top of script/generate-sample-content.sh for invocation instructions.


Normally, Composer will install all dependencies into a `vendor` directory that is *next* to `docroot`, not inside it. This may create problems in certain hosting environments, so if you need to, you can tell Composer to install dependencies into `docroot/vendor` instead:

```
$ composer create-project islandora-rdm/journal-project MY_PROJECT --no-install
$ composer config vendor-dir docroot/vendor
$ cd MY_PROJECT
$ composer install
```

Either way, remember to keep the `composer.json` and `composer.lock` files that exist above `docroot` -- they are controlling your dependencies.


## Maintenance
`drush make`, `drush pm-download`, `drush pm-update` and their ilk are the old-school way of maintaining your code base. Forget them. You're in Composer land now!

This repository is a fork of https://github.com/acquia/lightning-project. You should go there and read about ow to use composer to keep your project updated. Everything should be the same except that you are installing with the 'Journal' profile.

