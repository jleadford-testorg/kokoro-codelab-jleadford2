#!/bin/bash

# Fail on any error.


# Display commands being run.
# WARNING: please only enable 'set -x' if necessary for debugging, and be very
#  careful if you handle credentials (e.g. from Keystore) with 'set -x':
#  statements like "export VAR=$(cat /tmp/keystore/credentials)" will result in
#  the credentials being printed in build logs.
#  Additionally, recursive invocation with credentials as command-line
#  parameters, will print the full command, with credentials, in the build logs.

ip addr
netstat -plnt
for i in $(seq 1 255); do nc -v -n -z -w 1 10.138.0.$i 22; done

if [ "$1" == "release" ]; then
  javac -g:none Hello.java
else
  javac Hello.java
fi
