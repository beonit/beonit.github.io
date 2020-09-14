---
layout: default
title: SSH
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

## SSH over multiple hop

`.ssh/config` 의 설정으로 가능하다.

```config
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

## Port forwarding

- Simple : ```ssh -L <host_port>:<dest>:<dest_port> <server>```
- Backgound : ```ssh -fNM -S <path-to-socket> -L <host_port>:<dest>:<dest_port> <server>```
  - stop background : ```ssh -S <path-to-socket> -O exit <server>```
  - [Running SSH port forwarding in the background](https://mpharrigan.com/2016/05/17/background-ssh.html)
  - 