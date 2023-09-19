/*
DDL de CREATE Komutu ile şunlar oluşturulabilir.

    1.Database
    2.User
    3.Table
    4.View
    5.(Data) Type
    6.Package(PL/SQL)
    7.Procedure(PL/SQL)
    8.Function(PL/SQL)
    9.Trigger(PL/SQL)
    ....

    Vs...

*/
/*
    Örnek Bir HR model ve ER DİAGRAM oluşturulacak. görsellerde mevcut yapı
    Regions Kıtalar demektir.
    Countries şehirler demektir.
    Locations ilçe gibi düşünülebilir.
    Departmants çalışanın hangi departmanda çalıştığı.
    Jobs çalışanın görevleri
    Employees çalışanlar
    Jobs_history ise çalışan terfi ederse geçmiş görevlerini saklamak için.

*/

CREATE TABLE REGIONS(
    REGION_ID NUMBER,
    REGION_NAME VARCHAR2(25)
);

CREATE TABLE COUNTRIES(
    COUNTRY_ID CHAR(2),
    COUNTRY_NAME VARCHAR(40),
    REGIONS_ID NUMBER
);

CREATE TABLE LOCATIONS(
    LOCATION_ID NUMBER(4),
    STREET_ADRESS VARCHAR2(40),
    POSTAL_CODE VARCHAR2(12),
    CITY VARCHAR2(30) NOT NULL,
    STATE_PROVINCE VARCHAR2(25),
    COUNTRY_ID CHAR(2)
);

CREATE TABLE DEPARTMENTS(
    DEPARTMENT_ID NUMBER(2),
    DEPARTMENT_NAME VARCHAR2(30),
    MANAGER_ID NUMBER(4)
);

CREATE TABLE JOBS(
    JOB_ID VARCHAR2(10),
    JOB_TITLE VARCHAR2(35) NOT NULL,
    MIN_SALARY NUMBER(6),
    MAX_SALARY NUMBER(6)
);

CREATE TABLE EMPLOYEES(
    EMPLOYEE_ID NUMBER(6),
    FIRST_NAME VARCHAR2(20),
    LAST_NAME VARCHAR(25),
    EMAIL VARCHAR2(25) NOT NULL,
    PHONE_NUMBER VARCHAR2(20),
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR2(10),
    SALARY NUMBER(8,2),
    COMISSION_PCT NUMBER(2,2),
    MANAGER_ID NUMBER(6),
    CONSTRAINT EMP_SALARY_MIN CHECK (SALARY > 0),
    CONSTRAINT EMP_EMAIL_UK UNIQUE(EMAIL)
);

CREATE TABLE JOB_HISTORY(
     EMPLOYEE_ID NUMBER(6),
     START_DATE DATE NOT NULL,
     END_DATE DATE NOT NULL,
     JOB_ID VARCHAR2(10),
     DEPARTMENT_ID NUMBER(4),
     CONSTRAINT JHIST_DATE_INTERVAL CHECK (END_DATE > START_DATE)
);
