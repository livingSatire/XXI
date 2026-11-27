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

echo "Setting up XXI user."
userdel xxi > /dev/null # Mostly for testing
useradd -s /bin/sh -M xxi

echo "Moving ownership of xxi files to xxi user."
chown -r /xxi/
chown -r xxi /var/xxi/

echo "Switching to xxi user"
su xxi

echo "Going back to root user"
exit

echo "Script done, system setup"
