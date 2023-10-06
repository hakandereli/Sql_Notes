/*
    AVG
    MAX,MIN
    SUM,COUNT
    STDDEV, VARIANCE : STANDART SAPMA VE VARYANS
    BUNLARIN KULLANILDIĞI SORGULARDA YALIN KOLONLAR YAZAMASSIN YAZARSAN GROUP BY YAZMAN GEREKİR.


    Bu fonksiyonlar hem geleneksel Kümeleme(Aggregate) hemde Analitik sorgulamarda kullanılır.

    Geleneksel kullanımda GROUP BY(br Having) ile birlikte kullanılır.

    Analitik sorgulamalarda OVER ile birlikte kullanılır.
*/

/*Maaş ortalamasını bul avg 38 hane duyarlıklıdır, round ile 2 hane duyarlı hale getirir.*/
/*En fazla maaş, en az maaş, maaşlar toplamı, count ı yıldız ile de kullanabilirsin kolon ile de çalışan sayısını verir burada*/
/*İSTATİKSEL FONKSİYONLAR.png*/
SELECT
    ROUND(AVG(SALARY),2),
    MAX(SALARY),
    MIN(SALARY),
    SUM(SALARY),
    COUNT(SALARY),
    ROUND(STDDEV(SALARY),2),
    ROUND(VARIANCE(SALARY),2)
FROM EMPLOYEES;
/*Yukarıdaki sorguya DEPARTMENT_ID yi yalın bir kolon olarak eklersen bu satırlardaki veriyi göstermek için diğer fonksiyonlar
ise bir işlem yapıp sonuç gösteriyor hata alırsın*/

/*
Eğer Department lara göre gruplama yapsın istersen GROUP BY İFADESİ KULLANMAN GEREKİR VE DEPARTMANLARI GÖSTERMEK İÇİN YALIN
halde yazman gerekir kolonunu yani yukarıda anlatılan yapı group by ile hata vermez hale getirilir.
*/

/*GROUP BY BURADA DEPARTMAN BAZINDA AYRI AYRI İSTATİKSEL SONUÇLAR GÖSTERİR, GROUP BY YAZDIĞIN KOLON LİSTELENECEK ALANDA YALIN
HALDE BULUNMALIDIR*/
/*GROUP BY.png*/
SELECT
    DEPARTMENT_ID,
    ROUND(AVG(SALARY),2),
    MAX(SALARY),
    MIN(SALARY),
    SUM(SALARY),
    COUNT(SALARY),
    ROUND(STDDEV(SALARY),2),
    ROUND(VARIANCE(SALARY),2)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

/*Peki bölümde çalışanların sayısı(count) 1 den fazla insan varsa sadece göstersin nasıl dersin burada istatiksel bir fonksiyonun
 sonucuna göre filtreleme yapacağın için HAVİNG KULLANMAK ZORUNDASIN
 Having istatiksel fonksiyonlar üzerinde filtreleme yapar.
 HAVİNG İ GROUP BY DAN SONRA YAZMAN GEREKİR.
 */
 SELECT
    DEPARTMENT_ID,
    ROUND(AVG(SALARY),2),
    MAX(SALARY),
    MIN(SALARY),
    SUM(SALARY),
    COUNT(SALARY),
    ROUND(STDDEV(SALARY),2),
    ROUND(VARIANCE(SALARY),2)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(SALARY) > 1
ORDER BY DEPARTMENT_ID;

/*iSTATİKSEL FONKSİYONLAR la ilgili olmayan bir filtreleme yapabilir miyiz örn: sadece it departmanını getir gibi*/
/*WHERE YAZARSIN GROUP BY DAN ÖNCE BU istatiksel fonksiyonlardan gelen sonucu eklemeyen bir işlemdir çünkü*/
 SELECT
    DEPARTMENT_ID,
    ROUND(AVG(SALARY),2),
    MAX(SALARY),
    MIN(SALARY),
    SUM(SALARY),
    COUNT(SALARY),
    ROUND(STDDEV(SALARY),2),
    ROUND(VARIANCE(SALARY),2)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90,
GROUP BY DEPARTMENT_ID
HAVING COUNT(SALARY) > 1
ORDER BY DEPARTMENT_ID;


/*Yukarıdakiler geleneksel kullanımdı aşağıda ise analitik sorgulara bakalım*/
--1 ÇALIŞANIN ADI , MAAŞI , KUMULATİF TOPLAM VE ÇALIŞAN ADINA GÖRE SIRALASIN
--KÜMÜLATİF TOPLAM ŞU DEMEK HER ÇALIŞAN LİSTELENİRKEN BİR KOLON DAHA İSTİYOR BİR ÖNCEKİ ÇALIŞANIN MAAŞINI O SATIRA EKLESİN GÖSTERSİN
SELECT FIRST_NAME, SALARY, SUM(SALARY) OVER(ORDER BY FIRST_NAME) AS TOPLAMMAAS
FROM EMPLOYEES;

--OVER KÜMÜLATİF İŞİNİ HALLEDER

--2 ÇALIŞANIN ADI , MAAŞI , BÖLÜMÜ, BÖLÜM BAZLI KUMULATİF TOPLAM (BÖLÜME GÖRE GRUPLASIN, MAAŞA GÖRE SIRALASIN)
SELECT FIRST_NAME,
       SALARY,
       DEPARTMENT_ID,
       SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY) AS SUMTOTAL
       FROM EMPLOYEES
       ORDER BY DEPARTMENT_ID;





























