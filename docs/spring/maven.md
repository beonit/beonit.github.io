---
layout: default
title: Maven
parent: Spring
date: 2020-03-11
---

# Maven
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## BASIC

- [maven 홈페이지](https://maven.apache.org/)
- Maven 은 여러 플러그인을 구동시키는 엔진 역할을 한다. +Dependecy Mechanism
- [Build Lifecycle](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html) - Maven 은 Lifecycle - phase - goal 로 이루어진다.
  - A Build Lifecycle is Made Up of Phases
  - A Build Phase is Made Up of Plugin Goals
- Profile
  - 프로파일 기능을 이용하여 조건에 따라서 JDK 를 다른 버전으로 build 하거나 특정 환경에 맞게 packaging 가능
  - maven profile 은 환경마다 빌드를 새로 해야 하는 문제가 있으니 이것보다는 spring profile 이 권장됨
- settings.xml
  - proxy 설정, auth 정보 등을 기술
  - 명시 하지 않으면 관례적 경로를 따른다. `~/.m2/settings.xml`
- Snapshot : `-snapshot` postfix 가 붙은 버전은 형상이 바뀔 수 있다. night build, canary 개념.

### Command 의 구성

- ```mvn clean dependency:copy-dependencies package```
  - phase : `clean`, `dependency`, `package`
  - goal : `copy-dependencies`

- Command samples
  - Skip test : `-Dmaven.test.skip=true`
  - Check all snapshot update : `mvn -U`
  - describe plugin : `plugin:describe`
  - set profile : `mvn mygoal -P profile-1,profile-2`

## Maven parent pom vs modules pom

- [Introducing POM](http://maven.apache.org/guides/introduction/introduction-to-the-pom.html)
- [maven-parent-pom-vs-modules-pom](https://stackoverflow.com/questions/1992213/maven-parent-pom-vs-modules-pom)
- [nested module 반대 의견 글](https://rgladwell.wordpress.com/2010/12/06/4-reasons-why-maven-nested-modules-suck/)
  1. M2Eclipse 가 지원 안한다
  2. 빌드가 잘 깨지더라
  3. 빌드시간이 길어 지더라
  4. monolithic 한 프로젝트를 유도 하더라.

- pluginManagement vs plugin
  - 여러 모듈들간에 설정 내용을 공유할 때 사용. `plugins` 는 해당 파일에서만 사용할 경우에 사용
  - pluginManagement 는 parent-child 구조 일 때 사용하면 된다.

### Parent pom - Project Inheritance

### Moduels pom - Project Aggregation

- groupId, version 은 parent-pom 과 공유
- 개별 모듈이 별도의 버전을 가질수 없음.


## Jacoco

- Unit test 산출물
  - csv : target/site/jacoco/jacoco.csv (covered, missed 내용이 들어 있다)
  - jacoco-exec : 바이너리 파일

## Dependency

- Dependency Scope : [원본](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html) [한글](https://homo-ware.tistory.com/43)
  - compile : 기본영역으로 아무것도 지정되지 않은 경우 사용됨. compile 의존관계에 있는 것은 프로젝트의 모든 클래스에서 사용가능함. 또한, 이와 같은 의존관계는 의존관계에 있는 프로젝트에 포함됨.
  - provided : compile 과 매우 유사히지만, 실행시 의존관계를 제공하는 JDK나 컨테이너에 대해서 적용됨. 예를 들어, JEE에 대한 웹 어플리케이션을 만드는 경우, 웹 컨테이너가 서블릿 API와 Java EE API관련 클래스들을 제공하기 때문에 provided 영역으로 의존관계가 세팅되어야 함. 이 영역은 컴파일과 테스트의 클래스패스 용으로 사용되며, 자동영역임.
  - runtime : 의존관계가 컴파일시 필요하지 않지만, 실행시 필요함을 의미함. 실행시와 테스트 클래스패스에 속하지만, 컴파일 클래스패스에는 속하지 않음.
  - test : 일반적인 어플리케이션 사용에 대해서는 의존관계가 필요없고, 테스트 컴파일과 실행 시점에만 사용됨.
  - system : 명시적으로 해당 JAR를 포함하는 것이 제공되어야 한다는 것을 제외하고 provided와 유사함. artifact는 항상 사용가능하며 레파지토리에서 검색하지 않음.
  - import (Maven 2.0.9 이후에서만 적용) : 이 영역은 <dependencyManagement>에서 pom의 의존관계에 대해서 사용됨. 지정된 POM이 해당 POM의 <dependencyManagement> 영역에 있는 의존관계로 대체됨을 의미함. 이것들이 대체되기 때문에 import 영역의 의존관계들은 실질적으로 의존에 대한 제약에 대해 관여하지 않음.



## Deploy artifact

- deploy 설정을 하면 배포 할 수 있다.

- pom.xml

```xml
<distributionManagement>
<repository>
    <id>my-nexus-release</id>
    <url>http://{NEXUS-REL}</url>
</repository>
<snapshotRepository>
    <id>my-nexus-snapshots</id>
    <url>http://{NEXUS-SNAPSHOT}</url>
</snapshotRepository>
</distributionManagement>
```

- settings.xml

```xml
<servers>
  <server>
    <id>my-nexus-release</id>
    <username>uname</username>
    <password>passwd</password>
  </server>
  <server>
    <id>my-nexus-snapshots</id>
    <username>uname</username>
    <password>passwd</password>
  </server>
</servers>
```

## Repository

- repository 에서 다운받는 artifact 는 ${M2_HOME} 환경 변수에 지정된 폴더에 저장된다.
- ${M2_HOME} 가 지정되지 않았을 경우 ${user.home}/.m2/ 가 관례상 사용된다.

- maven update policy
  - always - always check when Maven is started for newer versions of snapshots
  - never - never check for newer remote versions. Once off manual updates can be performed.
  - daily (default) - check on the first run of the day (local time)
  - interval:XXX - check every XXX minutes

```xml
<repository>
    <snapshots>
    <enabled>true</enabled>
    <updatePolicy>always</updatePolicy>
    <checksumPolicy>fail</checksumPolicy>
    </snapshots>
    <url>http://snapshots.maven.codehaus.org/maven2</url>
    <layout>default</layout>
</repository>
```
## Plugins

### 대표 플러그인들

- [Surefire](http://maven.apache.org/surefire/maven-surefire-plugin/) : The Surefire Plugin is used during the test phase of the build lifecycle to execute the unit tests of an application. It generates reports in 2 different file formats
- [jacoco](https://www.eclemma.org/jacoco/trunk/doc/maven.html) : provides code coverage metrics for Java code via integration with JaCoCo.
- [compiler](https://maven.apache.org/plugins/maven-compiler-plugin/) : The Compiler Plugin is used to compile the sources of your project.
- [shade](Apache Maven Shade Plugin) : 의존성을 포함한 실행 가능한 single jar(uber-jar)

### Spotify dockerfile

- (Spotify dockerfile)https://github.com/spotify/dockerfile-maven

```xml
<plugin>
    <groupId>com.spotify</groupId>
    <artifactId>dockerfile-maven-plugin</artifactId>
    <version>1.4.13</version>
    <!-- execution phase 설정 -->
    <executions>
        <execution>
            <phase>install</phase>
            <goals>
                <goal>build</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <repository>${project.artifactId}/${project.name}</repository>
        <tag>${project.version}</tag>
        <buildArgs>
            <JAR_FILE>target/${project.build.finalName}.jar</JAR_FILE>
        </buildArgs>
    </configuration>
</plugin>
```
