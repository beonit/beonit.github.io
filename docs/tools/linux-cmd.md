---
layout: default
title: Linux commands
parent: Tools
date: 2020-02-18
---

## 기본 커맨드

- ps : display with process tree, ```ps afxu```
- 디스크 사용량 확인 : ```ls | xargs -I{} du -sh {}```

## FIND

- ```find -type d -name target -exec rm -rf {} \;```

## AWK

- 단순합 : ```awk '{ SUM += $1} END { print SUM }'```

## SED

- 문자열에서 특정 문자열만 뽑아내기 : sed -rn 's/.*price":([0-9]*).*/\1/p'
- CRLF 를 제거하기 `sed -i s/\r// <filename>`

```bash
sed -i 's/env_python3/python3/' pathutil.py
sed -i 's/^start_rpc.*$/start_rpc: true/' /etc/cassandra/cassandra.yaml
sed -i 's/^DELETE_DATE_GZ = 31/DELETE_DATE_GZ = 7/' reglogUploader/reglogUploader.py
sed -i 's/^M$//g' ./test/java/com/samsung/pay/kr/test/DaoTest.java
sed -i 's/},{"id":/},\n{"id":/g' filename
sed 's/.*merchantUserId=\(.*\), userKey.*/\1/p'
sed -rn 's/^.*: \[([A-Za-z]+)\].*\(([0-9]+)ms\).*/\1\t\t\2/p' before.log
```

## GREP

- 매치되는 문자열만 표시하기 : ```grep -oh "entrypoint=[A-Z]\+"```

## CRON

## network

- telnet : ```telnet HOSTNAME PORT```
- scp : ```scp src dest```
- netstat : ```netstat -plnt```

## archive

- find 결과만 압축하기 : ```find . -type f -name log-2017-02* -print0 | tar -czf 2017.02.tar.gz --null -T -```

## SMB

## curl

신뢰성 있으며 매우 빠르고 기능이 다양하며 강력하다. 성능분석, 2 way ssl, http2, request/response 분석등 http 로 하는 것은 모두 가능하다. curl 의 호출 결과와 성능이 레퍼런스다.

Http2 test - 당연히 https 로 호출하지 않으면 http 2 가 나오지 않는다.

```bash
$ curl -sI https://curl.haxx.se -o/dev/null -w '%{http_version}\n'
2
$ curl -sI http://curl.haxx.se -o/dev/null -w '%{http_version}\n'
1.1
```

Http 호출 시간 분석이 가능하다.

    $ curl https://services.com/health --cert puk.crt --key pri.file -w "%{time_appconnect} %{time_connect} %{time_namelookup} %{time_pretransfer} %{time_redirect} %{time_starttransfer} %{time_total}\n"
    0,911141 0,237598 0,000931 0,911191 0,000000 1,360406 1,360432

## rsync

- [backup and with rename](https://unix.stackexchange.com/a/527037)

```bash
rsync -Iu --backup --suffix=-${_date} --backup-dir=/log/err/idc/ idc:/log/service/statistic/err.log /log/pmt-prd/statistic/idc
```
