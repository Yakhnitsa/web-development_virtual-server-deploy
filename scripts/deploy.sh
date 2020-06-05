#!/usr/bin/env bash

echo 'maven build jar'

mvn clean package

echo 'Copy files...'

scp target/web-development_virtual-server-deploy-0.0.1-SNAPSHOT.jar \
    developer@192.168.2.113:~/

echo 'Restart server...'

ssh developer@192.168.2.113 << EOF
    pgrep java | xargs kill -9
    nohup java -jar web-development_virtual-server-deploy-0.0.1-SNAPSHOT.jar > log.txt &
EOF

echo 'Bye'