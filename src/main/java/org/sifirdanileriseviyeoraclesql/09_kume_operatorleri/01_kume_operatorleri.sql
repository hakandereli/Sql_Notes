/*
Küme Operatörleri 4 Tanedir:
    UNION
    UNION ALL
    INTERSECT
    MINUS

Matematik te kümeler üzerinden anlayabilirsin görselini ekledim.

Union : İki tablonun birleşimi
Intersect : iki tablonun kesişimi
Minus: a fark b veya b fark a dır.
union all ın karşılığı yoktur kümelerde

*/

/*Küme operatorleri ile çalışabilmek için iki tabloya ihtiyacın var*/
/*Departman tablosunu 2 yeni tabloya kayıtlarını bölelim.
birisinden 160 dan küçük EŞİT tüm kayıtlar
birinde 100 den BÜYÜK EŞİT tüm kayıtlar
dolayısıyla keseşimleri var
*/
SELECT * FROM DEPARTMENTS ORDER BY DEPARTMENT_ID;

CREATE TABLE DEPT1 AS SELECT * FROM DEPARTMENS WHERE DEPARTMENT_ID <= 160;
CREATE TABLE DEPT2 AS SELECT * FROM DEPARTMENS WHERE DEPARTMENT_ID >= 100;


SELECT * FROM DEPT1 ORDER BY 1;
SELECT * FROM DEPT2 ORDER BY DEPARTMENT_ID;

/*!!!! BU KOMUTLARI ÇALIŞTIRMAK İÇİN KOLON SAYILARI VE TİPLERİ AYNI OLMALIDIR SELECTDEN DONEN KAYITLAR İÇİN, ANCAK
KOLONLARIN İSİMLERİ FARKLI OLSADA ÇALIŞIR.

/*
Union iki tabloyu birleştirir tekrar eden kayıtları sadece bir kere yazar
*/
SELECT * FROM DEPT1
UNION
SELECT * FROM DEPT1
ORDER BY 1;

/*UNION ALL yazarsan her iki tablodaki kayıtları hiç elemeden alt alt alta ekler*/
SELECT * FROM DEPT1
UNION ALL
SELECT * FROM DEPT1
ORDER BY 1;


/*INTERSECT VE MINUS*/

/*INTERSECT sadece keşisen yani her iki tablo da da aynı olan kayıtları getirir sadece geri kalan kayıtları almaz*/
SELECT DEPARTMAN_ID,DEPARTMENT_NAME FROM DEPT1
INTERSECT
SELECT DEPARTMAN_ID,DEPARTMENT_NAME FROM DEPT2;

/*MINUS BİRİN TABLO DA OLAN AMA İKİNCİ TABLO DA OLMAYAN KAYITLARI GETİRİR*/
/*
a/b
*/
SELECT * FROM DEPT1
MINUS
SELECT * FROM DEPT2;

/*
b/a
*/
SELECT * FROM DEPT2
MINUS
SELECT * FROM DEPT1;

/*bir kümenin kendinden farkı boş kümedir.*/
A/A = NULL



