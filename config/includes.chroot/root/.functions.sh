#!/bin/bash

function switch_exists {
  grep -q ${1} /proc/cmdline
}

function switch_value {
  grep -Po "(?<=${1}=)\S*" /proc/cmdline
}

function print {
  echo -e "\e[33m[${0}] ${@}\e[0m"
}

function printe {
  echo -e "\e[91m[${0}] ${@}\e[0m"
}
