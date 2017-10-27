#!/bin/bash

## These source-code repositories are commonly used, so we'll declare them once.
##
## To declare more repositories, add more calls to "git_cache_setup" or
## "svn_cache_setup" in this file OR in your build's "download.sh".
##
## GIT NOTES:
##  - To warm-up the cache, run "git_cache_setup <remote-url> <local-cache>"
##    at the beginning of the build process.
##  - To checkout the code, use "git clone file://<local-cache>"
##  - After download completes, we automatically change the origin URL
##    by running "git_cache_deref_remotes".
## SVN NOTES:
##  - To warm-up the cache, run "svn_cache_setup" at the beginning
##    of the build process.
##  - To checkout the code, use "svn_cache_clone" (instead of "svn co")

git_cache_setup "https://github.com/civicrm/civicrm-backdrop.git"            "$CACHE_DIR/civicrm/civicrm-backdrop.git"
git_cache_setup "https://github.com/civicrm/civicrm-core.git"               "$CACHE_DIR/civicrm/civicrm-core.git"
git_cache_setup "https://github.com/civicrm/civicrm-drupal.git"              "$CACHE_DIR/civicrm/civicrm-drupal.git"
git_cache_setup "https://github.com/civicrm/civicrm-packages.git"            "$CACHE_DIR/civicrm/civicrm-packages.git"
git_cache_setup "https://github.com/civicrm/civicrm-joomla.git"              "$CACHE_DIR/civicrm/civicrm-joomla.git"
git_cache_setup "https://github.com/civicrm/civicrm-wordpress.git"           "$CACHE_DIR/civicrm/civicrm-wordpress.git"
git_cache_setup "https://github.com/civicrm/civicrm-demo-wp.git"             "$CACHE_DIR/civicrm/civicrm-demo-wp.git"
git_cache_setup "https://github.com/eileenmcnaughton/civicrm_developer.git"  "$CACHE_DIR/eileenmcnaughton/civicrm_developer.git"

git_cache_setup "https://github.com/WeMoveEU/contribjs"  "$CACHE_DIR/WeMoveEU/contribjs.git"
git_cache_setup "https://github.com/WeMoveEU/contributm" "$CACHE_DIR/WeMoveEU/contributm.git"
git_cache_setup "https://github.com/WeMoveEU/commitcivi" "$CACHE_DIR/WeMoveEU/commitcivi.git"
git_cache_setup "https://github.com/WeMoveEU/sqlreport"  "$CACHE_DIR/WeMoveEU/sqlreport.git"
git_cache_setup "https://github.com/WeMoveEU/com.drastikbydesign.stripe" "$CACHE_DIR/WeMoveEU/stripe.git"
git_cache_setup "https://github.com/WeMoveEU/ams" "$CACHE_DIR/WeMoveEU/ams.git"
git_cache_setup "https://github.com/WeMoveEU/org.project60.bic.git" "$CACHE_DIR/WeMoveEU/bic.git"
git_cache_setup "https://github.com/WeMoveEU/groupand.git" "$CACHE_DIR/WeMoveEU/groupand.git"
git_cache_setup "https://github.com/WeMoveEU/mailing-targeting.git" "$CACHE_DIR/WeMoveEU/mailing-targeting.git"
git_cache_setup "https://github.com/WeMoveEU/uk.co.compucorp.civicrm.mailjet.git" "$CACHE_DIR/WeMoveEU/mailjet.git"
git_cache_setup "https://github.com/WeMoveEU/nobillingfields.git" "$CACHE_DIR/WeMoveEU/nobillingfields.git"
git_cache_setup "https://github.com/WeMoveEU/speakcivi" "$CACHE_DIR/WeMoveEU/speakcivi.git"
git_cache_setup "https://github.com/WeMoveEU/utmaltor" "$CACHE_DIR/WeMoveEU/utmaltor.git"

git_cache_setup "https://github.com/civicrm/civivolunteer.git" "$CACHE_DIR/civicrm/civivolunteer.git"
git_cache_setup "https://github.com/ginkgostreet/org.civicrm.angularprofiles.git" "$CACHE_DIR/ginkgostreet/org.civicrm.angularprofiles.git"

git_cache_setup "https://github.com/civicoop/org.civicoop.civirules.git" "$CACHE_DIR/civicrm/org.civicoop.civirules.git"
git_cache_setup "https://bitbucket.org/caltha/eu.caltha.randomsample" "$CACHE_DIR/caltha/randomsample.git"
git_cache_setup "https://github.com/Project60/org.project60.sepa" "$CACHE_DIR/Project60/sepa.git"
git_cache_setup "https://github.com/TechToThePeople/civisualize.git" "$CACHE_DIR/TechToThePeople/civisualize.git"
git_cache_setup "https://github.com/TechToThePeople/civicrm-normalise.git" "$CACHE_DIR/TechToThePeople/normalise.git"
git_cache_setup "https://github.com/TechToThePeople/group2summary.git" "$CACHE_DIR/TechToThePeople/group2summary.git"
git_cache_setup "https://github.com/TechToThePeople/lonesome.git" "$CACHE_DIR/TechToThePeople/lonesome.git"
git_cache_setup "https://github.com/TechToThePeople/noverwrite.git" "$CACHE_DIR/TechToThePeople/noverwrite.git"
git_cache_setup "https://github.com/TechToThePeople/sendeventconf.git" "$CACHE_DIR/TechToThePeople/sendeventconf.git"
git_cache_setup "https://github.com/dlobo/org.civicrm.module.cividiscount.git" "$CACHE_DIR/dlobo/org.civicrm.module.cividiscount.git"
git_cache_setup "https://github.com/systopia/de.systopia.osm" "$CACHE_DIR/systopia/osm.git"

## SVN data is stale (last updated Apr 2014). Use daily tarballs instead.
#svn_cache_setup "https://svn.civicrm.org/l10n/trunk"                         "$CACHE_DIR/civicrm/l10n-trunk.svn"
