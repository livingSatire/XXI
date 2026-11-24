#!/bin/sh
. ./common_func.sh

log() {
  require_root
  echo "$(date): $1" >> /xxi/system_log
}
