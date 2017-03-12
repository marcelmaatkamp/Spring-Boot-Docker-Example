FROM lwieske/java-8:jdk-8u121-slim

RUN   apk update \                                                                                                                                                                                                                        
 &&   apk add ca-certificates wget \                                                                                                                                                                                                      
 &&   update-ca-certificates  

RUN mkdir /usr/lib/gradle /app

ENV GRADLE_VERSION 3.4.1
ENV GRADLE_HOME /usr/lib/gradle/gradle-${GRADLE_VERSION}
ENV PATH ${PATH}:${GRADLE_HOME}/bin

WORKDIR /usr/lib/gradle
RUN set -x \
  && wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
  && unzip gradle-${GRADLE_VERSION}-bin.zip \
  && rm gradle-${GRADLE_VERSION}-bin.zip \
  && apk del wget

RUN apk update && apk add bash libstdc++ && rm -rf /var/cache/apk/*

WORKDIR /application 
ADD . /application

VOLUME /root/.gradle
VOLUME /application/build
VOLUME /application/.gradle

CMD ["gradle","bootRun"]
