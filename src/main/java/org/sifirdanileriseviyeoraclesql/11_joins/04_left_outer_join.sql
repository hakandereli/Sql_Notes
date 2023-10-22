/*
REGION ID | REGION_NAME  | COUNTRY_ID | COUNTRY_NAME | CITY

KOLONLARI İSTENİYOR
REGION_ID VE REGION_NAME (REGIONS TABLOSUNDA)
COUNTRY_ID VE COUNTRY_NAME (COUNTRIES TABLOSUNDA)
CITY (LOCATIONS Tablosunda)

REGION_ID REGION VE COUNTRIES İ BAGLAR
LOCATION_ID COUNTRIYES VE LOCATION TABLOSUNU BAĞLAR
REGION VE LOCATION ARASINDA DİREK BAĞLANTI YOK

*/
/*YAZILIŞ SIRASINA GÖRE SOLDAN SAĞA YAZILIR TÜRKÇEDE YAZI ONUN GİBİ DÜŞÜN
  İLK YAZILAN SOLDA LEFT SAĞDAKİ RİGHT
  TABLOLARIN YAZILIŞ SIRASINA LEFT RİGHT OLUR
  */

/*GELENEKSEL FORMAT*/
SELECT
    R.REGION_ID,
    REGION_NAME,
    C.COUNTRY_ID,
    C.COUNTRY_NAME
FROM REGIONS R , COUNTRIES C, LOCATION L
    WHERE R.REGION_ID = C.REGIONS_ID(+)
    AND C.COUNTRY_ID = L.COUNTRY_ID(+);
--     AND L.CITY IS NULL;
-- ORDER BY 5,1,3

/* + İŞARETİ OLMASA INNER JOİN DEMEKTİR BURADAKİ + İŞARETİ YALNIZCA ORACLE DA ÇALIŞIR RDMS LERİN HEPSİNDE ÇALIŞACAK SORGULAR YAZMAK
   İSTİYORSAN ANSI Yİ KULLAN

   BURADAKİ + REGIONS TABLOSUNDA Kİ HERŞEYİ GETİR, İKİNCİ TABLODAKİ VARSA KARŞILIĞI GETİR YOKSA O SATIRIDA GETİR AMA KARŞILIĞI OLMADIĞI İÇİN ORAYA BOŞ YAZAR.

   EKSİKLİK OLABİLECEĞİNİ DÜŞÜNDÜĞÜN TARAFA KORSUN + YI
   */

/*ANSI FORMAT*/
SELECT
    R.REGION_ID,
    R.REGION_NAME,
    C.COUNTRY_ID,
    C.COUNTRY_NAME
    FROM REGIONS R
        LEFT OUTER JOIN COUNTRIES C ON R.REGION_ID = C.REGION_ID
        LEFT JOIN LOCATION L ON C.COUNTRY_ID = L.COUNTRY_ID
        -- AND L.CITY IS NULL;
        WHERE L.CITY IS NULL
            ORDER BY 5,1,3;

/*ANSI FORMATTA FROM DAN SONRA TÜM TABLOLARI YAZMIYORSUN BURADA LEFT OUTER JOIN İÇİN İSE
  REGION LEFT TABLODUR ÖNCE YAZILDIĞI İÇİN COUNTRIES İSE RIGHT TABLODUR
  YANİ REGIONS TABLOSUNDAKİ TÜM KAYITLARI GETİR AMA COUNTRIES TABLOSUNDA KARŞIŞLIĞI VARSA YAZAR YOKSA KAYDI ÇEKER KARŞISINA BOŞ YAZAR

  AŞAĞIDAKİ SATIRDA İSE COUNTRIES LEFT TABLO LOCATION RIGHT TABLO

  */

  /*OUTER IFADESI DE GENE OPSİONELDİR OUTER YAZMADAN DA ÇALIŞIR.