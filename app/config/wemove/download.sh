#!/bin/bash

## download.sh -- Download Drupal and CiviCRM

###############################################################################

CIVI_VERSION='4.7.17'
[ -z "$CMS_VERSION" ] && CMS_VERSION=7.x
[ -z "$VOL_VERSION" ] && VOL_VERSION='4.4-1.x'
[ -z "$NG_PRFL_VERSION" ] && NG_PRFL_VERSION='v4.6-1.0.1'
[ -z "$RULES_VERSION" ] && RULES_VERSION='master'
[ -z "$DISC_VERSION" ] && DISC_VERSION='master'

MAKEFILE="${TMPDIR}/${SITE_TYPE}/${SITE_NAME}/${SITE_ID}.make"
cvutil_makeparent "$MAKEFILE"
cat "$SITE_CONFIG_DIR/drush.make.tmpl" \
  | sed "s;%%CACHE_DIR%%;${CACHE_DIR};" \
  | sed "s;%%CIVI_VERSION%%;${CIVI_VERSION};" \
  | sed "s;%%CMS_VERSION%%;${CMS_VERSION};" \
  | sed "s;%%DISC_VERSION%%;${DISC_VERSION};" \
  | sed "s;%%RULES_VERSION%%;${RULES_VERSION};" \
  | sed "s;%%VOL_VERSION%%;${VOL_VERSION};" \
  | sed "s;%%NG_PRFL_VERSION%%;${NG_PRFL_VERSION};" \
  > "$MAKEFILE"

drush -y make --working-copy "$MAKEFILE" "$WEB_ROOT"

# Apply wemove patches
# There are not based on civicrm-core, so the --patch feature of civibuild cannot be sued
cd "${WEB_ROOT}/sites/all/modules/civicrm"
WEMOVE_PATCHES="patch-localized-templates"
#Invalid patch  WEMOVE_PATCHES="$WEMOVE_PATCHES patch-optout-button"
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-surround-bold"
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-hook-alter-url"
#Invalid patch WEMOVE_PATCHES="$WEMOVE_PATCHES patch-force-simple-ampersand"
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-settings-location"
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-mandatory-pay-fields"
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-crm-19962"  # Merged in v4.7.18
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-fix-paypal-german"  # CRM-19963
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-allow-transient-mailer"
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-scheduled-jobs"
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-parallel-abtests"
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-default-ckeditor"
#Invalid patch WEMOVE_PATCHES="$WEMOVE_PATCHES patch-ignore-l10n"
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-crm-20389"  # Merged in v4.7.19
WEMOVE_PATCHES="$WEMOVE_PATCHES patch-crm-20309"  

for PATCH in $WEMOVE_PATCHES
do
  curl "https://github.com/WeMoveEU/wemove-civicrm/commit/${PATCH}.patch" | git apply -
done
cd -
