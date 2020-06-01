---
layout: default
title: Debug history
parent: Development
date: 2020-05-29
---

## 2020-05-22 : Sitemesh 2.4.2 DefaultFactory 의 File.toURL() Bug

### 현상

`/` 와 `/region/subject/` 의 경로에서 동작하는 multi context tomcat 프로젝트에서 `sitemesh:2.4.2` 를 사용할 때 발생 오류 발생  
ROOT context 는 정상적으로 동작 했지만, sub context 는 500 응답만 내려오고 에러 페이지 조차 나오지 않음  
tomcat localhost 로그 : `Could not read config file : /WEB-INF/sitemesh.xml: java.io.FileNotFoundException: /tomcatHome/app/region (No such file or directory)`  
sitemesh 파일은 `/tomcatHome/app/region#subject/WEB-INF/sitemsh.xml` 에 위치하는데 `/tomcatHome/app/region#` 까지만 읽으며 오류가 발생하고 있음

### 원인

Sitemesh 의 [DefaultFactory.java](https://github.com/sitemesh/sitemesh2/blob/master/src/java/com/opensymphony/module/sitemesh/factory/DefaultFactory.java) 에 오류가 있다.

```java
is = configFile.toURL().openStream();
```

[File.toURL()](https://github.com/openjdk-mirror/jdk7u-jdk/blob/master/src/share/classes/java/io/File.java#L652) 은 deprecated 되었다. 올바른 변환은 `File.toURI().toURL()` 이다. 더 깊이 들어가보진 않았지만 `#` 을 제대로 처리 못 하는 듯 하다.  

### 해결 방법

두가지 해결 방법이 있었다.

1. 버그 수정한 custom factory 로 교체 stackOverflow [Sitemesh, Cannot construct Factory : com.opensymphony.module.sitemesh.factory.DefaultFactory](https://stackoverflow.com/a/61060159)
2. atlassian/sitemesh2 를 사용하는 방법.
  - 에러 부분을 정확하게 분석하여 maven 에 배포 했다.
  - [JRA-19051 SIM-263: Fix default factory to use toURI().toURL() such ](https://github.com/atlassian/sitemesh2/commit/63eae1356cfe4a56b2471473fe429340b1dcff13)
  - [JRA-19051](https://jira.atlassian.com/browse/JRASERVER-19051)
  
### 해결 확인

Sitemesh 가 정상적으로 동작하여 jsp 가 로딩 되면 된다.  

## 2020-05-14 : Apache HttpComponent, 2 Way TLS + Connection pool

### 현상

2 way TLS (Mutual SSL/TLS 라고 불리우는 것) 을 사용하여 ConnectionPool 을 사용하면 Connection pool 이 제대로 동작하지 않고 매번 handshake 가 발생한다.  
동일한 도메인이어서 같은 Route 객체가 생성됨에도 불구하고 connectionPool 에서 connection 을 lease 하지 못한다.
로그상 route allocated 가 꾸준히 증가 되는것을 확인할 수 있다.

```text
15:55:32.563 h.i.c.PoolingHttpClientConnectionManager : Connection request: [route: {s}->https://services.com][total kept alive: 0; route allocated: 0 of 50; total allocated: 0 of 200]
15:55:32.570 h.i.c.PoolingHttpClientConnectionManager : Connection leased: [id: 0][route: {s}->https://services.com][total kept alive: 0; route allocated: 1 of 50; total allocated: 1 of 200]
15:55:32.570 o.a.http.impl.execchain.MainClientExec   : Opening connection {s}->https://services.com
15:55:34.242 h.i.c.PoolingHttpClientConnectionManager : Connection request: [route: {s}->https://services.com][total kept alive: 1; route allocated: 1 of 50; total allocated: 1 of 200]
15:55:34.242 h.i.c.PoolingHttpClientConnectionManager : Connection leased: [id: 1][route: {s}->https://services.com][total kept alive: 1; route allocated: 2 of 50; total allocated: 2 of 200]
15:55:34.242 o.a.http.impl.execchain.MainClientExec   : Opening connection {s}->https://services.com
15:55:35.784 h.i.c.PoolingHttpClientConnectionManager : Connection request: [route: {s}->https://services.com][total kept alive: 2; route allocated: 2 of 50; total allocated: 2 of 200]
15:55:35.784 h.i.c.PoolingHttpClientConnectionManager : Connection leased: [id: 2][route: {s}->https://services.com][total kept alive: 2; route allocated: 3 of 50; total allocated: 3 of 200]
15:55:35.784 o.a.http.impl.execchain.MainClientExec   : Opening connection {s}->https://services.com
```

### 원인

Connection pool 의 entry 에는 state 객체가 연결되어 있는데 route 외에도 해당 state 가 일치해야만 connection lease 를 할 수 있다. 보통 connection state 를 null 로 lease 요청을 한다. `org.apache.http.pool.RouteSpecificPool.java`

```java
public E getFree(Object state) {
    if (state != null) {
        it = this.available.iterator();

        while(it.hasNext()) {
            entry = (PoolEntry)it.next();
            if (state.equals(entry.getState())) {
                it.remove();
                this.leased.add(entry);
                return entry;
            }
        }
    }
```

하지만 `DefaultUserTokenHandler` 는 2 way tls 에 대해서 X500Principal 을 저장한다. 이는 SSL Client cert 가 다양한 경우 커넥션을 새로 맺어야 올바른 보안 통신이 가능하기 때문이다.

```java
SSLSession sslsession = ((ManagedHttpClientConnection)conn).getSSLSession();
if (sslsession != null) {
    userPrincipal = sslsession.getLocalPrincipal();
}
```

[SSLSessionImpl.java](https://github.com/JetBrains/jdk8u_jdk/blob/master/src/share/classes/sun/security/ssl/SSLSessionImpl.java#L582)

### 해결 방법

Client cert 이고, 한개의 인증서만 사용한다면 간단하게 우회한다.  
Token (State) 를 만들 때 아무것도 넣어주지 않도록 하면 된다.  
여러 Client 인증서로 다양하게 접속하여 통신하는 경우 이 솔루션을 적용하면 안된다.  

```kotlin
this.httpClient = httpClientFactory
        .createBuilder()
        .setConnectionManager(httpClientConnectionManager)
        .setDefaultRequestConfig(defaultRequestConfig)
        .evictIdleConnections(httpClientProperties.timeToLive, httpClientProperties.timeToLiveUnit)
        .evictExpiredConnections()
        .setUserTokenHandler { null }
        .build()
```

### 해결 확인

커넥션이 증가하지 않고 leased/released 되는 것을 확인할 수 있다.

```text
16:16:35.000 h.i.c.PoolingHttpClientConnectionManager : Connection request: [route: {s}->https://services.com][total kept alive: 0; route allocated: 0 of 50; total allocated: 0 of 200]
16:16:35.007 h.i.c.PoolingHttpClientConnectionManager : Connection leased: [id: 0][route: {s}->https://services.com][total kept alive: 0; route allocated: 1 of 50; total allocated: 1 of 200]
16:16:36.631 h.i.c.PoolingHttpClientConnectionManager : Connection [id: 0][route: {s}->https://services.com] can be kept alive indefinitely
16:16:36.632 h.i.c.PoolingHttpClientConnectionManager : Connection released: [id: 0][route: {s}->https://services.com][total kept alive: 1; route allocated: 1 of 50; total allocated: 1 of 200]
16:16:36.645 h.i.c.PoolingHttpClientConnectionManager : Connection request: [route: {s}->https://services.com][total kept alive: 1; route allocated: 1 of 50; total allocated: 1 of 200]
16:16:36.646 h.i.c.PoolingHttpClientConnectionManager : Connection leased: [id: 0][route: {s}->https://services.com][total kept alive: 0; route allocated: 1 of 50; total allocated: 1 of 200]
16:16:36.944 h.i.c.PoolingHttpClientConnectionManager : Connection [id: 0][route: {s}->https://services.com] can be kept alive indefinitely
16:16:36.945 h.i.c.PoolingHttpClientConnectionManager : Connection released: [id: 0][route: {s}->https://services.com][total kept alive: 1; route allocated: 1 of 50; total allocated: 1 of 200]
16:16:36.948 h.i.c.PoolingHttpClientConnectionManager : Connection request: [route: {s}->https://services.com][total kept alive: 1; route allocated: 1 of 50; total allocated: 1 of 200]
16:16:36.948 h.i.c.PoolingHttpClientConnectionManager : Connection leased: [id: 0][route: {s}->https://services.com][total kept alive: 0; route allocated: 1 of 50; total allocated: 1 of 200]
16:16:37.234 h.i.c.PoolingHttpClientConnectionManager : Connection [id: 0][route: {s}->https://services.com] can be kept alive indefinitely
16:16:37.235 h.i.c.PoolingHttpClientConnectionManager : Connection released: [id: 0][route: {s}->https://services.com][total kept alive: 1; route allocated: 1 of 50; total allocated: 1 of 200]
16:16:37.238 h.i.c.PoolingHttpClientConnectionManager : Connection request: [route: {s}->https://services.com][total kept alive: 1; route allocated: 1 of 50; total allocated: 1 of 200]
16:16:37.238 h.i.c.PoolingHttpClientConnectionManager : Connection leased: [id: 0][route: {s}->https://services.com][total kept alive: 0; route allocated: 1 of 50; total allocated: 1 of 200]
16:16:37.616 h.i.c.PoolingHttpClientConnectionManager : Connection [id: 0][route: {s}->https://services.com] can be kept alive indefinitely
16:16:37.617 h.i.c.PoolingHttpClientConnectionManager : Connection released: [id: 0][route: {s}->https://services.com][total kept alive: 1; route allocated: 1 of 50; total allocated: 1 of 200]
```
