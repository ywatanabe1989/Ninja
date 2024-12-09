#!/bin/bash
# Time-stamp: "2024-12-08 07:51:02 (ywatanabe)"
# File: ./Ninja/src/shell/apptainer_builders/correct_permissions.sh

# Check if running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script ($0) must be run as root" >&2
   exit 1
fi


# ########################################
# # sudo permissions
# ########################################
# chown root:root /usr/bin/sudo
# chmod 4755 /usr/bin/sudo
# chown root:root /etc/sudo.conf
# chmod 644 /etc/sudo.conf

# chmod 774 /opt
# chmod 774 -R /opt/self-evolving-agent
# chown $NINJA_USER:$NINJA_USER -R /opt/self-evolving-agent

# Users
getent group $NINJA_GROUP || groupadd $NINJA_GROUP
usermod -a -G $NINJA_GROUP $USER || exit 1
usermod -a -G $NINJA_GROUP $NINJA_USER || exit 1

# Set ninja home dir
chmod -R 770 $NINJA_HOME || exit 1
chown -R $NINJA_USER:$NINJA_GROUP $NINJA_HOME || exit 1

# Set socket directory permissions
mkdir -p $NINJA_SERVER_SOCKET_DIR || exit 1
chmod 2775 $NINJA_SERVER_SOCKET_DIR || exit 1
chgrp $NINJA_GROUP $NINJA_SERVER_SOCKET_DIR || exit 1

# Set socket file permissions (if exists)
[ -S "$NINJA_SERVER_SOCKET" ] && { chmod 660 "$NINJA_SERVER_SOCKET" || exit 1; }
[ -S "$NINJA_SERVER_SOCKET" ] && { chgrp $NINJA_GROUP "$NINJA_SERVER_SOCKET" || exit 1; }

# EOF
