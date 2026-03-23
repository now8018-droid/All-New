-- NC PROTECT+
shared_scripts { '@nc_PROTECT+/exports/protected.lua', '@nc_PROTECT+/exports/sh.lua' }

fx_version 'cerulean'

games { 'gta5' }

author "YIP Dev"
version '1.0.0'

lua54 'yes'

ui_page 'web/build/index.html'


shared_script {
  "Setting.lua",
  -- '@ox_lib/init.lua',
  -- "@es_extended/imports.lua",
}

client_script {
  'SourceCL/client.lua',
  'SourceCL/common.lua',
}

files {
  'web/build/index.html',
  'web/build/**/*',
}