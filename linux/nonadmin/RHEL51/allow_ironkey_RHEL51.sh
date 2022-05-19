#
# This shell script sets up a RHEL 5.1 system to allow access to plugged
# in IronKeys. It does two things:
# (1) Sets up permissions on the SCSI generic devices associated
#     with the IronKey so that the console user can write to them (this
#     allows the ironkey program to communicate with the IronKey)
# (2) Sets up a default fstab entry for the IronKey CD with execute
#     permissions enabled. Normally CD-ROMs are mounted on RHEL 5.1 with
#     the "noexec" bit, which prevents the IronKey access program from
#     running.
#

if [ "$UID" != "0" ];
then
  echo "This script must be run as root."
  exit 2
fi

#
# First, set up udev scripts to make sure permissions are established for
# the console user to do whatever s/he wants with the plugged in IronKey.
#
echo "This script sets up a system to allow access to plugged in IronKeys by non-root users."
read -p "Continue? [y/n] " YN
if [ "$YN" = "y" -o "$YN" = "yes" -o "$YN" = "Y" -o "$YN" = "YES" ];
then
  echo "OK, installing:"
else
  echo "Installation aborted"
  exit 1
fi

echo "..installing rules for IronKey specific symlinks in /etc/udev/rules.d/99-ironkey.rules"
cat <<EOF_ikrules > /etc/udev/rules.d/99-ironkey.rules
#
# udev rules for setting up symbolic links for ironkeys
# These create links like:
#   /dev/ikgeneric-0
#   /dev/ikgeneric-1
# for generic devices associated with plugged in IronKeys.
# A console rules file can use these to give console users
# permission to access the IronKeys.
#

# generic devices: name these ikgeneric
KERNEL=="sg*",ATTR{vendor}=="IronKey",	SYMLINK="ikgeneric-%n"

# hard disk devices: name these ironkey
KERNEL=="sd*",ATTR{vendor}=="IronKey",	SYMLINK="ironkey-%n"

# CD devices
KERNEL=="sr*",ATTR{vendor}=="IronKey",	SYMLINK="ikcd-%n"

EOF_ikrules

echo "..installing rules for IronKey device permission in /etc/security/console.perms.d/99-ironkey.perms"
cat <<EOF_ikperms > /etc/security/console.perms.d/99-ironkey.perms
#
# Permissions for allowing console users to access plugged in IronKey devices
# The IronKey unlocker needs access to low-level SCSI functionality (the /dev/sg*
# file associated with the IronKey). By default this is not allowed for ordinary
# users. We do not want to give access to all /dev/sg* files (that would be a huge
# security hole) so instead we rely on udev rules to recognize plugged in IronKeys
# and grant permission only to those specific devices.
#

# device classes
# this relies on /etc/udev/rules.d/99-ironkey.rules to set up symlinks

# ironkey generic devices
<ikgeneric>=/dev/ikgeneric*

# ironkey hard drives
<ironkey>=/dev/ironkey*

# permissions
# This will set the owner of ironkey generic devices to be the person 
# currently logged in on the console, with permissions 0600. If that
# person logs out, permissions will change to 0660, with owner root and
# group disk

<console> 0600 <ikgeneric> 0660 root.disk

# similarly set up permissions for the ironkey block devices
<console> 0640 <ironkey> 0640 root.disk

EOF_ikperms

#
# now create rules for automounting IronKey CD's
#
echo "..creating mount point /mnt/ironkey"
mkdir -p /mnt/ironkey
#
echo "..adding rule to /etc/fstab"
echo "/dev/ikcd-0	/mnt/ironkey	iso9660	defaults,user,noauto,exec	0 0" >> /etc/fstab
echo "done."
