#!/bin/bash
# =============================================================================
# Copyright (C) 2019 Stephen F. Norledge and Alces Software Ltd
#
# This file is part of Alces Cloudware Images.
#
# Alces Cloudware Images is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# Alces Cloudware Images is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Alces Cloudware Images.  If not, see <http://www.gnu.org/licenses/>.
#
# For more information on the Alces Cloudware Images, please visit:
# https://github.com/alces-software/cloudware-images
# ==============================================================================

# Confirm/deny
echo "This script has no warranty and may not correctly install qemu-img, be aware that it's simply a collection of commands that have been used to compile qemu-img in the past"
read -r -p "Do you wish to continue? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        ;;
    *)
        echo "Exiting..."
        exit 0
        ;;
esac

# Prerequisites
yum groupinstall "Development Tools"
yum install gtk2-devel zlib-devel

# Do it
cd /tmp
wget https://download.qemu.org/qemu-3.1.0.tar.xz
tar xf qemu-3.1.0.tar.xz
cd qemu-3.1.0
./configure --prefix=/root/qemu/
make
make install
