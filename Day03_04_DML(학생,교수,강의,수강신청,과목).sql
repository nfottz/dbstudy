-- 테이블 삭제

DROP TABLE LECTURE_TBL;
DROP TABLE ENROLL_TBL;
DROP TABLE STUDENT_TBL;
DROP TABLE COURSE_TBL;
DROP TABLE PROFESSOR_TBL;

-- 1. PROFESSOR_TBL 테이블
CREATE TABLE PROFESSOR_TBL (
    P_NO    NUMBER            NOT NULL,  -- 기본키
    P_NAME  VARCHAR2(30 BYTE) NULL,
    P_MAJOR VARCHAR2(30 BYTE) NULL
);
-- 기본키
ALTER TABLE PROFESSOR_TBL
    ADD CONSTRAINT PK_PROFESSOR PRIMARY KEY(P_NO);


-- 2. COURSE_TBL 테이블
CREATE TABLE COURSE_TBL (
    C_NO   NUMBER            NOT NULL,  -- 기본키
    C_NAME VARCHAR2(30 BYTE) NULL,
    C_UNIT NUMBER(1)         NULL
);
-- 기본키
ALTER TABLE COURSE_TBL
    ADD CONSTRAINT PK_COURSE PRIMARY KEY(C_NO);


-- 3. STUDENT_TBL 테이블
CREATE TABLE STUDENT_TBL (
    S_NO       NUMBER             NOT NULL,  -- 기본키
    S_NAME     VARCHAR2(30 BYTE)  NULL,
    S_ADDRESS  VARCHAR2(100 BYTE) NULL,
    S_GRADE_NO NUMBER(1)          NULL,
    P_NO       NUMBER             NOT NULL  -- PROFESSOR_TBL 테이블의 P_NO칼럼을 참조하는 외래키
);
-- 기본키
ALTER TABLE STUDENT_TBL
    ADD CONSTRAINT PK_STUDENT PRIMARY KEY(S_NO);
-- 외래키
ALTER TABLE STUDENT_TBL
    ADD CONSTRAINT FK_STUDENT_PROFESSOR FOREIGN KEY(P_NO) 
        REFERENCES PROFESSOR_TBL(P_NO);


-- 4. ENROLL_TBL 테이블
CREATE TABLE ENROLL_TBL (
    E_NO   NUMBER NOT NULL,
    S_NO   NUMBER NOT NULL,  -- STUDENT 테이블의 S_NO 칼럼을 참조하는 외래키
    C_NO   NUMBER NOT NULL,  -- COURSE  테이블의 C_NO 칼럼을 참조하는 외래키
    E_DATE DATE   NULL
);
-- 기본키
ALTER TABLE ENROLL_TBL
    ADD CONSTRAINT PK_ENROLL PRIMARY KEY(E_NO);
-- 외래키
ALTER TABLE ENROLL_TBL
    ADD CONSTRAINT FK_ENROLL_STUDENT FOREIGN KEY(S_NO) 
        REFERENCES STUDENT_TBL(S_NO);
ALTER TABLE ENROLL_TBL
    ADD CONSTRAINT FK_ENROLL_COURSE FOREIGN KEY(C_NO) 
        REFERENCES COURSE_TBL(C_NO);


-- 5. LECTURE_TBL 테이블
CREATE TABLE LECTURE_TBL (
    L_NO       NUMBER            NOT NULL,  -- 기본키
    P_NO       NUMBER            NOT NULL,  -- PROFESSOR 테이블의 P_NO 칼럼을 참조하는 외래키
    E_NO       NUMBER            NOT NULL,  -- ENROLL 테이블의 E_NO 칼럼을 참조하는 외래키
    L_NAME     VARCHAR2(30 BYTE) NULL,
    L_LOCATION VARCHAR2(30 BYTE) NULL
);
-- 기본키
ALTER TABLE LECTURE_TBL
    ADD CONSTRAINT PK_LECTURE PRIMARY KEY(L_NO);
-- 외래키
ALTER TABLE LECTURE_TBL
    ADD CONSTRAINT FK_LECTURE_PROFESSOR FOREIGN KEY(P_NO) 
        REFERENCES PROFESSOR_TBL(P_NO);
ALTER TABLE LECTURE_TBL
    ADD CONSTRAINT FK_LECTURE_ENROLL FOREIGN KEY(E_NO) 
        REFERENCES ENROLL_TBL(E_NO);



-- 데이터 삽입

-- 1. PROFESSOR_TBL 테이블 데이터 입력
INSERT INTO PROFESSOR_TBL(P_NO, P_NAME, P_MAJOR) VALUES (1, '제임스', '전산');
INSERT INTO PROFESSOR_TBL(P_NO, P_NAME, P_MAJOR) VALUES (2, '앨리스', '회계');
INSERT INTO PROFESSOR_TBL(P_NO, P_NAME, P_MAJOR) VALUES (3, '스미스', '영화');

-- 2. COURSE_TBL 테이블 데이터 입력
INSERT INTO COURSE_TBL(C_NO, C_NAME, C_UNIT) VALUES (11, '자바', 3);
INSERT INTO COURSE_TBL(C_NO, C_NAME, C_UNIT) VALUES (22, '데이터베이스', 3);
INSERT INTO COURSE_TBL(C_NO, C_NAME, C_UNIT) VALUES (33, '서버프로그램', 3);

-- 3. STUDENT_TBL 테이블 데이터 입력
INSERT INTO STUDENT_TBL(S_NO, S_NAME, S_ADDRESS, S_GRADE_NO, P_NO) VALUES (10101, '김학생', '서울', 1, 3);
INSERT INTO STUDENT_TBL(S_NO, S_NAME, S_ADDRESS, S_GRADE_NO, P_NO) VALUES (10102, '이학생', '경기', 1, 3);
INSERT INTO STUDENT_TBL(S_NO, S_NAME, S_ADDRESS, S_GRADE_NO, P_NO) VALUES (10103, '최학생', '인천', 1, 3);

-- 4. ENROLL_TBL 테이블 데이터 입력
INSERT INTO ENROLL_TBL(E_NO, S_NO, C_NO, E_DATE) VALUES (111, 10101, 11, '20-02-25');
INSERT INTO ENROLL_TBL(E_NO, S_NO, C_NO, E_DATE) VALUES (222, 10101, 22, '20-02-26');
INSERT INTO ENROLL_TBL(E_NO, S_NO, C_NO, E_DATE) VALUES (333, 10101, 33, '20-02-27');

-- 5. LECTURE_TBL 테이블 데이터 입력
INSERT INTO LECTURE_TBL(L_NO, P_NO, E_NO, L_NAME, L_LOCATION) VALUES (1111, 1, 111, '자바완전정복', 'A101');
INSERT INTO LECTURE_TBL(L_NO, P_NO, E_NO, L_NAME, L_LOCATION) VALUES (2222, 1, 111, '자바완전정복', 'B101');
INSERT INTO LECTURE_TBL(L_NO, P_NO, E_NO, L_NAME, L_LOCATION) VALUES (3333, 1, 111, '자바완전정복', 'C101');

-- 6. 변경된 내용을 DB에 반영
COMMIT;