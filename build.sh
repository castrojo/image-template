#!/bin/bash

set -ouex pipefail

# this installs a package from fedora repos
dnf5 install -y tmux

systemctl enable podman.socket
