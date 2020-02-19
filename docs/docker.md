---
layout: default
title: Docker and kubernetes the complete guide
---


# Docker and Kubernetes: The Complete Guide

[udemy - Docker and Kubernetes: The Complete Guide](https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/)  
Build, test, and deploy Docker applications with Kubernetes while learning production-style development workflows

## Docker Compose with multiple local container

### 52. Docker compose files

- docker build 와 run 을 함께 포함한다.
- docker-compose.yml 좀 복잡하기도 하다.
- 구성 : 만들 docker image 내용, 포트 맵핑 내용

```docker
version: '3'
services:
  redis-server:
    image: 'redis'
  node-app:
    build: .
    ports:
      - "8081:8081"
```

### 53. Networking with docker compose

- compose 로 만들어진 컨테이너 끼리는 연결하기 위한 특별한 절차가 필요 없다.
- 다른 서비스로 접속할 때에는 이름으로 다른 서비스를 찾으면 된다.
  - domain name 이나 ip 를 알 필요 없다.
  - 서비스 디스커버리 패턴

### 54. Docker compose command

- docker run image → docker-compose up
- docker build, run → docker-compose up --build

### 55. Stopping docker compose containers

- docker run -d imageNmae → docker compose -d up : detached 상태로 docker, compose 실행
- docker stop name → docker-compose down : stop 과 remove 를 한다.

### 56. Container Maintenance with compose

- 컨테이너 하나가 잘못되었을 경우 어떻게 할 것인가? : 에러 시연을 위해서 node app 에서 process.exit('0') 을 넣었다.
- 하나만 실행 되더라.

### 57. Automatic Container restarts

- Restart policies : "no", always, on-failure, unless-stopped
- on-failure 는 실패했을 경우에만 재 실행 한다. (참고 : exit codes : 0 은 정상이고 나머지는 잘못됨을 표시한다.)

    version: '3'
    services:
      redis-server:
        image: 'redis'
      node-app:
        restart: always
        build: .
        ports:
          - "8081:8081"

### 58. Container status with docker compose

docker ps → docker-compose ps : docker-compose.yml 가 있는 디렉토리에서 실행 해야 한다.

## 6 Creating a Production-Grade Workflow

### 59.Development workflow

- 개발하고 디플로이 하는 과정을 보여주고자 한다.
- Dev - test - deploy 가 반복되어야 한다.

### 60.feature branch, master 브랜치가 있다. 피쳐 브랜치에서 개발을 하고 Feature 브랜치를 Remote 로 push 한다.

- feature branch 는 테스트된 다음, Pull request 로 master branch 에 들어간다.
- feature 가 master 브랜치에 들어가면 Travis CI 에서 테스트 된다.
- Travis CI 에서 테스트가 모두 성공하면 AWS Hosting 에 배포된다.

### 61. Docker's purpose

- 독커는 개발 플로우의 툴 이다. 독커는 이 과정의 일을 굉장히 편하게 만들어 준다.

### 62. Project generation

- 간단한 프로젝트를 생성기를 통해서 만들겠다. JavaScript 나 Ruby 에 대한 지식은 필요 없다. 독커가 어떻게 이용되는지 보는게 중요하다.
- Node.js 를 깔았따

### 63. More on Project generation

- NPM 으로 react 프로젝트 생성

### 64. Necessary commands

- npm run start : 서버 실행, 개발 서버에서만 사용
- npm run test : 프로젝트 테스트 실행
- npm run build : 프로덕션 어플리케이션 빌드. 한개 파일로 만들어준다.

### 65. Creating the dev dockerfile

- npm 프로젝트 폴더에 dockerfile.dev 을 생성한다.

```docker
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "start"]
```

- 만든 파일을 빌드하고 실행한다. docker build -f dockerfile.dev .

### 66. Duplicating Dependencies

- 개발 시점에 npm run start 나 npm run build 를 하면 node_modules 와 build directory 가 생성된다. 따라서 이 파일을 제거해야 한다.
- 제거하고 다시 컨테이너를 빌드한다.

### 67. Starting the container

- docker run 'imageName' 하면 접속할 수 없다.
- 포트 맵핑을 해야 한다. docker run -p 8080:3000 'imageName'
- 이미 봤겠지만, 소스코드를 변경하면 독커 이미지를 다시 빌드하고 다시 실행해야 한다.

