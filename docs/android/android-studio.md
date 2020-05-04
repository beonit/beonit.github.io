---
layout: default
title: Android studio
parent: Android
date: 2020-04-28
---

## Mac 설정

- 단축키 C-S-a 를 누르면 프로세스 종료됨이 뜨는 경우 : 맥 기본 숏컷과 충돌임. "환경 설정 - 키보드 - 단축키 - 서비스 - 터미널에서 man 페이지 인덱스 검색" 을 해제 한다.

## Kotlin java code

- "Tools - kotlin - Show kotlin bytecode - Decompile"

## Java 9+ SDK

- Intellij 는 openjdk lts 을 사용하여 9+ 버전을 사용한다. 따라서 `javax.xml.bind` class not found 문제가 발생한다. JDK 1.8 을 설치하고 Android SDK 의 JavaSDK 버전을 1.8 로 설정하자. `Project setting - Platform settings - SDKs - Android API N platfrom - JAVA SDK:`
  - [Got-Unable-to-load-class-javax-xml-bind-JAXBException](https://intellij-support.jetbrains.com/hc/en-us/community/posts/360006656359-Got-Unable-to-load-class-javax-xml-bind-JAXBException-when-run-an-Android-App?page=1#community_comment_360001561639)
- 