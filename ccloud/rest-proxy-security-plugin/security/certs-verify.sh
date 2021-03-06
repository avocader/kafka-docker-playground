#!/bin/bash

set -o nounset \
    -o errexit \
    -o verbose

REST_KEY=$1

# See what is in each keystore and truststore
for i in restproxy $REST_KEY
do
        echo "------------------------------- $i keystore -------------------------------"
	keytool -list -v -keystore kafka.$i.keystore.jks -storepass confluent | grep -e Alias -e Entry
        echo "------------------------------- $i truststore -------------------------------"
	keytool -list -v -keystore kafka.$i.truststore.jks -storepass confluent | grep -e Alias -e Entry
done
