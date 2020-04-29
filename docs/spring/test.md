---
layout: default
title: Test
parent: Spring
date: 2020-04-21
---


## Test

- Functional test
- Integration test
- Unit test

## Testint frameworks

- Junit
- Test NG
- Spock (BDD, Includes own Mocking framework)
- Cucumber (BDD, Java, JS, Ruby)
- Mockito
- Spring MVC
- REST Assured (BDD, DSL)
- Selenium (Web browser automation)
- GEB (Groovy browser automation)
- Test container

## Spring boot test

- [Spring Boot에서 테스트를 - 1](https://hyper-cube.io/2017/08/06/spring-boot-test-1/)

### @SpringBootTest

```
@SpringBootTest(classes = {ArticleServiceImpl.class, CommonConfig.class})
@SpringBootTest(properties = "classpath:application-test.yml")
```

### MockBean, SpyBean

- @MockBean을 선언하면 Mock 객체를 빈으로써 등록을 하지만, 만일 @MockBean으로 선언한 객체와 같은 이름과 타입으로 이미 빈으로 등록되어있다면 해당 빈은 선언한 Mock 빈으로 대체됩니다.

```
@MockBean
private RestTemplate restTemplate;
@MockBean
private ArticleDao articleDao;
```

### Web Environment test

- `MOCK`, `RANDOM_PORT`, `DEFINED_PORT`, `NONE`

### @TestConfiguration

- @SpringBootTest의 classes 속성을 이용하여 특정 클래스만을 지정했을 경우에는 TestConfiguation은 감지되지 않습니다. 

```java
@TestConfiguration
public static class TestConfig {
    @Bean
    public ICryptoService cryptoService() {
        return new FileCryptoService();
    }
}
```

### Test properties

[baeldung.com/spring test property source](https://www.baeldung.com/spring-test-property-source)

```
@TestPropertySource(locations = "/other-location.properties", properties = "baeldung.testpropertysource.one=other-property-value")
```


### @IfProfileValue

`@IfProfileValue(name="java.vendor", value="Oracle Corporation")`

## Intellij set active profile

- [How to set active profile](https://stackoverflow.com/a/53212556)
