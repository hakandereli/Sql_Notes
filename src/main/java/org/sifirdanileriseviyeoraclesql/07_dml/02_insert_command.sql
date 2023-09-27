/*
    Insert için iki farklı sözdizimi(syntax) vardır.


    INSERT INTO <table_name> VALUES (val1, val2, val3 , ...)

    INSERT INTO <table_name>(col1, col2, col3, ...) VALUES( val1, val2, val3,....)

    Aşağıdakini kullanmak daha mantıklı hangi kolonlara veri girişi yaptığını belirtmen values da vereceğin değerlerle karşılaştırmanı sağlar.

    Yukarıda ki kullanım da ise tabloya başka birisi kolon eklemişse hataya yol açabilir.
*/

/*
    Insert komutunu kullanmadan önce grafiksel arayüz varsa tıklayıp bakabilir yada hızlıca
    DESC komutuyla tablonun yapısını tanımını görebilirsin.
*/
DESC REGIONS;

/*

INTEGER DEĞERLER parantez kullanmadan yazılır.
Metinsel değerler tek tırnak ile girilir.
*/
INSERT INTO REGIONS VALUES(1, 'Europe');

/*Birinci synstax kolon eklendiğinde hata verecektir.*/
ALTER TABLE REGIONS ADD POPULATE NUMBER(15);

/*Not enough values yani yeterli değer girişi yok hatası verir.*/
INSERT INTO REGIONS VALUES(2, 'Asia');

/*İkinci syntax daha mantıklıdır. Yeni eklenen kolon zorunlu değilse eğer bu komut çalışır.*/
INSERT INTO REGIONS(REGION_ID, REGION_NAME) VALUES(2, 'Asia');

SELECT * FROM REGIONS;

/*Bu kolonu denemek için eklemiştik sildik.*/
ALTER TABLE REGIONS DROP COLUMN POPULATE;


/*Countries tablosuna veri girmek istiyoruz*/

DESC COUNTRIES;

SELECT * FROM COUNTRIES;

/*FK YI(REGIONS DAKİ) EKLEMEK İÇİN YENİ BİR ÇALIŞMA ALANI DAHA AÇARAK YAN YANA FK NIN ID SİNİ GÖREBİLİRSİN.*/
INSERT INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME , REGIONS_ID) VALUES ('TR','Türkiye',1);

SELECT * FROM REGIONS;


/*Bu komutu çalıştırmak istediğin PK olan COUNTRY_ID yi ihlal etmiş olursun TR zaten girilmişti
PK alanlar birden fazla kolondan ve tipten oluşabilir hep id number a odaklanma
*/
INSERT INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME, REGIONS_ID) VALUES ('TR','KKTC',1);

/*Bu komut da ıntegrtiy constraint verir yani verdiğin fk id si geçersiz regions tablosuna 100 nolu kayıt yok der.*/
INSERT INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME, REGIONS_ID) VALUES ('KT','KKTC',100);

/*Aşağıdaki komutlar ise başarılı şekilde çalışır.*/
INSERT INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME, REGIONS_ID) VALUES ('KT','KKTC',1);
INSERT INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME, REGIONS_ID) VALUES ('IT','Italy',1);

select * from COUNTRIES;



















