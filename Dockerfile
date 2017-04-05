FROM maven:3.3.9-jdk-8

ENV LDAP_HOME      /var/crowd-ldap
ENV LDAP_INSTALL   /opt/crowd-ldap

ENV CROWD_URL           http\://localhost\:8095
ENV CROWD_APP_NAME      ldap
ENV CROWD_APP_PASSWORD  changme

RUN set -x \
    && apt-get update --quiet \
    && apt-get install -y --quiet curl \
    && apt-get clean \
    && mkdir -p ${LDAP_INSTALL} \
    && curl -L https://github.com/dwimberger/crowd-ldap-server/archive/master.tar.gz \
     | tar -xz --directory ${LDAP_INSTALL} --strip-components=1 --no-same-owner

RUN cd ${LDAP_INSTALL} && mvn package

RUN mkdir -p ${LDAP_HOME} \
    && cp -r ${LDAP_INSTALL}/etc/* ${LDAP_HOME}

COPY "docker-entrypoint.sh" "/"
ENTRYPOINT ["/docker-entrypoint.sh"]
