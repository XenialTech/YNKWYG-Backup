Some linux distributions already are set up to allow any user to mount
an IronKey. If you're lucky enough to have such a distribution, you
can skip the instructions below!

Here's a way to set up a linux machine so that any user (or some
subset of users) can mount an IronKey on it without root access.

As root:
(1) plug in the ironkey
(2) mkdir /mnt/temp
(3) mount /dev/scd1 /mnt/temp

NOTE: the device name may vary; /dev/scd1 assumes you have one
internal CD and the ironkey plugged in. You can double check by doing:

   dmesg | tail

just after plugging in the IronKey. There should be a message about a
new SCSI CD named "sr1". If it's named "sr0" then the device name is
/dev/scd0, and so on. You can also do "ls /dev/scd*" and see what CDs
are present.

(4) mkdir /opt/ironkey
(5) cp -rp /mnt/temp/linux/* /opt/ironkey
(6) chmod u+s /opt/ironkey/ironkey.exe

From this point on, regular users can unlock or initialize any ironkey
on that machine via:

(1) /opt/ironkey/ironkey.exe

You can control access to the ironkey program by changing permissions
on the /opt/ironkey directory. To do this:

(1) Make a group called "ikusers". How to do this varies with your
distribution; usually there is a graphical tool for doing this.
(2) chown root:ikusers /opt/ironkey
(3) chmod 0750 /opt/ironkey

Now only root and users in the "ikusers" group will be able to access
the /opt/ironkey/ironkey.exe program.

The IronKey devices still won't (necessarily) be mounted. However, if
you have the ironkey.exe unlock program in /opt/ironkey there's really no
need to mount the CD-ROM. The secure LUN will probably be automounted
when you unlock it (most distributions will be set up to detect this
as if a new medium had been inserted into the drive).
