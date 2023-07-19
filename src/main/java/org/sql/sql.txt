************************NUMBER KOLON EKLEME**************************************
ALTER TABLE HIZMET ADD MUAFIYET_ORANI NUMBER(19,0);
ALTER TABLE HIZMET_AUD ADD MUAFIYET_ORANI NUMBER(19,0);

************************ENUM İÇİN STRING KOLON EKLEME**************************************
ALTER TABLE TARIFE_GELIR_AYR ADD ENDEKS_OKUMA_TURU VARCHAR2(30);
ALTER TABLE TARIFE_GELIR_AYR_AUD ADD ENDEKS_OKUMA_TURU VARCHAR2(30);

************************TARIH KOLONU EKLEME**************************************
ALTER TABLE SEMA_ADI.SOZLESME_HIZMET ADD MUAFIYET_BITIS_TARIHI TIMESTAMP;
ALTER TABLE SEMA_ADI.SOZLESME_HIZMET_AUD ADD MUAFIYET_BITIS_TARIHI TIMESTAMP;

************************KESİŞİM TABLOSUNDAN SUBQUERY İLE KAYIT ÇEKME**************************************
SELECT * FROM HIZMET WHERE ID IN (
	SELECT ID_HIZMET  FROM SOZLESME_HIZMET WHERE ID_SOZLESME = 3
);

************************KOLON SİLME**************************************
ALTER TABLE HIZMET DROP COLUMN ID_BGP_GELIRKOD;
ALTER TABLE HIZMET_AUD DROP COLUMN ID_BGP_GELIRKOD;

************************MANUEL FK OLURŞTURMA**************************************
ALTER TABLE HIZMET ADD ID_GELIRKOD NUMBER(19,0);
ALTER TABLE HIZMET_AUD ADD ID_GELIRKOD NUMBER(19,0);

ALTER TABLE HIZMET ADD CONSTRAINT FK_HIZMET_GELKOD FOREIGN KEY (ID_GELIRKOD) REFERENCES GELIRKOD("ID") ENABLE;
/**
Yukarıda ki senaryo da HIZMET VE GELIRKOD şeklinde iki tablomuz var Hizmet tablosu üzerinde Gelirkodları saklanmak istiyor.
Öncelikle saklanacak alan hizmet ve hizmet aud tablosuna ekleniyor daha sonra contrainti ekleniyor.
*/

************************SEQUENCE SONRAKİ DEĞERİNİ ÖĞRENME**************************************
select MENU_ID_SEQ.nextval from dual;