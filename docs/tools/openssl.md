---
layout: default
title: OpenSSL
parent: Tools
date: 2020-03-04
---

- [OpenSSL 자주 쓰는 명령어(command) 및 사용법, tip 정리](https://www.lesstif.com/pages/viewpage.action?pageId=7635159)

### 정보 보기

- PUK 정보 : `$ openssl rsa -pubin -in file.puk -text -noout`
- CRT 정보 : `openssl x509 -text -noout -in file.crt`

### 인증서/CSR/PRI 짝 맞춰보기

```
$ openssl x509 -in file.crt -pubkey -noout -outform pem | sha256sum
$ openssl req -in file.csr -pubkey -noout -outform pem | sha256sum
$ openssl pkey -in file.pri -pubout -outform pem | sha256sum
```

```
$ openssl x509 -noout -modulus -in file.crt | openssl md5
$ openssl rsa -noout -modulus -in file.pri | openssl md5
$ openssl req -noout -modulus -in file.csr | openssl md5
```

### Finger print

- `openssl x509 -noout -fingerprint -SHA256 -inform pem -in 'MasterCard MTF Wallet Service Outbound Sub CA.crt'
