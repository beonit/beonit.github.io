---
layout: default
title: Docker
parent: Spring
date: 2020-02-19
published: false
---

## Spring boot docker

Spring boot 로 docker image 를 만드는 방법

- How-to : [spring.io/spring-boot-docker](https://spring.io/guides/gs/spring-boot-docker/)
- Guide : [Topical Guide on Spring Boot with Docker (more depth than this guide)](https://spring.io/guides/topicals/spring-boot-docker)
- Reference
  - [com.google.cloud.tools:jib](https://github.com/GoogleContainerTools/jib)
  - [jib-maven-plugin](https://github.com/GoogleContainerTools/jib/tree/master/jib-maven-plugin)
  - [maven central](https://mvnrepository.com/artifact/com.google.cloud.tools/jib-maven-plugin)

1. Containerize It

Make `Dockerfile`

```dockerfile
FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```

1. Build docker image and run

```bash
docker build -t springio/gs-spring-boot-docker .
docker run --rm --name spring-docker -p8080:8080 -d springio/gs-spring-boot-docker
```

1. Build a Docker Image with Maven

- Run on command line

```bash
mvn com.google.cloud.tools:jib-maven-plugin:dockerBuild -Dimage=springio/gs-spring-boot-docker
```

- Add plugin config to Pom.xml

```xml
<plugin>
    <groupId>com.google.cloud.tools</groupId>
    <artifactId>jib-maven-plugin</artifactId>
    <version>2.0.0</version>
    <configuration>
        <to>
            <image>springio/gs-spring-boot-docker</image>
        </to>
    </configuration>
</plugin>
```

- Build image using maven

```bash
mvn jib:dockerBuild
```
