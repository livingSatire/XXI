#!/bin/sh

# DOC: This is the common func file. This is for functions that alot of xxi programs use, and thus added via a shared file.
xxi() {
    echo "--------------------------"
    echo "XXI: Your system, allways."
    echo "--------------------------"
    echo
}

check_command_exist() {
    command -v $1 > /dev/null || echo "$1 not found"
}

# Stolen from: github.com/cloudstreet-dev/POSIX-Shell-Scripting/blob/main/07-functions.md
ensure_dir() {
    [ -d "$1" ] || mkdir -p "$1"
}

# Stolen from: github.com/cloudstreet-dev/POSIX-Shell-Scripting/blob/main/07-functions.md
# Modded for XXI
backup_file() {
    [ -f "$1" ] && cp "$1" "$1.$(date +%Y%m%d_%H%M%S).backup_file"
}

if_bash_set_posix() {
    if [ "$SHELL" = "/bin/bash" ]; then
    # Due to this code only running if you are on bash, it is fine to use the following.
    # shellcheck disable=SC3040
    set -o posix > /dev/null # Just in case its run on a non-bash shell, it will not output anything
    fi
}

greet() {
    echo "Hello, $(whoami)"
}

print_system_info() {
    echo "Kernel: $(uname -r)"
    echo "User ID: $(id -u)"
    echo "System Up Since: $(who -b)"
}

fail() {
    echo "Failure: $1"; exit 1
}

make_password() {
    LC_ALL=C tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 20 ; echo # Stolen from stack overflow
}

require_root() {
    if [ "$(id -u)" != 0 ]; then
        fail "uid is not 0, and this code requires root"
    fi    
}

# Still need to find a clean way to do this, and test
#user_log() {
#  echo "$2" > /var/$user/$1/$(date)
#}
