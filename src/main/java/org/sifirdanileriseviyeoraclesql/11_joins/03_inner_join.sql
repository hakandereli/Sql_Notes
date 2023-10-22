-- Inner join geleneksel format

/*
LAST NAME | DEPARTMENT_ID | DEPARTMENT_NAME| CITY
BU KOLONLAR LAZIM DİYELİM

LAST NAME VE DEPARTMENT ID EMPLOYEES TABLOSUNDA
DEPARTMENT NAME DEPARTMENTS TABLOSUNDA
CITY LOCATIONS TABLOSUNDA

EMPLOYEES TABLOSU -> DEPARTMEN_ID İLE DEPARTMENS TABLOSUNA BAĞLI ANCAK CİTY TABLOSUNA DİREK BAĞLI DEĞİL
DEPARTMENT ÜZERİNDE LOCATION ID VAR

INNER JOİN KESİŞİM KÜMESİ YANİ HEPSİNDE EŞLEŞEN KAYITLARI GETİRİR.
bU TABLOLARI BİRER KÜME OLARAK DÜŞÜNÜRSEN 3 KÜMENİN KESİŞİMİ OLARAK DÜŞÜN
HER HANGİ BİR TABLO DA DİĞERLERİNE UYMAYAN BİR KAYIT VARSA LİSTELEMEZ
*/

/*GELENEKSEL FORMAT*/
SELECT
    E.LAST_NAME,
    E.DEPARTMENT_ID,
    D.DEPARTMENT_NAME,
    L.CITY
    FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
    AND D.LOCATION_ID = L.LOCATION_ID
    ORDER BY E.LAST_NAME ASC;

/*ANSI FORMAT*/
SELECT
    E.LAST_NAME,
    E.DEPARTMENT_ID,
    E.DEPARTMENT_NAME,
    L.CITY
    FROM EMPLOYEES E
    INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    JOIN LOCATIONS L ON E.LOCATION_ID = L.LOCATION_ID
    ORDER BY E.LAST_NAME;

/*INNER İFADE OPSİYONELDİR SADECE JOİN YAZSANDA ÇALIŞIR.*/