### 69. Docker volumes

- 볼륨은 디렉토리를 로컬 머신의 어떤 디렉토리를 가르키는 레퍼런스를 만든다. 로컬 폴더로 맵핑한다.

```docker run -f dockerfile.dev -p 8080:3000 -v ${pwd}/src:/app <image_id>```

- volume 을 사용할 때는 hostMachine:docker container 양식이 기본이다.
- 개발중에 발생한 수정 사항이 컨테이너를 다시 빌드 하지 않고 반영된다.

### 70. Bookmarking volumes

- volume mount 로 이미지에 있던 디렉토리가 사라지는 경우가 있다.
  - volume : 을 사용하지 않으면 맵핑하지 않고 그대로 사용한다고 선언하는 것 이다.
- ```docker run -f dockerfile.dev -p 8080:3000 -v /app/node_modules -v ${pwd}/src:/app <image_id>```

### 71. Shorthand with docker compose

- 매번 커맨드를 적절하게 입력하기 어려울 수 있다. Compose 로 쉽게 하자.
- 작성해야 할 내용은 port mapping, voulme 이 잇다.

```docker
docker-compose.yml 을 만든다.
version: '3'
services:
    web:
    build: .
    ports:
        - "3000:3000"
    volumes:
        - /app/node_modules
        - .:/app
```

- docker-compose up 하면 dockerfile 을 찾을 수 없다고 나온다. 우리는 Dockerfile.dev 를 사용하고 있었기 때문이다.

### 72. Override dockerfile selection

```docker
version: '3'
services:
    web:
    build:
        context: .
        dockerfiler: dockerfile.dev
    ports:
        - "3000:3000"
    volumes:
        - /app/node_modules
        - .:/app
```

### 73. Do We Need Copy?

- volume mount 를 하는데 docker image 에서 copy 를 할 필요가 있을까?
- 하지만 나중에 docker compose 를 사용하지 않거나, 그대로 복사하여 프로덕션 이미지를 만들때 필요할 수 있으니 COPY 는 남겨둔다.

### 74. Executing test

- 이제 테스트를 진행 하고자 한다.
- 빌드 : docker build -f dockerfile.dev .
- 테스트 : docker run -it {img id} npm test run
- run 뒤에 커맨드를 넣어주면 CMD 로 설정된 커맨드를 무시하고 다른 커맨드를 실행한다.

### 75. Live updating tests

- 코드를 업데이트 해도 컨테이너가 업데이트 되지 않으므로 테스트가 계속 업데이트 되지 않는다.
- docker compose 로 볼륨을 마운트한 이미지에 붙어서 처리하는 방법이 있다.
- 실행 커맨드 : docker exec -it {containerId} npm run test
- 컨테이너에 직접 실행하는건 개발 단계에서 하는 방법 이다.

### 76. Docker compose for running tests

- 테스트 실행을 위한 서비스를 생성한다. docker-compose run --build 하지만 쉘에 붙지 않기 때문에 입력을 전달할 방법이 없다.

```docker
version: '3'
services:
    web:
    build:
        context: .
        dockerfiler: dockerfile.dev
    ports:
        - "3000:3000"
    volumes:
        - /app/node_modules
        - .:/app
    tests:
    build:
        context: .
        dockerfiler: dockerfile.dev
    volumes:
        - /app/node_modules
        - .:/app
    command: ["npm", "run", "test"]
```

### 77. Shortcomings on testing

- test container 가 stdin 이 attach 되지 않아 입력이 전달되지 않고 있다.
- 두번째 커맨드로 docker attach 로 특정 컨테이너에 붙어서 상호작용하자
- docker attach {docker-container-id} 커맨드로 붙어보면 잘 붙지않는다.
  - attach 는 primary process 로 붙는다.
  - 하지만 실제 테스트 진행은 start.js 에서 진행된다. 따라서 붙을 방법이 없다.
- 위 두 방법은 각각 장단점이 있다. 최선의 방법은 없다. 본인의 취향에 맞춰 처리 하도록 하자.

### 78. Need for Nginx

- 개발 단계에서는 Dev server 가 파일을 서빙하는데. Production 에서는 Dev server 가 존재하지 않다.
- Production env 에서는 production server 가 존재한다. → nginx

