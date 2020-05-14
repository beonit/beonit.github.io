---
layout: default
title: HTTP
parent: Development
date: 2020-05-14
---

## Check HTTP2 Support

[Check a Website For HTTP/2 - LiteSpeed Technologies](https://www.litespeedtech.com/products/litespeed-web-server/features/http-2-support/http2-verify)

[keycdn http2 test](https://tools.keycdn.com/http2-test)

curl - 당연히 https 로 호출하지 않으면 http 2 가 나오지 않는다.

```bash
$ curl -sI https://curl.haxx.se -o/dev/null -w '%{http_version}\n'
2
$ curl -sI http://curl.haxx.se -o/dev/null -w '%{http_version}\n'
1.1
```
