---
layout: default
title: Java - Singleton
parent: Development
date: 2020-03-11
last_modified_date: 2020-06-05T13:58:07 KST
---

## 결론

- Eager initialize 이 필요하면 static instance 초기화
- Lazy initialize 가 필요하면 enum singleton

## Eager initialize

private static final 로 선언하고 static method 로 가져온다.

클래스로더로 초기화 되므로 thread safe 하다. 메모리에 상주한다.

static field 는 클래스 로더 시점에 초기화 됨 → lazy 생성자 필요

```java
public class EagerInitialization { 
    //private static으로 선언
    private static EagerInitialization instance = new EagerInitialization();
    //생성자
    private EagerInitialization() {}
    //인스턴스 리턴
    public static EagerInitialization getInstance() {
        return instance;
    }
}
```

## Thread safe Lazy initialization + Double-checked locking

```java
public class ThreadSafeLazyInitialization {
    private static ThreadSafeLazyInitialization instance;
    private ThreadSafeLazyInitialization(){}
    public static ThreadSafeLazyInitialization getInstance(){
        //Double-checked locking
        if(instance == null){
            synchronized (ThreadSafeLazyInitialization.class) {
                if(instance == null)
                    instance = new ThreadSafeLazyInitialization();
            }
        }
        return instance;
    }
}
```

## Initialization on demand holder idiom

```java
public class InitializationOnDemandHolderIdiom {
    private InitializationOnDemandHolderIdiom(){}
    private static class SingleTonHolder{
        private static final InitializationOnDemandHolderIdiom instance = new InitializationOnDemandHolderIdiom();
    }
    public static InitializationOnDemandHolderIdiom getInstance(){
        return SingleTonHolder.instance;
    }
}
```

## Enum

serialize/deserialize 시에는 필드가 초기화 되지 않는다 → readResolve 로 해결

lazy loading 이 되나 → Yes, primitive type 만 compile time 에 초기화 된다. 따라서 enum 의 field 는 처음 접근 될 때 초기화 된다.

```java
public enum SingletonEnum {
    INSTANCE;
    int value;
    public int getValue() {
        return value;
    }
    public void setValue(int value) {
        this.value = value;
    }
}
```

## 참고

- Limky Lim-Ky. 2017/7/27. [Design_Pattern] Singleton(싱글톤)의 고도화. Limky 삽질블로그. [https://limkydev.tistory.com/67](https://limkydev.tistory.com/67)
- 2017/7/21. Java Singletons Using Enum. DZone. [https://dzone.com/articles/java-singletons-using-enum](https://dzone.com/articles/java-singletons-using-enum)
- 2014/6/17. Singleton via enum way is lazy initialized?.  StackOverflow. [https://stackoverflow.com/posts/16771449/revisions](https://stackoverflow.com/a/16771449)