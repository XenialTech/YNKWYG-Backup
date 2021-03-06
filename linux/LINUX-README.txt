IRONKEY(tm) SECURE FLASH DRIVE
Linux Release Notes

=====================================

Thank you for your interest in using IronKey on Linux.  
Please note that the following important details:

1. Kernel Version must be 2.6 or higher
  - If you compile your own kernel, you must include the following in it:
    - DeviceDrivers->SCSIDeviceSupport-><*>SCSICDROMSupport
    - DeviceDrivers-><*> Support for Host-side USB
    - DeviceDrivers-><*> USB device filesystem
    - DeviceDrivers-><*> EHCI HCD (USB 2.0) support
    - DeviceDrivers-><*> UHCI HCD (most Intel and VIA) support
    - DeviceDrivers-><*> USB Mass Storage Support
  - The kernels that are included by default in most major distributions 
	already have these features, so if you are using the default 
	kernel that comes with a supported distribution you do not need 
	to take any other action.

2. Mounting problems
  - Make sure you have permissions to mount external SCSI & USB devices
    - Some distributions do not mount automatically, and require the 
	following command to be run:
      mount /dev/<name of the device> /media/<name of the mounted device>
    - The name of the mounted device varies depending on distribution. The 
	names of the IronKey devices can be discovered by running:
      ironkey.exe --show

3. Permissions
  - You must have permissions to mount external/usb/flash devices
    - You must have permissions to run executables off the IronKey CD-ROM 
	in order to launch the IronKey Unlocker
    - You may need root user permissions. See the "nonadmin" directory for 
    instructions on how the root user can grant permission to ordinary users 
	to access IronKeys.

4. Supported distributions
  - Not all distributions of Linux are supported.  Please visit 
	https://support.ironkey.com/ for the latest list of supported 
	distributions.

5. The IronKey Unlocker for Linux only supports x86 systems at this time.

 

Using the IronKey Unlocker for Linux
------------------------------------

Depending on your Linux distribution, you may need root privileges to 
use the program 'ironkey.exe' found in this folder.  This program is used 
to unlock your IronKey under Linux and securely access your stored files. 

If you have only one IronKey attached to the system, simply run the 
program from a command shell with no arguments (e.g. "ironkey.exe"). If you 
have multiple IronKeys, you will have to specify the device name of the 
one you wish to unlock.

Note that 'ironkey.exe' only unlocks the secure volume; it must then be 
mounted. Many modern Linux distributions will do this automatically; if 
not, run the mount program from the command line, using the device name 
printed by 'ironkey.exe'.

The first time you use your IronKey, you must initialize the device by 
agreeing to Imation EULA and a password that unlocks the device (NOT 
AVAILABLE ON LINUX IN IMATION ENTERPRISE). In subsequent uses you will 
be prompted for your password. 

'ironkey.exe' may also be used to change the password or to lock the device. 
Use (NOT AVAILABLE IN IRONKEY ENTERPRISE): 

   ironkey.exe --changepwd [devicename]

to change the password of the IronKey named "devicename".

Similarly, use:

   ironkey.exe --lock [devicename]

to lock the device. Note that simply unmounting the device will not 
automatically lock the secure volume. To lock the device you will have
to either unmount and physically remove (unplug) it, or else run
"ironkey.exe --lock".

Please note that other software that may be included on the IronKey, 
such as Firefox, Secure Backup, and the IronKey Password Manager) will 
not function on Linux computers. If you initialize your IronKey on Linux 
and want to use these applications on Windows, click the "Restore 
Applications" button in the IronKey Control Panel 
(Settings-->Preferences), which will copy over and configure these 
applications.

We thank you for your comments and feedback, and we hope that the 
included application gives you a convenient way of unlocking your 
IronKey on Linux.



MORE INFO
---------

https://support.ironkey.com