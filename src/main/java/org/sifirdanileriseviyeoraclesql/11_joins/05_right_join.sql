/*
right join

DEPARTMENT_ID  | DEPARTMENT_NAME | EMPLOYEE_ID | LAST_NAME | SALARY

KOLONLARI İSTENİYOR OLSUN.

DEPARTMENT_ID VE DEPARTMENT_NAME (DEPARTMENTS TABLOSUNDA)
EMPLOYEE_ID , LAST_NAME VE SALARY (EMPLOYEES TABLOSUNDA)


*/
/*GELENEKSEL FORMAT*/
SELECT
    E.EMPLOYEE_ID,
    E.LAST_NAME,
    E.SALARY,
    D.DEPARTMENT_ID,
    D.DEPARTMENT_NAME
    FROM EMPLOYEES E, DEPARTMENTS D
    WHERE E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID
    ORDER BY 1,2,3,4;

/* + İŞARETİ KOYDUĞUN TARAFTAKİ BİLGİLERİN KARŞILIĞI VARSA GELİR YOKSA BOŞ GELİR BU ŞEKİKLDE RİGHT JOİN*/
/*Yani departman var ama çalışan girilmediyse departmanları gösterir çalışanlarını boş gösterir.*/
/* + işareti koymassan inner joindir sadece direk eşleşenler gelir.*/
/* + işaratinin olduğu taraf opsiyoneldir yani verisi varsa gelir yoksa null gelir.*/

/*ANSI FORMAT*/
SELECT
    E.EMPLOYEES_ID,
    E.LAST_NAME,
    E.SALARY,
    D.DEPARTMENT_ID,
    D.DEPARTMENT_NAME
    FROM EMPLOYEES E
 RIGHT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

/**gene ansi formattada aynı right join departments diyince department tablosunda olanları kesin getir (right join)
  employees varsa getir*/

/*left outer departments şeklinde yazsaydı bu sefer department sag tablo employees sol tablo yani employees kesin getir
  department karşılığı varsa getir
  demektir.*/

/*Yukarıdaki çıktının aynısını ben left joinle yazmak istiyorum dersen*/
SELECT
    E.EMPLOYEES_ID,
    E.LAST_NAME,
    E.SALARY,
    D.DEPARTMENT_ID,
    D.DEPARTMENT_NAME
FROM DEPARTMENTS D
     LEFT OUTER JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
/*right kelimesini left yaptım ve tabloların yazılış sırasını değiştirdim bu kadar*/