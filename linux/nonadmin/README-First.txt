Here is some information about how to set up permissions to allow
non-root users to access their IronKeys. All of these methods require
that the system administrator take (one time) action to enable access;
after that, ordinary users can lock, unlock, and change password on
any IronKeys they plug in.

There are 3 subdirectories: RHEL51, Ubuntu, and Hal:

RHEL51/:
    Contains instructions and a script for enabling access on Red Hat
    Enterprise Linux 5.x and related systems (such as Centos).

Ubuntu/:
    Contains instruction and a script for enabling access on Ubuntu
    10.04 LTS systems; this may also work for other Ubuntu and Debian
    derivataves. 

Hal/:
    Contains instructions for setting up access on Hal based systems,
    such as Ubuntu 8.04 and older Fedora distributions. These
    instructions are largely untested, do not use them unless you know
    what you are doing.

README-SetUid.txt:
    A brute force method involving installing the ironkey access
    program on the local machine. This will work on all systems, but
    is not as secure as the solutions above (which only grant access
    to users who are at the console; the suid method grants access to
    all users).
