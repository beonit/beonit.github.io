---
layout: default
title: Git
parent: Tools
date: 2020-02-27
---

## 참조

- [Git book](https://git-scm.com/book/ko/v2)
- [Git rebase](http://dogfeet.github.io/articles/2012/git-merge-rebase.html)

## Git useful command

- 이미 추가된 파일을 local 엔 남기고 저장소에서만 삭제하고 싶을 때 : `git rm -r --cached bin/`
- 수정된 파일 리스트만 표시 : `git show --pretty="" --name-only 30e15fd5`

### Branch

- `git checkout -b fetch_head origin/master` : fetch 이후에 origin 을 미리 보고자할 때
- `git pull --rebase origin/master` : git forward porting
- `git branch`, `git branch -r`, `git branch -a`
- `git checkout -b branchName` : git branch branchName + git checkout branchName
- `git push origin localBranchName`
- `git merge {{brnachName}} --no-commit --no-ff`
- `git merge {{branchName}} --squash` : 여러 커밋을 하나로 만들어서 브랜치에 commit(merge 가 아님) 하게 한다.
- `git checkout -b <new_branch_name> <SHA1>`
- `git branch -f master SHA-1` : 브랜치를 특정 commit 으로 강제로 옮긴다
- `git branch -rd origin/17W33` : 로컬에서 트랙킹 중인 리모트 브랜치 정보를 지운다. (리모트에서 브랜치가 지워진건 아니다)

### Delete Mereged branches

- `git branch --merged | egrep -v "(^\*|release|develop)" | xargs git branch -d` : merge 된 브랜치 삭제
- `git remote prune origin` : remote 에서 삭제된 브랜치 삭제

## 좋은 git 커밋 메시지를 작성하기 위한 8가지 약속

- **본문은 어떻게보다 무엇을, 왜에 맞춰 작성하기**
- 제목과 본문을 한 줄 띄워 분리하기
- 제목은 영문 기준 50자 이내로
- 제목 첫글자를 대문자로
- 제목 끝에 . 금지
- 제목은 명령조로 (영어)
- Github - 제목(이나 본문)에 이슈 번호 붙이기
- 본문은 영문 기준 72자마다 줄 바꾸기
