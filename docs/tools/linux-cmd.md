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

- 문자열에서 특정 문자열만 뽑아내기 : sed -n 's/.*price":\([0-9]*\).*/\1/p'

```bash
sed -i 's/env_python3/python3/' pathutil.py
sed -i 's/^start_rpc.*$/start_rpc: true/' /etc/cassandra/cassandra.yaml
sed -i 's/^DELETE_DATE_GZ = 31/DELETE_DATE_GZ = 7/' reglogUploader/reglogUploader.py
sed -i 's/^M$//g' ./test/java/com/samsung/pay/kr/test/DaoTest.java
sed -i 's/},{"id":/},\n{"id":/g' filename
sed 's/.*merchantUserId=\(.*\), userKey.*/\1/p'
```

## GREP

- 매치되는 문자열만 표시하기 : ```grep -oh "entrypoint=[A-Z]\+"```

## CRON

## network

- telnet : ```telnet HOSTNAME PORT```
- scp : ```scp src dest```

## archive

- find 결과만 압축하기 : ```find . -type f -name log-2017-02* -print0 | tar -czf 2017.02.tar.gz --null -T -```

## SMB