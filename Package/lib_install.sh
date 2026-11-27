#!/bin/sh
. ../lib/prelude.sh

install() {
    require_root
    echo "Installing $1"
    cd /xxi/Repo/ || fail "Failed to go to Repo dir."
    su xxi
}
