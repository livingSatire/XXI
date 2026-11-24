#!/bin/bash

# XXI_EDITION="Null" #We do not have a XXI_EDITION yet...

#log "setup script started" # The log function is not yet ready
xxi
greet
echo
echo "SYSTEM INFO"
print_system_info

echo "Setting up XXI system folders."
mkdir /xxi/ && echo "/xxi/ created"
mkdir /xxi/ && echo "/xxi/build created"
mkdir /var/xxi/ && echo "/var/xxi created"

echo "Setting up XXI build system."
