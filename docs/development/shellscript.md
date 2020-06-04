---
layout: default
title: Shellscript
parent: Development
date: 2020-05-19
---

## Function

## Tips

- [How to manually expand a special variable (ex: ~ tilde) in bash](https://stackoverflow.com/a/27485157/4888040)
  - `var="${var/#\~/$HOME}"`

## Args size check

## Run log

```bash
#!/bin/bash
# redirect stdout/stderr to a file
dt=$(date '+%Y%m%d-%H');
_date=$(date '+%Y%m%d');
exec &> /log/log/${dt}.log
```

## grep multiple servers

```bash
#!/bin/bash

CMD=$1
KEYWORD=$2
FILENAME=$3
SERVER_LIST=(service1 service2 service3 service4 service5 service6 service7 service8 service9)

for server in "${SERVER_LIST[@]}"; do
    ssh $server "${CMD} ${KEYWORD} ${FILENAME}"
done
```


