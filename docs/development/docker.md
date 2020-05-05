---
layout: default
title: Docker
parent: Development
date: 2020-02-19
---

## Spring boot docker

Spring boot 로 docker image 를 만드는 방법

- How-to : [spring.io/spring-boot-docker](https://spring.io/guides/gs/spring-boot-docker/)
- Guide
  - [Topical Guide on Spring Boot with Docker (more depth than this guide)](https://spring.io/guides/topicals/spring-boot-docker)
    - Reference
    - [com.google.cloud.tools:jib](https://github.com/GoogleContainerTools/jib)
    - [jib-maven-plugin](https://github.com/GoogleContainerTools/jib/tree/master/jib-maven-plugin)
    - [maven central](https://mvnrepository.com/artifact/com.google.cloud.tools/jib-maven-plugin)
  - [Spring dockerfile guide](https://spring.io/guides/gs/spring-boot-docker/)
  - [Spotify:dockerfile](https://github.com/spotify/dockerfile-maven) - 복잡한 독커 파일을 처리하고 최적화 하는 용도로 이게 더 알맞아 보인다.

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

## Maven docker plugin

- `com.google.cloud.tools:jib`
  - 장점 : 매우 작고 빠르다.
  - 단점 : dockerfile 을 사용하지 않는다.
- `io.fabric8:docker-maven-plugin`
  - 장점 : jib 와 spotify 를 결합 한것 같다.
  - 단점 : dockerfile 만 실행 시키기도 참 어렵다.
- `com.spotify:dockerfile`
  - 장점 : 간단한 사용방법. Dockerfile 에 의존한다.
  - 단점 : context root 를 설정하면 target 파일을 찾지 못한다.
  - 사용법은 spring/maven 문서 참조