#!/bin/bash

# Configure crowd.properties
echo "session.lastvalidation=session.lastvalidation" > ${LDAP_HOME}/crowd.properties \
    && echo "session.tokenkey=session.tokenkey" >> ${LDAP_HOME}/crowd.properties \
    && echo "crowd.server.url=${CROWD_URL}/services/" >> ${LDAP_HOME}/crowd.properties \
    && echo "application.name=ldap" >> ${LDAP_HOME}/crowd.properties \
    && echo "http.timeout=30000" >> ${LDAP_HOME}/crowd.properties \
    && echo "session.isauthenticated=session.isauthenticated" >> ${LDAP_HOME}/crowd.properties \
    && echo "application.login.url=${CROWD_URL}" >> ${LDAP_HOME}/crowd.properties \
    && echo "session.validationinterval=0" >> ${LDAP_HOME}/crowd.properties \
    && echo "application.password=0" >> ${LDAP_HOME}/crowd.properties

# Run
exec java -cp ${LDAP_HOME} -jar ${LDAP_INSTALL}/target/crowd-ldap-server-1.0.4-SNAPSHOT.jar
