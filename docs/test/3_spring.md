---
layout: default
title: Spring
parent: Test
date: 2020-05-18
nav_order: 3
---

## 참고 자료

[Spring Boot에서 테스트를 - 1](https://hyper-cube.io/2017/08/06/spring-boot-test-1/)

## Spring test setting

특정 설정/클래스만 로드하여 테스트 하기

    @SpringBootTest(classes = {ArticleServiceImpl.class, CommonConfig.class})

[baeldung - spring test property source](https://www.baeldung.com/spring-test-property-source)

    @TestPropertySource(locations = "/other-location.properties", properties = "baeldung.testpropertysource.one=other-property-value")
    @SpringBootTest(properties = "classpath:application-test.yml")


`@IfProfileValue` 특정 active profile 에서만 테스트 동작 시키기  

    @IfProfileValue(name="java.vendor", value="Oracle Corporation")
    @IfProfileValue(name = "spring.profiles.active", value = "partner_feign")
    @IfProfileValue(name = "test-groups", values = { "unit-tests", "integration-tests" })

`@TestConfiguration` - `@SpringBootTest` 의 classes 으로 Configuration class 를 명시한 경우 @TestConfiguration 도 호출되지 않는다.

```java
@TestConfiguration
public static class TestConfig {
    @Bean
    public ICryptoService cryptoService() {
        return new FileCryptoService();
    }
}
```

- [Web Environment test](https://docs.spring.io/spring-boot/docs/2.1.6.RELEASE/reference/html/boot-features-testing.html#boot-features-testing-spring-boot-applications)
  - `MOCK`, `RANDOM_PORT`, `DEFINED_PORT`, `NONE`
  - `@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)`

### Slice test

Spring 에서 기본적으로 로드하는 빈이 아주 많다. 기본 빈, 테스트 목적에 맞는 사용자 빈만 로드하도록 한다.

    @WebMvcTest
    @DataJpaTest
    @JdbcTest
    @DataMongoTest
    @JsonTest
    @RestClientTest


## Mock

- `@MockBean`
- `@SpyBean`
- `@MockBean` 을 선언하면 일반 Bean 을 대체합니다.

```
@MockBean
private RestTemplate restTemplate;

@MockBean
private ArticleDao articleDao;
```

## Intellij TIP

- [Intellij set active profile](https://stackoverflow.com/a/53212556) : `VM Options` - `-Dspring.profiles.active=local,test` 

