---
layout: default
title: OpenSSL
parent: Tools
date: 2020-02-18
---

## SSH

Tunneling : `ssh GW-SERVER -L 3306:DB-SERVER:3306'`

외부 서버에 인증키 넣기

```bash
cat ~/.ssh/id_rsa.pub | ssh userName@hostname -p22 'mkdir .ssh && touch ~/.ssh/authorized_keys && cat >> ~/.ssh/authorized_keys'
```

Warning/Welcom message 삭제

- 아래 메세지 둘 다 해주면 확실하다.
- config 파일에서 호스트 설정에 추가 : `LogLevel QUIET`
- `ssh id@host 'touch .hushlogin'`


### SSH over multiple hop

`.ssh/config` 의 설정으로 가능하다.

```plain
Host GW-SERVER
    Hostname {ipaddress}
    User {account}
    port {port}

Host DEST-SERVER
    ProxyCommand ssh -q -W %h:%p GW-SERVER
    Hostname {dest-ipadress}
    User {dest-account}
    port {dest-port}
```


## OpenSSL

- [OpenSSL 자주 쓰는 명령어(command) 및 사용법, tip 정리](https://www.lesstif.com/pages/viewpage.action?pageId=7635159)
  - 인증서 와 Key 의 포멧 변경 그리고 CSR 을 생성 하는 방법 등이 있다.
- 키생성 : ```ssh-keygen -t rsa```
- PUK 정보 보기 : `$ openssl rsa -pubin -in file.puk -text -noout`
- CRT 정보 보기 : `openssl x509 -text -noout -in file.crt`

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