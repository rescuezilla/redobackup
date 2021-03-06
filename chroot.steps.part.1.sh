#!/bin/bash
#
# Commands that occur within the chroot. That is, modifying what will become the root filesystem of the live CD
# using the commands present within the live CD.

set -x

APT_REPOSITORY_URL=http://old-releases.ubuntu.com/ubuntu
#APT_REPOSITORY_URL=http://archive.ubuntu.com/ubuntu
CODENAME=precise

# Prepare the chroot environment
mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts

export HOME=/root
export LC_ALL=C

# Ensure all Dockerfile package installation operations are non-interactive, DEBIAN_FRONTEND=noninteractive is insufficient [1]
# [1] https://github.com/phusion/baseimage-docker/issues/58
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

apt-get update
mkdir /var/lib/dbus
apt-get install --yes --no-install-recommends dbus
dbus-uuidgen > /var/lib/dbus/machine-id
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl

# Install the basic packages
perl -p -i -e 's/^set compatible$/set nocompatible/g' /etc/vim/vimrc.tiny
apt-get install --yes --no-install-recommends discover laptop-detect os-prober linux-generic casper lupin-casper

# Optional: Add update and backport repos. The official v1.0.2 and v1.0.3 ISO
# images did not have the update and backport repos in sources.list, but used
# the repos to upgrade packages (maybe was used only in debootstrap phase?).
echo "deb $APT_REPOSITORY_URL $CODENAME main universe multiverse" > /etc/apt/sources.list
echo "deb $APT_REPOSITORY_URL $CODENAME-updates main universe multiverse" >> /etc/apt/sources.list
echo "deb $APT_REPOSITORY_URL $CODENAME-backports main universe multiverse" >> /etc/apt/sources.list
apt-get update
apt-get upgrade --yes

# Install additional packages
apt-get install --yes --no-install-recommends xinit \
                                              openbox \
                                              obconf \
                                              xserver-xorg \
                                              x11-xserver-utils \
                                              xterm \
                                              network-manager-gnome \
                                              plymouth-x11 \
                                              plymouth-label \
                                              plymouth-theme-ubuntu-logo

apt-get install --yes --no-install-recommends pcmanfm \
                                              chromium-browser \
                                              gtk-theme-switch \
                                              shimmer-themes \
                                              gnome-icon-theme \
                                              gnome-brave-icon-theme \
                                              dmz-cursor-theme \
                                              maximus \
                                              gpicview \
                                              leafpad \
                                              lxappearance \
                                              lxmenu-data \
                                              lxrandr \
                                              lxterminal \
                                              nitrogen \
                                              ttf-ubuntu-font-family \
                                              alsamixergui \
                                              pm-utils \
                                              libnotify-bin \
                                              notify-osd \
                                              notify-osd-icons

apt-get install --yes --no-install-recommends time \
                                              hdparm \
                                              openssh-client \
                                              libglib-perl \
                                              libgtk2-perl \
                                              libxml-simple-perl \
                                              gtk2-engines-pixbuf \
                                              beep \
                                              rsync \
                                              smartmontools \
                                              gnome-disk-utility \
                                              policykit-1-gnome \
                                              policykit-desktop-privileges \
                                              baobab \
                                              gsettings-desktop-schemas \
                                              gparted \
                                              gksu \
                                              lshw-gtk \
                                              testdisk \
                                              usb-creator-gtk \
                                              wodim \
                                              curlftpfs \
                                              nmap \
                                              cifs-utils \
                                              libnotify-bin \
                                              cryptsetup \
                                              reiserfsprogs \
                                              dosfstools \
                                              ntfsprogs \
                                              ntfs-3g \
                                              hfsutils \
                                              reiser4progs \
                                              jfsutils \
                                              smbclient \
                                              wget \
                                              system-config-lvm \
                                              fsarchiver \
                                              partclone

ln -s /usr/bin/pcmanfm /usr/bin/nautilus
gconftool-2 --set /apps/maximus/undecorate --type BOOL false
rm /usr/bin/{rpcclient,smbcacls,smbclient,smbcquotas,smbget,smbspool,smbtar}
rm /usr/share/icons/*/icon-theme.cache
rm -rf /usr/share/doc
rm -rf /usr/share/man
rm -rf /etc/network/if-up.d/ntpdate
