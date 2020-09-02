---
layout: default
title: Shellscript
parent: Development
date: 2020-05-19
last_modified_date: 2020-06-09T11:05:42 KST
---

## Grammars

### Function

[13. Functions, Shell Scripting Tutorial](https://www.shellscript.sh/functions.html)

```
rename()
{
  # expects to be called as: rename .txt .bak 
  FROM=$1
  TO=$2

  for i in *$FROM
  do
    j=`basename $i $FROM`
    mv $i ${j}$TO
  done
}
```

### Test

[8.Test, Shell Shellscript Tutorial](https://www.shellscript.sh/test.html)

### Loop

[7.Loop, Shell Scripting Tutorial](https://www.shellscript.sh/loops.html)

```bash
SERVER_LIST=(server1 server2 server3 server4)
for server in "${SERVER_LIST[@]}"; do ssh $server grep "text" /log/tomcat/access.log; done;
```

## Tip

- [How to manually expand a special variable (ex: ~ tilde) in bash](https://stackoverflow.com/a/27485157/4888040)
  - `var="${var/#\~/$HOME}"`

## 활용

### File exists

### Args size check

### Run log 만들기

```bash
#!/bin/bash
# redirect stdout/stderr to a file
dt=$(date '+%Y%m%d-%H');
_date=$(date '+%Y%m%d');
exec &> /log/log/${dt}.log
```

### grep multiple servers

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


