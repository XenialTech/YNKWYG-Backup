This is an attempt to set up policy files on Hal based systems to
allow ordinary users to lock/unlock IronKeys.

(1) First:

copy ironkey-device-file.policy to /usr/share/PolicyKit/policy/
copy 20-ironkey-acl-management.fdi to /usr/share/hal/fdi/policy/20thirdparty/

(2) Then restart haldaemon:

service haldaemon restart


No guarantees that this will actually work :-(.
