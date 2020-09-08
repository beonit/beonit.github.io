---
layout: default
title: Spring
parent: Development
date: 2020-05-27
---

## Spring event listener

```java
@Component
public class MyListener {
  
    @EventListener
    public void handleContextRefresh(ContextRefreshedEvent event) {
        ...
    }
}
```

## Properties

- [application properties reference](https://docs.spring.io/spring-boot/docs/current/reference/html/appendix-application-properties.html)
- [`@ConfigurationProperties` 사용법](https://www.baeldung.com/configuration-properties-in-spring-boot)
  - `@ConfigurationProperties`
  - `@EnableConfigurationProperties(ConfigProperties.class)`
  - `@ConfigurationPropertiesScan("com.baeldung.properties")`
- Spring test 에서 property source 로드 하기 
