---
layout: default
title: Non-blocking
parent: Development
date: 2020-09-02
---


## Java IO

[How Java I/O Works Internally at Lower Level?](https://howtodoinjava.com/java/io/how-java-io-works-internally-at-lower-level/)

## Java blocking IO

[Java NIO - 1. 왜 자바의 IO 패키지는 느린가?](https://leeyh0216.github.io/2020-05-10/java_nio_why_java_io_slow)

read() 함수 호출 → 커널 모드 스위칭 → 커널 캐시 확인 → DMA 에 요청 → DMA 가 DiskController 에 요청 → DMA에 저장된 데이터를 다시 커널의 버퍼 메모리 영역에 복사 → DMA 가 CPU 인터럽트 수행 → 커널 메모리를 유저에 복사

Virtual Memory, Multiply mapped memory space 로 kernel, user 간 메모리 복사 최소화
