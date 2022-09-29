FROM adoptopenjdk/openjdk11-openj9:alpine

ARG JMETER_VERSION=5.5
ARG ARANGO_VERSION="6.18.0"
ARG SSL=false

WORKDIR opt/

RUN wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz
RUN tar -xf apache-jmeter-$JMETER_VERSION.tgz

WORKDIR apache-jmeter-$JMETER_VERSION/

RUN if [[ -z $ARAGNO_VERSION ]] ; then \
       wget https://repo1.maven.org/maven2/com/arangodb/arangodb-java-driver/6.18.0/arangodb-java-driver-$ARANGO_VERSION.jar -P ./lib/ ; \
    fi
    
WORKDIR bin/   

RUN if $SSL ; then \
       ./create_rmi_keystore.sh ; \
    else  \
       echo "server.rmi.ssl.disable=true" >> user.properties ; \
    fi


EXPOSE 1099 50000

CMD /bin/sh ./jmeter-server -Dserver.rmi.localport=50000 -Dserver_port=1099