### 79. Multi-step docker builds

- 두번째 Docker 파일을 만들거다.

```docker
node:alpine
copy package.json
copy dependencies
pnm run build
start nginx
```

- 그런데, 프로덕션에서 모든 빌드 관련된 파일이 필요한건 아니다. 실행에는 매우 작은 파일만 필요하다
- nginx 는 따로 구해야 한다. 베이스 이미지가 두갠데?
- Build phase : node:alphine 베이스로 빌드(npm run build)를 하고 static 파일을 만든다.
- Run phase : nginx:alpine 을 사용한다. build phase 에서 만든 파일들을 복사해서 nginx 를 실행한다. (필요 없는 파일은 떨어져 나간다)

### 80. Implimenting multi-step build

Dockerfile 을 만들자.

```docker
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUn npm install
COPY . .
RUN npm run build
```

- /app/build 디렉토리에 파일이 만들어질 것이다.

```docker
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
```

- CMD 카맨드는 필요 없다. base image 에서 미리 준비된 커맨드가 있기 때문이다.

### 81. Running nginx

```docker
docker build .
docker run -p 8080:80 imgId
```

## 7 Continuous Integration and deployment with AWS

### 82. Services Overview

- Github (Free) Travis CI (Free) AWS (Free, but credit card required)

### 83. Github Setup

### 84. Travis CI Setup 1

- Github 에 무언가 Push 되면 Travis 가 반응하여 내용을 pull 하여 무언가 작업을 한다. Build 하고 test 에 문제 없으면 AWS Deploy 한다.

### 84. Travis CI Setup 2

- Github 에 무언가 Push 되면 Travis 가 반응하여 내용을 pull 하여 무언가 작업을 한다. Build 하고 test 에 문제 없으면 AWS Deploy 한다.

### 85. Traivs YML File configuration

- Travis CI 는 테스트 하고, 테스트가 통과 했다면 AWS 에 배포할 수 있다.
- 작업 절차
  - tell travis we need a copy of docker running
  - Bild our image using dockerfile.dev
  - Tell travis hou to run our test suite
  - Tell travis how to to deploy our code to AWS
.traivs.yml 파일을 만든다. (이코스는 닥커 코스라서 Travis 에 대해서는 간단한 설명만 한다.

```travis
sudo: required
services:
  - docker

before_install:
  - docker build -t TEST_IMG -f dockerfile.dev .
```

### 87. A Touch more travis setup

- 테스트 수행 스크립트를 추가한다. (그런데 잘 동작하지 않는 다고 한다. 뭔가 수정이 필요 하단다.)

```docker
sudo: required
services:
    - docker

before_install:
    - docker build -t TEST_IMG -f dockerfile.dev .

script:
    - docker run TEST_IMG npm run test -- --converage
```

### 88. Automatic build creation

- .travis.yml 파일을 푸시 하니까 travis ci 에서 빌드와 테스트가 동작한다.
- travis CI 에서 빌드가 성공한 이력이 생겼다.
- 이제 우리는 푸시하면 빌드하고 테스트하는 파이프라인을 하나 가지게 되었다.

### 89. AWS elastic beantalk

- 우리는 이제 IaaS 에 배포할 준비가 되었다.
- 독커를 실행하려면 elastic beantalk 이 가장 편한 방법이다.
- Create new application - create environment - web server environment - Base configuration (docker)
- docker env 가 설정되고 어플리케이션이 생성되었다. (default application 이 실행된다)

### 90. More on Elastic beanstalk

- Load balancer 와 VM docker container 가 다 구비 되어 있다.
- 트래픽이 일정 수준 이상 오르면 자동으로 스케일링을 해준다.

### 91. Travis config for deployment

- 배포하자.

```travis
sudo: required
services:
    - docker

before_install:
    - docker build -t TEST_IMG -f dockerfile.dev .

script:
    - docker run TEST_IMG npm run test -- --converage

deploy:
    provider: elasticbeansttalk
    region: "us-west-2"
    app: "{{APP_NAME}}"
    env: "Docker-env"
    bucket_name: "{{S3 bucket name}}" # S3 storage 는 elastic beans talk 를 생성하면 자동으로 생성된다.
    bucket_path: "{{APP_NAME}}"
    on:
    branch: master
```
