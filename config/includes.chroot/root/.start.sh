#!/bin/bash

source .functions.sh

scriptUri=$(switch_value ssnscript)
scriptName=$(basename ${scriptUri})
if ! wget --quiet -O ${scriptName} ${scriptUri}; then
  echo "Unable to download script from ${scriptUri}"
  exit 1
fi

chmod +x ${scriptName}
./${scriptName}
