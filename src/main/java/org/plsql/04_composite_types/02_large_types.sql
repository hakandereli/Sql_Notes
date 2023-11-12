-- Large Object(LOB) Data Types

-- BLOB, CLOB, LONG ,......

-- binary, character, long

-- binary daha çok fotoğraf ve dosya için, character ve long ise daha uzun metinsel ifadeler için kullanılır.

-- özel olarak ise LONG kaynak kodlarının(java) tutulduğu tiptir.


--************************ BLOB*******************************
-- Örnek Senaryo : File sistemdeki resimleri bir tabloya insert eden pl/sql uygulaması yazacağız.
/*
İşlem Adımları:
1- Resimleri insert edeceğimiz TABLE create edeceğiz.
2- Directory create edeceğiz.(veritabanları file system tarafını direk olarak göremez bunun için directory create edilmelidir.)
3- Aktarımı yapacak plsql program yazacağız.
*/


create table RESIMLER(
    dosyaAdi    varchar2(100) primary key,
    resim       blob
);


-- directory create etmek için sys veya system yetkisi gerekir.
create directory IMAGE_DIR AS 'C:\Users\hakan\resimler';

--HR KULLANICINA BU DIRECTORY ÜZERİNDE OKUMA VE YAZMA YETKİSİ VERMEN LAZIM.
grant read, write on directory IMAGE_DIR to HR;

--binary file large object ler den biri gene(bfile)

DECLARE
    foto            bfile;
    tempdata        blob;
    KaynakOffset    PLS_INTEGER := 1;
    hedefOffset     PLS_INTEGER := 1;
    dosyaIsmi       varchar2(30) := 'plsql.jpg';
BEGIN
    dbms_lob.CreateTemporary(tempdata, true);
    foto := Bfilename('IMAGE_DIR' , dosyaIsmi);
    dbms_lob.FileOpen(foto, dbms_lob.FILE_READONLY);
    dbms_lob.LoadFromFile(tempdata, foto, dbms_lob.LOBMAXSIZE, hedefOffset, KaynakOffset);

    insert into RESIMLER (dosyaAdi, resim) values (dosyaIsmi,tempdata);
    commit;

    dbms_lob.FileClose(foto);
END;


select * from resimler; -- dediğinde plsql bir veritabanı programlama aracıdır arayüz değildir.
--resimlere göremeyeceksin haliyle sadece (BLOB) yazacak çift tıklayarak detaylarını açıp text olarak veya fotoğraf olarak görebilirsin.


--AYNI ŞEKİLDE VERİTABANINDAKİ FOTOĞRAFLARI KLASÖRE AKTARABİLİRSİN PLSQL İLE

-- BU İFADELERİ ANANONYMOUS ŞEKİLDE DEĞİLDE FUNCTION PROCEDURE ŞEKLİNDE YAZARAK
-- PROGRAMLAMA DİLİ OLMASININ TÜM NİMETLERİNDEN FAYDALANABİLİRSİN.