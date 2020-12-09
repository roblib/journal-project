#!/usr/bin/env bash

# Create sample submitter and reviewer roles
# and generate Journal, Issue and Article
# sample content via devel_generate.
#
# Usage: generate_sample_content.sh <site-url> <account password>

SITEURL=${1:-http://localhost}
ACCOUNTPASS=${2:-admin}


../vendor/bin/drush -l $SITEURL ucrt "Sample Submitter" --password=ACCOUNTPASS

../vendor/bin/drush -l $SITEURL user:role:add "journal_article_creator" "Sample Submitter"

../vendor/bin/drush -l $SITEURL ucrt "Sample Reviewer" --password=ACCOUNTPASS

../vendor/bin/drush -l $SITEURL user:role:add "journal_article_reviewer" "Sample Reviewer"

../vendor/bin/drush -l $SITEURL pm-enable devel_generate

../vendor/bin/drush -l $SITEURL devel-generate-content 1 --bundles=journal
../vendor/bin/drush -l $SITEURL devel-generate-content 8 --bundles=issue

../vendor/bin/drush -l $SITEURL devel-generate-terms --bundles=article_section 3
../vendor/bin/drush -l $SITEURL devel-generate-terms --bundles=article_keywords 3
../vendor/bin/drush -l $SITEURL  devel-generate-terms --bundles=disciplines 3
../vendor/bin/drush -l $SITEURL devel-generate-terms --bundles=subjects 3
../vendor/bin/drush -l $SITEURL devel-generate-content 40 --bundles=journal_article
