---
layout: default
title: Concept
parent: Testing
date: 2020-05-18
nav_order: 1
---

## Test

- Functional test
- Integration test
- Unit test
  
## BDD Test 구조

- given, when, then, where
- expect 도 있던데 이건 어떻게 하는거지?

## Test frameworks

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

## Utilities

### Test data generator

- Generate mocking data
  - [mockneat](https://github.com/nomemory/mockneat)
  - [Faker](https://github.com/DiUS/java-faker)
- Generate random data pojo : [PoDaM](http://mtedone.github.io/podam/)


### Test code coverage

- Jacoco : test coverage report tool, jacocoTestReportDebug
  - maven, gradle plugin
- [codecov](https://codecov.io/)
- [coveralls](https://coveralls.io/)

### CI Tool

- Github actions
- Circle CI
- Jenkins
- CloudBuild (AWS, GCP, Azure)