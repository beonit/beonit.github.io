---
layout: default
title: vscode
parent: Tools
date: 2020-02-15
---

# Visual Studio Code

## vscode

- Ubuntu 에서 실행시 pac 설정 방법
  1. `/usr/share/applications/code.desktop` 의 실행 명령어 수정 필요.
  2. `Exec=/usr/share/code/code --unity-launch --proxy-pac-url=http://swp.sec.samsung.net:8088/samsungcs.pac --ignore-certificate-errors %F`
- F1 이 JetBrain 의 Shift+Shift 의 역할을 한다.
- 디렉토리를 워크 스페이스로 만들어서 사용한다. `{workspaceName}.code-workspace` 와 `.vscode` 디렉토리에 local 설정 파일을 생성한다.

## Python

- Python 코딩하기 좋다.
- 추천 설정이 되어 있지 않으면 감지해서 플러그인을 설치 하도록 유도한다.
- PIP, PEP8, LINT 등을 설치 유도한다.
- 자동완성, 메소드 탐색, 변수의 타입을 추적해서 툴팁으로 보여줌
- 디버거 자동 연결

## Shortcuts

[Helpful shortcuts for VSCode
 ,GIST](https://gist.github.com/bradtraversy/b28a0a361880141af928ada800a671d9)

- F2 키로 변수 rename
- Reformat code
  - On Mac : `Shift + Option + F`
  - On Ubuntu : `Ctrl + Shift + I`
- Terminal
  - To Focus on Integrated Terminal : ```ctrl+` ```
  - To Focus on Editor : `ctrl+1~9`
  - Show/Hide bottom pannel : `ctrl-j`
- Debug
  - Break point : `f9`
  - Start debug : `f5`
  - Stop debug : `shift f5`
  - Next over : `f10`
  - Step into : `f11`
- Search & Navigation
  - Next occurrence : `F4`
  - Go to file : `Cmd+p`
  - Go to project explorer : `Cmd+0`
