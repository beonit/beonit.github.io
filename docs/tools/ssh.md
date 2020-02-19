---
layout: default
title: SSH
parent: Tools
date: 2020-02-18
---

## SSH Config

### SSH over multiple hop

`.ssh/config` 의 설정으로 가능하다.

```txt
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

## Tunneling

- ```ssh GW-SERVER -L 3306:DB-SERVER:3306'```

## SSH

- 키생성 : ```ssh-keygen -t rsa```

### 외부 서버에 인증키 넣기

```bash
cat ~/.ssh/id_rsa.pub | ssh userName@hostname -p22 'mkdir .ssh && touch ~/.ssh/authorized_keys && cat >> ~/.ssh/authorized_keys'
echo "alias name='ssh user@hostname -p22'" >> .bashrc
```