#!/bin/bash
# Time-stamp: "2024-12-18 05:29:58 (ywatanabe)"
# File: ./Ninja/src/apptainer_builders/user_create_bashrc.sh

# Check if running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script ($0) must be run as root" >&2
   exit 1
fi

ENVS_SRC="$(dirname $0)"/ENVS.sh.src
source $ENVS_SRC

create_ninjas_bashrc() {
    for ninja_id in $(seq 1 $NINJA_N_AGENTS); do
        create_ninja_bashrc $ninja_id
    done
}

create_ninja_bashrc() {
    local ninja_id="$1"
    update_ninja_envs $ninja_id

    NINJA_BASHRC=$NINJA_HOME/.bashrc

    # NINJA_ID
    echo "" >> $NINJA_BASHRC
    echo "# ========================================" >> $NINJA_BASHRC
    echo "export NINJA_ID=$NINJA_ID" >> $NINJA_BASHRC
    echo "# ========================================" >> $NINJA_BASHRC
    echo "" >> $NINJA_BASHRC

    # NINJA_ENVS
    echo "" >> $NINJA_BASHRC
    echo "# ========================================" >> $NINJA_BASHRC
    echo "" >> $NINJA_BASHRC
    cat $ENVS_SRC >> $NINJA_BASHRC
}

create_ninjas_bashrc


# EOF
