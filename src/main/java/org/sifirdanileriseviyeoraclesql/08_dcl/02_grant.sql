/*Tabs sanal bir tablodur bir şemanın içerisinde hangi tablolar olduğu görmek için kullanılır aşağıdaki sorgu*/
SELECT TABLE_NAME FROM TABS;

/*ABUZER -> HAKAN şemasının objelerindeki regions ı sorgula eğer yetkisi yoksa bu tablo yok hatası vericek*/
SELECT * FROM HAKAN.REGIONS;

/*Yetkiyi HAKAN YADA DBA VEREBİLİR*/
GRANT SELECT ON REGIONS TO ABUZER;

/*ABUZER KAYIT EKLEYEMEZ*/
INSERT INTO HAKAN.REGIONS(REGION_ID, REGIONS_NAME) VALUES (6, 'Antartika');

/*Yetki verildi*/
GRANT INSERT ON REGIONS TO ABUZER;
GRANT UPDATE , DELETE ON REGIONS TO ABUZER;

DELETE FROM HAKAN.REGIONS WHERE REGION_ID = 6;

/*
Yetkileri gruplayarak bir rol de toplamak ve bu rolü kullanıcılara vermek daha mantıklıdır bu şekilde tek tek uğraşmassın
*/

/*Yetkileri YUKARIDAKİ şekilde verirsen sadece o kullanıcı kullanabilir yetkilerini devredemez verdiğin kullanıcı*/
GRANT UPDATE , DELETE ON REGIONS TO ABUZER WITH GRANT OPTION;

/*WITH GRANT OPTION İLE VERİRSEN VERDİĞİN KULLANICI KENDİ YETKİLERİNİ DEVREDEBİLİR.*/
