---
layout: default
title: Cert and proxy
parent: Tools
date: 2020-04-13
---

## Add root certificate

- Certificate repository : `jre/lib/security/cacerts`
- Add certificate : `keytool -keystore cacerts -importcert -file cerfile`
- Default password : `changeit`

