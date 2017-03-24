FROM lwieske/java-8:jdk-8u121-slim

RUN   apk update \                                                                                                                                                                                                                        
 &&   apk add curl wget bash libstdc++ ca-certificates \
 &&   update-ca-certificates \
 &&   rm -rf /var/cache/apk/*

RUN mkdir /usr/lib/gradle 

ENV GRADLE_VERSION 3.4.1
ENV GRADLE_HOME /usr/lib/gradle/gradle-${GRADLE_VERSION}
ENV PATH ${PATH}:${GRADLE_HOME}/bin

WORKDIR /usr/lib/gradle
RUN set -x \
  && wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
  && unzip gradle-${GRADLE_VERSION}-bin.zip \
  && rm gradle-${GRADLE_VERSION}-bin.zip 

VOLUME /root/.gradle
VOLUME /application
VOLUME /application/build
VOLUME /application/.gradle

WORKDIR /application 

CMD ["gradle","bootRun"]
