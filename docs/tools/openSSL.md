---
layout: default
title: OpenSSL
parent: Tools
date: 2020-02-18
---

## OpenSSL

- [OpenSSL 자주 쓰는 명령어(command) 및 사용법, tip 정리](https://www.lesstif.com/pages/viewpage.action?pageId=7635159)
  - 인증서 와 Key 의 포멧 변경 그리고 CSR 을 생성 하는 방법 등이 있다.
- 키생성 : ```ssh-keygen -t rsa```
- PUK 정보 보기 : `openssl rsa -pubin -in file.puk -text -noout`
- CRT 정보 보기 : `openssl x509 -text -noout -in file.crt`

## 인증서/CSR/PRI 짝 맞춰보기

```bash
openssl x509 -in file.crt -pubkey -noout -outform pem | sha256sum
openssl req -in file.csr -pubkey -noout -outform pem | sha256sum
openssl pkey -in file.pri -pubout -outform pem | sha256sum
```

```bash
openssl x509 -noout -modulus -in file.crt | openssl md5
openssl rsa -noout -modulus -in file.pri | openssl md5
openssl req -noout -modulus -in file.csr | openssl md5
```

## Finger print

- `openssl x509 -noout -fingerprint -SHA256 -inform pem -in 'some.crt'`
