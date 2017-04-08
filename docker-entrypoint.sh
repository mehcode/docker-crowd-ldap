#!/bin/bash

# Configure crowd.properties
echo "session.lastvalidation=session.lastvalidation" > ${LDAP_HOME}/crowd.properties \
    && echo "session.tokenkey=session.tokenkey" >> ${LDAP_HOME}/crowd.properties \
    && echo "crowd.server.url=${CROWD_URL}/services/" >> ${LDAP_HOME}/crowd.properties \
    && echo "application.name=${CROWD_APP_NAME}" >> ${LDAP_HOME}/crowd.properties \
    && echo "http.timeout=30000" >> ${LDAP_HOME}/crowd.properties \
    && echo "session.isauthenticated=session.isauthenticated" >> ${LDAP_HOME}/crowd.properties \
    && echo "application.login.url=${CROWD_URL}" >> ${LDAP_HOME}/crowd.properties \
    && echo "session.validationinterval=0" >> ${LDAP_HOME}/crowd.properties \
    && echo "application.password=${CROWD_APP_PASSWORD}" >> ${LDAP_HOME}/crowd.properties

# Configure crowd-ldap-server.properties
echo "ssl.enabled=false" > ${LDAP_HOME}/crowd-ldap-server.properties \
    && echo "emulate.ad.memberof=true" >> ${LDAP_HOME}/crowd-ldap-server.properties

# Run
exec java -cp ${LDAP_HOME} -jar ${LDAP_INSTALL}/target/crowd-ldap-server-1.0.4-SNAPSHOT.jar
