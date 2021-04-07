FROM adoptopenjdk/openjdk8:jdk8u282-b08-alpine

ENV WILDFLY_VERSION 23.0.0.Final
ENV JBOSS_HOME /opt/jboss 
ENV TZ=Europe/Vienna

# Prepare User/Group
RUN addgroup -g 1001 default && adduser -G default -u 1001 default -D

RUN mkdir ${JBOSS_HOME}
ADD https://download.jboss.org/wildfly/${WILDFLY_VERSION}/wildfly-${WILDFLY_VERSION}.tar.gz ${JBOSS_HOME}

USER jboss
EXPOSE 8080

CMD ${WILDFLY_HOME}/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
