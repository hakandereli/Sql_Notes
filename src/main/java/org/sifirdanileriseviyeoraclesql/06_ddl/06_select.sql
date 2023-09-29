/*Bir tablodan view dan yada her hangi bir nesne den veri çekmek sorgulamak için kullanılır.*/

/*
select_list: aralarına virgüller koyarak hangi kolonları çekeceğini yazarsın.
source_list: hangi tablo veya view lerden veri çekeceğin
where: filtreleme
order by: sıralama
having: matematiksel işlemler

SELECT select_list FROM source_list
Where...
Order By...
Having
*/

SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, EMAIL FROM EMPLOYEES;
/*Görüntülerken kolon adı değiştirilebilir alias denir buna as yazsan da
 yazmasan da çalışır yazarsan daha anlaşılur olur.

 İki kelimeden oluşmasını istersen çift tırnak içinde yaz.
 */
SELECT FIRST_NAME AD, LAST_NAME SOYAD, EMAIL EPOSTA FROM EMPLOYEES;
SELECT FIRST_NAME as AD, LAST_NAME as SOYAD, EMAIL as EPOSTA FROM EMPLOYEES;
SELECT FIRST_NAME as "ILK AD", LAST_NAME as "SOY AD", EMAIL as "E POSTA" FROM EMPLOYEES;


SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 90;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 100;

/*Her yazılan sorgunun daha performans lı hali yazılabilir.
Aşağıdaki IN komutu OR lu kullanımdan daha yavaş çalışır.
Bu farklar büyük veriler de daha çok hissedilir.
*/
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN (90,100);
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 90 OR DEPARTMENT_ID = 100;

SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE 'M%';
SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE '%MA%';

/*soyadınin ikinci karakteri a dorduncu karakteri e olan kayıtlar*/
SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE '_a_e%';

/*MAAŞI 10K DAN FAZLA VE KOMİSYON ORANI BOŞ OLMAYANLAR*/
SELECT * FROM EMPLOYEES WHERE SALARY > 10000 AND COMMISION_PCT IS NOT NULL;

/*
ORDER BY

VARSAYILAN SIRALAMA KÜÇÜKTEN BÜYÜĞE , A-Z YE YANİ ASC DİR YAZILMADIĞI SÜRECE.
*/
SELECT * FROM EMPLOYEES ORDER BY DEPARTMENTS_ID;
SELECT * FROM EMPLOYEES ORDER BY DEPARTMENTS_ID ASC;
SELECT * FROM EMPLOYEES ORDER BY DEPARTMENTS_ID DESC;

/*
İlk kriter uygulandıktan sonra, aynı değere sahip veriler varsa ikinci kritere göre sıralanır.
*/
SELECT * FROM EMPLOYEES ORDER BY DEPARTMENTS_ID DESC, SALARY ASC, JOB_ID;

/*Kolon isimleri belirtilerek çekilen sorgularda order by da isim yerine 1,2,3 gibi kolon sırası kullanılabilir.*/
SELECT FIRST_NAME AD, LAST_NAME SOYAD, EMAIL EPOSTA FROM EMPLOYEES ORDER BY LAST_NAME, FIRST_NAME DESC;
SELECT FIRST_NAME AD, LAST_NAME SOYAD, EMAIL EPOSTA FROM EMPLOYEES ORDER BY 2, 1 DESC;

/*ORDER BY where varsa her zaman where den sonra yazılır.*/
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 90 ORDER BY SALARY DESC;























