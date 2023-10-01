/*
    Hiyerarşik ne demek bir ağaç yapısı, soy ağacı gibi düşün.

    Anahtar kelimeler
    1- Start With: Başlangıç noktası
    2- Connect By: Parent child arasında ki ilişkiyi belirler.
    3- Prior: connect by yaparken eşitliğin iki tarafında da kullanılabilir. Parent veya child tarafına yazabilirsin.
    4- Sys_connect_by_path: bu bir fonksiyondur hiyerarşi deki pathi gösterir. Select içerisindeki sutunlar gibi kullanılır 2 parametre alır.
    Üst menü göstermek için kullanabilirsin.
    5- Connect_by_root: bu da bir fonksyion gene select deki kolon girer gibi kullanılabilir.
    Başlangıç noktasını belirtmessin kendisi alır. EN üsttekini yazdırmak için
    6- Level: hiyerarşinin seviye numarasını belirtir.


   Hiyerarşik Sorgu Template
   SELECT col1, col2, ... LEVEL FROM TABLE1
   start with colx = ...
   CONNECT BY PRIOR Pkey_col = Fkey_col;
*/

/*1- Connect by prior örneği (Çalışanlar ile yöneticileri arasındaki hiyerarşi ilişkisi)*/
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID FROM EMPLOYEES
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;
/*Parent i olmayan kaydı göstermez farkı bu prior i pk nın olduğu yere yazman mantıklı*/
/*Hiyerarşik yapıyı görüntülemek için kullanılır örneğin çalışanlar tablosunda karışık girilen çalışanların ekiplerini ve liderlerini
belirlemek istiyorsun gibi düşün.*/

/*2 Level örneği ( çalışanları ile yöneticileri arasındaki hiyerarşi ilişkisi - seviye no)*/
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID, LEVEL FROM EMPLOYEES
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;
/*Sorgu sonucunda gelen verilerin seviyelerini görmek için kullanılır ağaçdaki seviyeleri yani 1 den başlar derinliğe göre artar.*/

/*3 Start with örneği ( hiyerarşi belirli bir noktadan başlatabiliriz.
- Ayrıca siblings BY anahtar kelimesi kullanarak hiyerarşik sıralama yapabiliriz.)*/
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID, LEVEL FROM EMPLOYEES
START WITH EMPLOYEE_ID = 100
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID, LEVEL FROM EMPLOYEES
START WITH EMPLOYEE_ID = 100
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID ORDER SIBLINGS BY LAST_NAME;

/*4- CONNECT BY ROOt - SYS_CONNECT_By path örneği (her çalışanın hiyerarşideki bağlı olduğu üst birim ve seviyesi)*/
--LEVEL1 -> Level2 -> Level3
-- Dede -> Baba -> Torun
SELECT LAST_NAME Calisan, LEVEL - 1 Seviye,
 CONNECT_BY_ROOT LAST_NAME Yonetici,
  SYS_CONNECT_BY_PATH(LAST_NAME , '-->') path
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 110 AND LEVEL > 1
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;