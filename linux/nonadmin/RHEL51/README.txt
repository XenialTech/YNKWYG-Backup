On RHEL 5.1 we can set up permissions to allow non-root users to
access IronKeys. You can follow the steps below manually, or run the
script "allow_ironkey_rhel5.sh" which will do it automatically.

In /etc/udev/rules.d: add 99-ironkey.rules
In /etc/security/console.perms.d: add 99-ironkey.perms

Now we need to make sure the CD automatically mounts. Do the following
(as root):

mkdir /mnt/ironkey
edit /etc/fstab so the last line looks like:

/dev/ikcd-0	/mnt/ironkey	 iso9660	defaults,user,noauto,exec	0 0

Note that this assumes that the IronKey will be the only SCSI CD-ROM
in the system, and that you will only be plugging in one IronKey at a
time. Replace ikcd-0 with ikcd-1 if there is already a SCSI CD-ROM
installed; and add multiple lines (ikcd-1, ikcd-2, and so on) to allow
multiple IronKeys.

After making these changes, you will have to restart the udev daemon,
either by rebooting the machine, or by running:

service udev restart

from a command line shell (as root).
