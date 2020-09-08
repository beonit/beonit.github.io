---
layout: default
title: Tcp/Ip
parent: Network
date: 2020-05-14
---

## TCP - 4 WAY HANDSHAKE

TIME_WAIT, CLOSE_WAIT

![https://t1.daumcdn.net/cfile/tistory/2766F146591FACE91D](https://t1.daumcdn.net/cfile/tistory/2766F146591FACE91D)

TIME_WAIT 이유 ([http://docs.likejazz.com/time-wait/#fn:fn-2](http://docs.likejazz.com/time-wait/#fn:fn-2))

1. 즉시 연결을 종료하고 바로 다음 연결을 맺였을 때, 첫번째 연결했을때의 데이터 패킷이 뒤늦게 도착하여 Sequence ID가 꼬이는 것을 방지
2. 마지막 ACK 패킷이 손실 되어 Active Close 혼자 연결을 Disconnect 해버리는 경우

## 3 WAY HAND SHAKE

![https://www.mdpi.com/applsci/applsci-06-00358/article_deploy/html/images/applsci-06-00358-g001.png](https://www.mdpi.com/applsci/applsci-06-00358/article_deploy/html/images/applsci-06-00358-g001.png)

## 참고

- 2017/5/20. Luyin. TCP 통신 TIME_WAIT, CLOSE_WAIT의 차이점. [https://luyin.tistory.com/424](https://luyin.tistory.com/424)
- 2014/2/5. Mind Net. TCP 3 Way-Handshake & 4 Way-Handshake. [https://mindnet.tistory.com/entry/네트워크-쉽게-이해하기-22편-TCP-3-WayHandshake-4-WayHandshake](https://mindnet.tistory.com/entry/%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EC%89%BD%EA%B2%8C-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0-22%ED%8E%B8-TCP-3-WayHandshake-4-WayHandshake)

## TCP 와 UDP 차이

### UDP

- 비연결형 서비스로 데이터그램 방식을 제공.
- 정보를 주고 받을 때 정보를 보내거나 받는다는 신호절차를 거치지 않음.
- UDP 헤더의 CheckSum 필드를 통해 최소한의 오류만 검출.
- 신뢰성 낮음.
- TCP 보다 속도가 빠름.
- 특징) 파일 전송과 같은 신뢰성이 필요한 서비스보다 성능이 중요시 되는 경우 사용되어 실시간 스트리밍 서비스에 자주 사용됨.

### TCP

- 연결형 서비스.
- 3-way-handshaking 과정 통해 연결을 설정하고 4-way handshaking 을 통해 해제.
- 흐름 제어 및 혼잡 제어.
- 높은 신뢰성을 보장.
- UDP 보다 속도가 느리다.
- 특징) 연결성을 보장하기 때문에 신뢰성있는 전송이 중요할 때 사용함. 서버와 클라이언트는 1대1로 연결되며 패킷에 대한 응답을 해야하기 때문에 성능이 낮음.
