/*İki tablo arasında AYNI İSME SAHİP KOLONLAR ÜZERİNDE yapılır.

  Aynı isme sahip kolonların değerleri eşit olanları listeler.

  Kolon isimleri aynı fakat veri tipleri farklı ise sorgu çalışmaz, hata verir.

  kolon isimleri yazılmaz.
*/

SELECT * FROM table1 NATURAL JOIN table2;
DESC EMPLOYEES;
DESC JOBS;

SELECT * FROM JOBS;

--ANSI FORMAT
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, JOB_TITLE FROM EMPLOYEES NATURAL JOIN JOBS ORDER BY EMPLOYEE_ID;
/*JOB_TITLE EMPLOYEES TABLOSUNDA YOKTUR JOBS TABLOSUNDAN NATURAL JOİN İLE ÇEKİLDİ.*/

--GELENEKSEL FORMAT E VE J LI KULLANIM SORGU HIZINI ARTIRIR KOLON İSİMLERİ AYNI İSE HANGİ TABLO DAN ALACAĞINI BİLEMEDİĞİ İÇİN ZATEN HATA VERİR.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE FROM EMPLOYEES E, JOBS J WHERE E.JOB_ID = J.JOB_ID ORDER BY EMPLOYEE_ID;
