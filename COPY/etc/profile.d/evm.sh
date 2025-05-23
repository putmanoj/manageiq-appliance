#!/bin/bash

[[ -s "/etc/default/evm" ]] && source "/etc/default/evm"

# Aliases:
alias ap='appliance_console'
alias apcli='appliance_console_cli'
alias vmdb='cd /var/www/miq/vmdb'
alias appliance='[[ -n ${APPLIANCE_SOURCE_DIRECTORY} ]] && cd ${APPLIANCE_SOURCE_DIRECTORY}'

# Define an alias to override any rubygems binstubs
# to ensure it's run through the application's bundle.
alias appliance_console='bundle exec appliance_console'
alias appliance_console_cli='bundle exec appliance_console_cli'

# Tail Logs:
function tailmiq() # If no value is given with tailmiq it defaults to the manageiq* and evm* units
{
  journalctl -f -u ${1:-manageiq* -u evm*}
}
alias tailpglog='tail -f $APPLIANCE_PG_DATA/log/postgresql.log'

# Appliance Status:
alias apstatus='systemctl status --no-pager evmserverd manageiq.slice httpd memcached postgresql repmgr* -n 0; \
echo -e "\nPostgreSQL service:"; pg_isready'
