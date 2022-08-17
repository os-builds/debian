### FUNCTION SECTION ###
function switch_exists {
  grep -q ${1} /proc/cmdline
}

function switch_value {
  grep -Po "(?<=${1}=)\S*)" /proc/cmdline
}
### END OF FUNCTION SECTION ###

if switch_exists ssndebug; then
  echo "Debug flag has been set, exiting..."
  exit 0
fi

install_script_uri=$(switch_value ssninstallscript)
install_script_name=$(basename ${install_script_uri})
if ! wget --quiet -O ${install_script_name} ${install_script_uri}; then
  echo "Unable to download install script from ${install_script_uri}"
  exit 1
fi

chmod +x ${install_script_name}
./${install_script_name} | tee install.log