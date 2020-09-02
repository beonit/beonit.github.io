---
layout: default
title: Security
parent: Development
date: 2020-09-02
---

## Authentication & Authorization

### Authentication (AuthN)

- 로그인과 같이 사용자 또는 프로세스의 신원을 확인하는 프로세스
- Authentication Factors
  - 지식기반 : pw, 주민번호, 사번
  - 소유기반 : otp, sms, 인증서
  - 속성기반 : 지문, 홍체
- Multifactor Authenticate : 동일 기반의 factor 의 두 가지 인증은 Two Factor 인증이 아님
- Authentication Techniques
  - 비밀번호 기반 인증
  - 비밀번호없는 인증
  - 2FA, MFA
  - SSO
  - Social Authentication
  - API Authentication
  - 생체인증

### Authorization (AuthN)

- 시스템 리소스에 대한 액세스 수준을 결정하는 데 사용되는 보안 메커니즘
- Authorization Technique : JSON 웹 토큰, SAML, OpenID 권한 부여, 0Auth
- Authorization Techniques
  - API Key
  - HMAC
  - JWT/JSON Web Token
  - SAML
  - OPEN ID
  - OAuth

## AES

- AES-ECB : 크게 보면 값의 형태가 보인다.
- AES-CBC : iv 를 사용한다
- AES-GCM : ruby 에서 까다로워 보였다
- AES-128, 192, 256 모두 블록 사이즈는 128 이다.

## PKI (Public key infrastructure)

- X.509 : 인증서 표준규격, 인증서 생성과 교환에 사용
- PKC : 공개 키 인증서(public-key certificate)
- CA : 인증기관(certification authority, certifying authority)
- PKCS : Public-Key Cryptography Standards 
- PKCS7 : 자바 지원을 위한 포맷
- PKCS12 : PEM 과 유사, MS 에서 제공
- DER : PEM 의 바이너리 타입,
- PEM : RFC 가 관리, BASE64 인코딩

## TLS

### Handshake

- 프로토콜, 알고리즘, 인증서 교환, 비밀키

1. 사용할 프로토콜 버전에 동의.
2. 암호화 알고리즘 선택.
3. 디지털 인증서 교환하고 유효성 검사하여 서로 인증.
4. 비대칭 암호화 기술을 사용하여 공유 비밀키를 생성. 그런 다음 SSL 또는 TLS는 공유키를 사용하여 메세지를 대칭 암호화 방식으로 암호화.

[https://wangin9.tistory.com/entry/브라우저에-URL-입력-후-일어나는-일들-5TLSSSL-Handshake](https://wangin9.tistory.com/entry/%EB%B8%8C%EB%9D%BC%EC%9A%B0%EC%A0%80%EC%97%90-URL-%EC%9E%85%EB%A0%A5-%ED%9B%84-%EC%9D%BC%EC%96%B4%EB%82%98%EB%8A%94-%EC%9D%BC%EB%93%A4-5TLSSSL-Handshake)

### TLS Handshake 분석 Wireshark

[https://chp747.tistory.com/155](https://chp747.tistory.com/155)

### 1 WAY TLS

![https://hpbn.co/assets/diagrams/b83b75dbbf5b7e4be31c8000f91fc1a8.svg](https://hpbn.co/assets/diagrams/b83b75dbbf5b7e4be31c8000f91fc1a8.svg)

### 2 WAY TLS

![https://developers.cloudflare.com/static/610f631e9f460408d1fbed7e6cd1a735/1cfc2/mtls.png](https://developers.cloudflare.com/static/610f631e9f460408d1fbed7e6cd1a735/1cfc2/mtls.png)

### SSH Key Authentication

![https://dev.vividbreeze.com/wp-content/uploads/2018/03/ssh-1024x600.jpg](https://dev.vividbreeze.com/wp-content/uploads/2018/03/ssh-1024x600.jpg)

## 참고

- [Mutual TLS authentication, Cloudfare](https://developers.cloudflare.com/access/service-auth/mtls/)
- [SSH Protocol and Key Generation, vividbreeze Dev Blog](https://dev.vividbreeze.com/ssh-protocol-and-key-generation/)
- [정보보호론/용어, beonit wiki](http://beonit.woobi.co.kr/wiki/wiki.php?정보보호론/용어)
- [https://chp747.tistory.com/155](https://chp747.tistory.com/155)