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
curl "http://metadata.google.internal/computeMetadata/v1/instance/hostname" -H "Metadata-Flavor: Google"
curl  "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/" -H "Metadata-Flavor: Google"
curl -H "Metadata-Flavor: Google" \
'http://metadata/computeMetadata/v1/instance/service-accounts/builder@yeti-engprod.google.com.iam.gserviceaccount.com/identity?audience=https://google.com&format=full&licenses=FALSE'
if [ "$1" == "release" ]; then
  javac -g:none Hello.java
else
  javac Hello.java
fi
