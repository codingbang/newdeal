# NodeJs

## NodeJs 는?
  - Node.js 는 Chome V8 JavaScript 엔진으로 빌드된 JavaScript 런터임입니다(실행엔진)
  - Node.js 는 이벤트 기반 , 논 블로킹 I/O 모델을 사용해  가볍고 효율 적입니다
  - Node.js 의 패키지 생태계인 npm은 세계에서 가장 큰 오픈 소스 라이브리이기도 합니다
    - https://nodejs.org/ko/

### 01. NodeJsS의 특징
  - 1. Node.js 는 Chome V8 JavaScript 엔진으로 빌드된 runtime
  - 2. 싱글 쓰레드 
  - 3. 비동기 I/O 
      - 하드 디스크 접근
      - 데이터베이스 서버
      - 네트워크 이용한 다른 서비스 접근 
      - 비동기 I/O를 사용한다.
      - 단점
        - 운영 및 장애 디버깅에 대응하는 면에서는 기존의 서버 사이드 언어에 비해 많이 존재
        - 하나뿐인 스레드가 에러로 인해 멈추지 않도록 잘 관리( 에러발생 시 서버전체가 멈출 수 있음 )
        - CPU부하가 큰 작업에는 적합하지 않다 (코드가 CPU연산을 많이 요구하면 블로킹이 발생 스레드 하나가 처리)
  - 4. 이벤트 기반(event driven) 
  - 5. 간단한 구조의 경량 프레임워크와 풍부한 라이브러리를 가지고 있다
  - 6. 서버와 클라이언트 에서 사용하는 언어가 같다

### 02. Node.js 사용분야
  - 실시간 소셜 네트워크 서비스
  - 데이터 중심의 처리 (비동기 I/O)
  - IOT 기반의 기기 제어

### 03. NodeJs Module
  - 1. 기본 모듈 
    - https://nodejs.org/dist/latest-v10.x/docs/api/process.html 문서 에서 확인
    - 프로세스 환경
      - os, process
    - 파일과 경로 , URL
      - fs, path, URL, querystring, stream
    - 네트워크 모듈
      - http, net, dns 

  - 2. 전역객체(global)
    - (Java 에서 Console 클래스 사용하는 것처럼 ....)
    - 별도의 모듈 로딩 없이 사용가능
    - global.console.log()  >>  console.log()   >> global 생략가능
 
  - 3. 전역객체 
    - process
    - console
    - Buffer
    - require
    - __filename, __dirname
    - module
    - exports
    - Timeout 함수 등
