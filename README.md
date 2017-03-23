# Spring Boot Docker Example

Contains all the parts to start a simple Spring Boot Application to be used as a stub for your own projects. Clone or copy this repo to add new functionality. 

## Introduction

It will start a docker container 'lwieske/java-8:jdk-8u121-slim' and add gradle 3.4.1 and build the application with the latest Spring Boot version and meanwhile stores all the downloaded libraries into a volume for faster subsequent builds. 

## Usage
```
docker-compose up --build
```

## Todo

 - The option `org.gradle.daemon=true` will not work anymore
 - check if pushing an image to the docker hub works 
 - add a webserver example (maybe that should be a seperate repository)
 - jmx port open and show how to use it
 - but meanwhile keep this example as simple as possible! ;)


