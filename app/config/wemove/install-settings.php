<?php

civicrm_api3('OptionValue', 'create', [
  'sequential' => 1,
  'option_group_id' => "campaign_type",
  'name' => 'Fundraising',
  'title' => 'Fundraising',
  'weight' => 1
]);
$params = [
  'sequential' => 1,
  'name' => 'members',
  'title' => 'Members',
  'options' => ['limit' => 1],
];
$result = civicrm_api3('Group', 'get', $params);
if (!$result['count']) {
  $result = civicrm_api3('Group', 'create', $params);
}
$groupId = $result['id'];
$languageGroups = [
  'da-language-members' => 'Danish language Members',
  'de-language-members' => 'German language Members',
  'en-language-members' => 'English language Members',
  'es-language-members' => 'Spanish language Members',
  'fr-language-members' => 'French language Members',
  'el-language-members' => 'Greek language Members',
  'nl-language-members' => 'Dutch language Members',
  'it-language-members' => 'Italian language Members',
  'pl-language-members' => 'Polish language Members',
  'pt-language-members' => 'Portuguese language Members',
  'ro-language-members' => 'Romanian language Members',
];
foreach ($languageGroups as $name => $title) {
  civicrm_api3('Group', 'create', [
    'sequential' => 1,
    'name' => $name,
    'title' => $title,
  ]);
}

// todo custom fields for campaign
// todo Join & Leave
// todo anonymous contact
// todo default language group (other)
// todo prefix of language tag name

Civi::settings()->set('opt_in', 1);
Civi::settings()->set('group_id', $groupId);
Civi::settings()->set('default_language', 'en_GB');
Civi::settings()->set('country_lang_mapping', array(
  'DE' => 'de_DE',
  'DK' => 'da_DK',
  'EN' => 'en_GB',
  'ES' => 'es_ES',
  'FR' => 'fr_FR',
  'GR' => 'el_GR',
  'NL' => 'nl_NL',
  'IT' => 'it_IT',
  'PL' => 'pl_PL',
  'PT' => 'pt_PT',
));