/*Kullanıcı tanımlı tipler oracle da varsayılan tipler ile kendine özel tipler oluşturabilirsin.*/

/*Tablo bu şekilde de oluşturulabilir adres kısmı için kendi tipini de tanımlayabilirsin.*/
CREATE TABLE MUSTERILER(
    MUSTERI_ID NUMBER(10),
    CADDE VARCHAR(30),
    SEHIR VARCHAR(50),
    ULKE_KODU CHAR(2),
    POSTA_KODU CHAR(5)
);

CREATE TYPE ADRES_T AS OBJECT(
    CADDE VARCHAR(30),
    SEHIR VARCHAR(50),
    ULKE_KODU CHAR(2),
    POSTA_KODU CHAR(5)
);

CREATE TYPE ADRES_TAB IS TABLE OF ADRES_T;

CREATE TABLE MUSTERILER(
     MUSTERI_ID NUMBER(10),
    ADRES ADRES_TAB
)
NESTED TABLE ADRES STORE AS MUSTERI_ADRES;


DESC MUSTERILER;

INSERT INTO MUSTERILER VALUES
(
    1,
    adres_tab(
        adres_t('İstanbul Caddesi','Istanbul','TR','34100'),
        adres_t('Ankara Caddesi','Ankara','TR','06100')
    )
);

/*NESTED TABLOYA VERİ GRİŞİ*/
INSERT INTO MUSTERILER VALUES
(
    2,
    adres_tab(
        adres_t('Bağdat Caddesi','Istanbul','TR','34100'),
        adres_t('Kızılay Caddesi','Ankara','TR','06100')
    )
);

/*NESTED TABLOLAR BU ŞEKİLDE SORGULANDIĞINDA OBJE GÖZÜKÜR*/
select * from MUSTERILER;

/*BÖYLE SORGULARSAN VERİLERİ GÖREBİLİRSİN. BİRDEN FAZLA TABLO DAN VERİ ÇEKERKEN MUSTERILER TABLOSUNA ALIAS I AS M DİYEREK DE VERİLEBİLİR.*/
SELECT
    M.MUSTERI_ID, U.*
    FROM MUSTERILER M, TABLE(ADRES) U;