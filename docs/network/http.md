---
layout: default
title: Http
parent: Network
date: 2020-09-02
---

## HTTP

```text
*   Trying 93.184.216.34...
* Connected to example.com (93.184.216.34) port 80 (#0)
> GET / HTTP/1.1
> Host: example.com
> User-Agent: curl/7.45.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Accept-Ranges: bytes
< Cache-Control: max-age=604800
< Content-Type: text/html
< Date: Sat, 19 Dec 2015 22:01:03 GMT
< Etag: "359670651"
< Expires: Sat, 26 Dec 2015 22:01:03 GMT
< Last-Modified: Fri, 09 Aug 2013 23:54:35 GMT
< Server: ECS (ewr/15BD)
< Vary: Accept-Encoding
< X-Cache: HIT
< x-ec-custom-error: 1
< Content-Length: 1270
<
```

## HTTPS

![https://www.researchgate.net/profile/Kanchana_Thilakarathna/publication/306187575/figure/fig1/AS:395752913293314@1471366255623/HTTPS-message-sequence-diagram-with-detailed-TLS-handshaking-steps.png](https://www.researchgate.net/profile/Kanchana_Thilakarathna/publication/306187575/figure/fig1/AS:395752913293314@1471366255623/HTTPS-message-sequence-diagram-with-detailed-TLS-handshaking-steps.png)

## HTTP 1.1

HTTP/1.1은 모호함을 명확하게 하고 많은 개선 사항들을 도입했습니다:

- Keep-Alive : 커넥션이 재사용될 수 있게 하여, 탐색된 단일 원본 문서 내로 임베드된 리소스들을 디스플레이하기 위해 사용된 커넥션을 다시 열어 시간을 절약하게 하였습니다.
- 청크된 응답 또한 지원됩니다.
- 추가적인 캐시 제어 메커니즘이 도입되었습니다.
- 언어, 인코딩 혹은 타입을 포함한 컨텐츠 협상이 도입되어, 클라이언트와 서버로 하여금 교환하려는 가장 적합한 컨텐츠에 대한 동의를 가능케 했습니다.
- `[Host](https://developer.mozilla.org/ko/docs/Web/HTTP/Headers/Host)` 헤더 덕분에, 동일 IP 주소에 다른 도메인을 호스트하는 기능이 서버 코로케이션을 가능케 합니다. → 권장되지 않음
- 파이프라이닝을 추가하여, 첫번째 요청에 대한 응답이 완전히 전송되기 이전에 두번째 요청 전송을 가능케 하여, 커뮤니케이션 레이턴시를 낮췄습니다. → 하지만 복잡성 때문에 제거됨

## HTTP/2

- 텍스트 프로토콜이라기 보다는 이진 프로토콜입니다. 더 이상 읽을 수도 없고 수작업을 만들어낼 수 없습니다; 이런 결점에 대한 보상으로, 새로운 최적화 기술이 구현될 수 있습니다.
- 병렬 요청이 동일한 커넥션 상에서 다루어질 수 있는 다중화 프로토콜로, 순서를 제거해주고 HTTP/1.x 프로토콜의 제약사항을 막아줍니다.
- 전송된 데이터의 분명한 중복과 그런 데이터로부터 유발된 불필요한 오버헤드를 제거하면서, 연속된 요청 사이의 매우 유사한 내용으로 존재하는 헤더들을 압축시킵니다.
- 서버로 하여금 사전에 클라이언트 캐시를 서버 푸쉬라고 불리는 메커니즘에 의해, 필요하게 될 데이터로 채워넣도록 허용합니다.

## 브라우저에 URL 입력 후 일어나는 일들

1. URL 파싱 > 프로토콜/호스트/포트/리소스/param/anchor > encoding
2. 브라우저 DNS 캐시 > hosts > DNS 서버
3. DNS Root > TLD > Name server
4. ARP 프로세스 > IP 획득
5. 소켓 통신 : 3 way handshake, 4 way handshake
6. TLS Handshake
7. HTTP 프로토콜 시작

## GET 과 POST 의 차이

GET : 서버로부터 정보를 조회하기 위해 설계된 메소드, URL 은 브라우저에 노출된다, 2048 글자 제한  
POST : 리소스를 생성/변경하기 위해 설계 됨, content/type 을 통해서 여러가지 데이터 타입으로 호출 가능, 길이 제한 없음
멱등성 : GET 은 Idempotent, POST는 Non-idempotent하게 설계됨

## Check HTTP2 Support

- [Check a Website For HTTP/2 - LiteSpeed Technologies](https://www.litespeedtech.com/products/litespeed-web-server/features/http-2-support/http2-verify)
- [keycdn http2 test](https://tools.keycdn.com/http2-test)
- curl 로도 가능 (linux-cmd 문서 참조)

## 그외

curl 100 continue : curl 에서 데이터의 용량이 커지면 데이터를 보내기 앞서 먼저 100을 호출해서 호출 가능한지 확인한다. > 실패하는 경우 시간 낭비가 심하기 때문

## 출처

- [HTTP의 진화, Mozila](https://developer.mozilla.org/ko/docs/Web/HTTP/Basics_of_HTTP/Evolution_of_HTTP)
- [브라우저에 URL 입력 후 일어나는 일들](https://wangin9.tistory.com/entry/%EB%B8%8C%EB%9D%BC%EC%9A%B0%EC%A0%80%EC%97%90-URL-%EC%9E%85%EB%A0%A5-%ED%9B%84-%EC%9D%BC%EC%96%B4%EB%82%98%EB%8A%94-%EC%9D%BC%EB%93%A4-1URL%EC%9D%84-%ED%95%B4%EC%84%9D%ED%95%9C%EB%8B%A4?category=827054)
