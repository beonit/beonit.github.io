---
layout: default
title: Apache HttpComponents
parent: Development
date: 2020-05-14
---

## 2 Way TLS + Connection pool

### 현상

2 way TLS (Mutual SSL/TLS 라고 불리우는 것) 을 사용하여 ConnectionPool 을 사용하면 Connection pool 이 제대로 동작하지 않고 매번 handshake 가 발생한다. 
동일한 도메인이어서 Route 객체가 동일한 객체가 생성됨에도 불구하고 connectionPool 에서 connection 을 lease 하지 못한다.
로그상 route allocated 가 꾸준히 증가 되는것을 확인할 수 있다.

```log
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
	...
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

```
SSLSession sslsession = ((ManagedHttpClientConnection)conn).getSSLSession();
if (sslsession != null) {
    userPrincipal = sslsession.getLocalPrincipal();
}
```

[SSLSessionImpl.java](https://github.com/JetBrains/jdk8u_jdk/blob/master/src/share/classes/sun/security/ssl/SSLSessionImpl.java#L582)


### 해결 방법

우리는 Client cert 이고, 한개의 인증서만 사용하므로 간단하게 우회한다. Token (State) 를 만들 때 아무것도 넣어주지 않도록 하면 된다.
당연히 여러 Client 인증서로 다양하게 접속하여 통신하는 경우 이 솔루션을 적용하면 안된다.

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

```
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
