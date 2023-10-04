/*Karakter Fonksiyonları*/

/*
LOWER,

UPPER,

INITCAP, capatilize işlemi yapar

LENGHT :string uzunluğı verir

SUBSTR(STRİNG , M ,N) : M DEN BAŞLA N KARAKTER AL ORACLE DA BİRDEN FAZLA STRİNG 0 DAN DEĞİL
SADECE M VERİRSEN M DEN BAŞLA SONUNA KADAR AL DEMEK

INSTR() : harf yada kelime aramak için kullanılır konumunu verir string teki

REPLACE(string, old_string, new_string)

TRANSLATE(string , old_characher(s) , new_character(s)) : replace gibidir biraz daha gelişmiş hailidir.

RPAD : sağına string ekleme yap

LPAD: soluna string ekleme  yap

LTRIM

RTRIM

CONCAT
*/

SELECT
    DEPARTMENT_NAME,
    LOWER(DEPARTMENT_NAME),
    UPPER(DEPARTMENT_NAME),
    INITCAP(DEPARTMENT_NAME),
    SUBSTR(DEPARTMENT_NAME, 1 ,3),
    SUBSTR(DEPARTMENT_NAME, 3),
    SUBSTR(DEPARTMENT_NAME, -9, 4),
    LENGTH(DEPARTMENT_NAME)
FROM DEPARTMENTS;

/**************INSTR**************/
/*0 göstermesi yok anlamında*/
/*a nın ilk bulunduğu adres 2*/
/*sayılar verilirse örneği e harfinin 9 uncu adresten sonra 1 dediği ilk geçtiği 2 dese 2inci geçtiğinin adresini verir.*/
SELECT
    INSTR('Hakan Dereli','a'),
    INSTR('Hakan Dereli','a',1,1),
    INSTR('Hakan Dereli','e',9,1),
    INSTR('Hakan Dereli','e',5,2),
    INSTR('Hakan Dereli','e',-8,1),
    INSTR('Hakan Dereli','e',-8,15),
    INSTR('Hakan Dereli','eeee',1,1)
from dual;


/**************REPLACE**************/
/*Aradığını bulamassa işlem yapmaz.
Raporlarda ve kriptoloji de çok kullanılır orjinal veriyi değiştirmeden manupüle ederek gösterir ve ya gizlersin
*/
SELECT
    REPLACE('HAKAN DERELİ', 'HAKAN' , 'H.'),
    REPLACE('HAKAN DERELİ', 'A' , 'X'),
    REPLACE('HAKAN DERELİ', 'Z' , 'X')
FROM DUAL;

SELECT FIRST_NAME , JOB_ID,
    REPLACE (JOB_ID, 'IT', 'BT'),
    REPLACE (JOB_ID, 'IT', 'BIL')
FROM EMPLOYEES
WHERE JOB_ID LIKE '%IT%';

/**************TRANSLATE**************/
/*replace den farkı şudur: replace bütün olarak kelime arar translate karakter karakter arar.*/
/*R -> 1 , O -> 2 , a -> 3 , S -> 4 ile karakter karakter tüm verilen string i çevirir.*/
SELECT
    TRANSLATE('Oracke Sql', 'rOaS' , '1234')
FROM DUAL;

/*Şifreleme yapalım örn: her harf kendinden sonra gelen harfe değiştirilecek*/
SELECT
    'Merhaba Hakan Dereli' ORJ_MESAJ,
    TRANSLATE('Merhaba Hakan Dereli',
     'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' ,
     'bcdefghijklmnopqrstuvwxyzaABCDEFGHIJKLMNOPQRSTUVWXYZA') SIFRELI_MESAJ
FROM DUAL;

/*BURADA DA ŞİFREYİ ÇÖZELİM*/
SELECT
    'Merhaba Hakan Dereli' ORJ_MESAJ,
    TRANSLATE('ŞİFRELİ MESAJ',
    'bcdefghijklmnopqrstuvwxyzaABCDEFGHIJKLMNOPQRSTUVWXYZA',
     'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') MESAJ
FROM DUAL;


/**************RPAD LPAD**************/
SELECT * FROM EMPLOYEES;

/*20 KARAKTERE SOLDAN VEYA SAĞDAN İSTEDİĞİN KARAKTER İLE DOLDURUR
ÖRNEĞİN ALİ İSE 17 TANE * İLE SAĞDAN DOLDURUR RPAD*/
SELECT
    LAST_NAME,
    RPAD(LAST_NAME, 20, '*'),
    LPAD(LAST_NAME, 30, '?'),
    LPAD(LAST_NAME, 15, '*/')
 FROM EMPLOYEES;

/**************LTRIM RTRIM TRIM**************/
/*SOL SAĞ BOŞLUKLARI TEMİZLEMEK İÇİN KULLANILIR.
SADECE TRIM KULLANIRKEN NEYİ TEMİZLEMEK İSTEDİĞİN VE FROMDAN SONRA NEREDEN TEMİZLEMEK İSTEDİĞİNİ YAZARSIN.
*/
SELECT
    LTRIM('             ORACLE SQL         '),
    RTRIM('             ORACLE SQL         '),
    RTRIM(LTRIM('       ORACLE SQL         ')),
    TRIM('' FROM '              ORACLE SQL         ')
FROM DUAL;

/**************CONCAT**************/
/*String birleştirme için || veya concat fonksiyonu kullanabilirsin.*/
SELECT FIRST_NAME , LAST_NAME FROM EMPLOYEES;
SELECT CONCAT(FIRST_NAME,LAST_NAME) FROM EMPLOYEES;
SELECT CONCAT(CONCAT(FIRST_NAME,' ') , LAST_NAME) FROM EMPLOYEES;

/*PİPE İŞLEMİNDE PARAMETRE SINIRI YOKTUR CONCAT 2 PARAMETRE İLE ÇALIŞIR*/
SELECT FIRST_NAME || '' || LAST_NAME FROM DUAL;
SELECT CONCAT(CONCAT(FIRST_NAME ,' is a '), JOB_ID) FROM EMPLOYEES;
SELECT FIRST_NAME || 'is a ' || JOB_ID FROM EMPLOYEES;






