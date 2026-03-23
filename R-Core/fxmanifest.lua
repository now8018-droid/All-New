shared_script "@bt_defender/module/shared.lua"

fx_version 'adamant'
game 'gta5'

version '1.0'

shared_scripts {
  '@ox_lib/init.lua',
}

client_scripts {
  "module/**/client/**",
}

server_script {
  '@oxmysql/lib/MySQL.lua',
  "module/**/server/**",
}

ui_page 'html/ui.html'

files {
  'html/*',
  'html/ui.html',
  'html/style.css',
  'html/script.js'
}

lua54 'yes'
