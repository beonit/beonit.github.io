---
layout: default
title: rsync
parent: Tools
date: 2020-04-27
---

## rsync backup

- [backup and with rename](https://unix.stackexchange.com/a/527037)

```bash
rsync -Iu --backup --suffix=-${_date} --backup-dir=/log/err/idc/ idc:/log/service/statistic/err.log /log/pmt-prd/statistic/idc
```
