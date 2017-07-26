## Servlet + MVC1 + Oracle DB 기반 게시판 ##
본 샘플은  Servlet + MVC1 + Oracle DB 기반으로 방명록,게시판,파일업로드를 구현한 샘플입니다.

각 내용은 다음과 같이 구성되었습니다.

### 1. boardone ###
- List: 모든 게시물 출력
- Form: 사용자 입력 내용 저장
- Update: 사용자 입력 내용 수정
- Read:   사용자 입력 내용 보기
- Delete: 지정된 게시물 삭제

URL: http://localhost:8080/myweb/board1List

### 2. fileupload ###

URL: http://localhost:8080/myweb/board2List

### 3. memberone ###
- List: 검색, 제목을 한 줄로 표시 ==> 페이징을 공통으로 
- Form: 필수입력, 수정/저장 서비스 하나로
- Read: 스크립트 실행 방지

### 개발 환경 ### 
    Programming Language - Java 1.7
    IDE - Eclipse
    DB - OracleDB 
    Framework - Servlet
    
### 설치 ###

먼저 다음과 같은 테이블을 생성해야 한다.
 
 //회원테이블 스키마
CREATE table "STUDENT" (
	"ID" VARCHAR2(12) NOT NULL,
	"PASS" VARCHAR2(12) NOT NULL,
	"NAME" VARCHAR2(12) NOT NULL,
	"PHONE1" VARCHAR2(20) NOT NULL,
	"PHONE2" VARCHAR2(20) NOT NULL,
	"PHONE3" VARCHAR2(20) NOT NULL,
	"EMAIL" VARCHAR2(20) NOT NULL,
	"ZIPCODE" VARCHAR2(20) NOT NULL,
	"ADDRESS1" VARCHAR2(20) NOT NULL,
	"ADDRESS2" VARCHAR2(20) NOT NULL,
	constraint "STUDENT_PK" primary key("ID")
);


//우편번호 테이블
create table "ZIPCODE"(
    "SEQ" NUMBER(5,0) NOT NULL,
    "ZIPCODE" VARCHAR2(20) NOT NULL,
    "SIDO" VARCHAR2(10) NOT NULL,
    "GUGUN" VARCHAR2(30) NOT NULL,
    "DORO" VARCHAR2(50),
    "BDNO" VARCHAR2(50),
    "BDNAME" VARCHAR2(50),
    "DONG" VARCHAR2(50) NOT NULL,
    "BUNJI1" VARCHAR2(20),
    constraint "ZIPCODE_PK" primary key("SEQ")
);


//게시판 테이블
CREATE TABLE "BOARD"(
	"NUM" NUMBER(7,0) NOT NULL ENABLE,
	"WRITER" VARCHAR(12) NOT NULL ENABLE,
	"EMAIL" VARCHAR(30) NOT NULL ENABLE,
	"SUBJECT" VARCHAR(50) NOT NULL ENABLE,
	"PASS" VARCHAR(10) NOT NULL ENABLE,
	"READCOUNT" NUMBER(5,0) DEFAULT 0 NOT NULL ENABLE,
	"REF" NUMBER(5,0) DEFAULT 0 NOT NULL ENABLE,
	"STEP" NUMBER(5,0) DEFAULT 0 NOT NULL ENABLE,
	"DEPTH" NUMBER(3,0) DEFAULT 0 NOT NULL ENABLE,
	"REGDATE" TIMESTAMP(6) DEFAULT SYSDATE NOT NULL ENABLE,
	"CONTENT" VARCHAR(4000) NOT NULL ENABLE,
	"IP" VARCHAR(20) NOT NULL ENABLE,
	constraint "BOARD_PK" primary key("NUM") ENABLE
);


//게시판 시퀀스
CREATE SEQUENCE board_seq
	START WITH 1
	INCREMENT BY 1
	NOMAXVALUE
	NOCACHE
	NOCYCLE;




\src\boardone 폴더에 있는 connutil.java에서 적절한 DB 접속 정보를 입력하고 실행하면 된다.

