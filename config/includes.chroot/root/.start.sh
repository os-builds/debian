#!/bin/bash

source .functions.sh

if switch_exists ssnscript; then
  scriptUri=$(switch_value ssnscript)
  scriptName=$(basename ${scriptUri})
  print "Downloading ${scriptName}..."
  if ! wget --quiet -O ${scriptName} ${scriptUri}; then
    echo "Unable to download script from ${scriptUri}"
    exit 1
  fi

  chmod +x ${scriptName}
  ./${scriptName}
  reboot

elif switch_exists ssnwipe; then
  print "Starting wipe system..."
  /bin/bash /usr/local/bin/wipe
  reboot
fi

printe "No kernel switches detected, dropping shell..."
