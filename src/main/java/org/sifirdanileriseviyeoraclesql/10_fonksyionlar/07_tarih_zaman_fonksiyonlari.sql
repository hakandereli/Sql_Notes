/*
    CURRENT_DATE: SESSION Timezone ' a göre Tarih ve saati verir.
    SYSDATE     : Database Timezone 'a göre Tarih ve Saati verir
    SYSTIMESTAMP: Zaman damgası

    TARİH FORMATLARI İNCELENECEK DAHA SONRA
*/

/*Açılan oturumun timezone una göre loglama ve işlem yapar uluslar arası bir siten bir işin varsa bunu kullanman ve senkronize etmen gerekir
aksi takdir de sysdate seçersen db saatine göre işlem yaparsın rusyada ki adam ingilitrede ki sunucu saatine göre işlem yapmış olur.
*/

/*tarih zaman formatları.png eklendi incele*/

/*db nin zaman damgası kurulurken seçilir. Aşağıdaki sorguda sonuçlar eşit geliyorsa oturum açtığın yerde ve bilgisayardaki
saatle db nin zaman damgası uyuyor demektir ancak adam farklı bir saat dilimindeyse aşağıdaki sorgu farklı sonuç döner.
*/
SELECT CURRENT_DATE, SYSDATE FROM DUAL;

/*Bu senin sessıon in timezoneudur*/
SELECT SESSIONTIMEZONE FROM DUAL;
SELECT DBTIMEZONE FROM DUAL;

/*Açılan session un timezonunu aşağıdaki şekilde değiştirebilirsin.*/
ALTER SESSION SET TIME_ZONE = '+2:0';

/*ELEKTRONİK İŞLEMLERDE KULLANILIR BU HASHCODE İLE ÇÖZÜLÜR VE DEĞİŞTİRİLİP DEĞİŞTİRİLMEDİĞİNE BAKILIR*/
SELECT SYSTIMESTAMP FROM DUAL;

/*to char charactere çevirmek için kullanılır görüntülemek için bunu kullandık*/
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'D') HAFTANINKACINCIGUNU,
    TO_CHAR(SYSDATE, 'DD') AYINKACINCIGUNU,
    TO_CHAR(SYSDATE, 'DDD') YILINKACINCIGUNU,
    TO_CHAR(SYSDATE, 'DAY') GUNISMI,
    TO_CHAR(SYSDATE, 'Dy') GUNISMIKISA,
    TO_CHAR(SYSDATE, 'w') AYINKACINCIHAFTASI,
    TO_CHAR(SYSDATE, 'ww') YILINKACINCIHAFTASI,
    TO_CHAR(SYSDATE, 'mm') AYNO,
    TO_CHAR(SYSDATE, 'MON') AYISMI,
    TO_CHAR(SYSDATE, 'YYYY') YIL,
    TO_CHAR(SYSDATE, 'YEAR') YILINGILIZCEOKUNUSU,
    TO_CHAR(SYSDATE, 'HH24:MI:SS') SAATDAKIKA,
    TO_CHAR(SYSDATE, 'dd/mm/yyyy HH24:MI:SS') GENISFORMAT
FROM DUAL;