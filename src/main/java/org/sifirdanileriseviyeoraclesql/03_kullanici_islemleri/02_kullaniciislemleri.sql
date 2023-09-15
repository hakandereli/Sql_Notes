/**
kullanıcı oluşturmak bağlantı yetkisi vermez kullanıcı bağlanamaz grant tanımlanması gerekir.
session açabilmesi için connect yetkisi verilmelidir.
resourse ise kaynak kullanma yetkisidir.
*/
CREATE USER HAKAN IDENTIFIED BY myPass
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
PASSWORD EXPIRE;

GRANT CONNECT, RESOURCE TO HAKAN;

/*expire verildiği için yeni şifre girmeni isteyecek oturum süresi doldu hatası verir.*/
/*bağlanmak için sqlplus da bu şekilde bir komut çalışır. kullanıcıadi/şifre*/
CONNECT HAKAN/myPass

/*buraya kadar bağlanabilir ama tablespace üzerindeki yetkileri tanımlanmadığı için her hangi bir obje oluşturamaz.

SQL DEVELOPER DA KOD ÇALIŞTIRMA KISA YOLU CTRL + enter dir.

show user ile bağlandığın kullanıcıyı görebilirsin.

Kullanıcı değiştirmek için exit ile çıkış yapıp diğer kullanıcıyıyla giricen yada

CONNECT HAKAN/myPass ve CONN SYS/myPass as sysdba

*/

CONNECT HAKAN/myPass
CONN SYS/myPass as sysdba

/**
Henüz sadece connect ve resource yetkisi verildiği için tablo oluşturabilir ancak kayıt eklemeye çalıştığında
SQL Error: ORA-01950: no privileges on tablespace 'USERS' bu hatayı alırsın bu tablespace de henüz yetkin yok
*/
create table deneme(
    ID NUMBER,
    ADI VARCHAR2(50)
);

INSERT INTO DENEME VALUES (1,'HAKAN');

/*BU YETKİYLE VERİ GİRİŞİNE İZİN VERİLİR. HAKAN BURADA KULLANICI, grant succeded yetki başarılı şeklinde uyarı verir.

Tabi yetkiler dba yetkisi olan kişilerce tanımlanabilir HAKAN kullanıcısına bağlıyken bu kod hata verir.
*/
GRANT UNLIMITED TABLESPACE TO HAKAN;

/*SYSDBA BU KOMUT İLE hakan kullanıcısın connect yetkisini alabilir fakat hakan session ı sonlandırmadığı sürece çalışmaya devam edebilir.*/
REVOKE CONNECT FROM HAKAN

/*Bu şekilde kullanıcı silinebilir ancak içerisinde hakan kullanıcısı tablo oluşturmussa(nesnesi varsa) cascade eklemen lazım*/
DROP USER HAKAN
DROP USER HAKAN CASCADE

/*Bağlı oturumu devam eden kullanıcı silinemez*/

/*session ı kapatman gerekir bağlı kullanıcıdan discconnect diyip sekmesini de çarpıyla kapatman lazım*/

/*sysdba basitçe kullanıcı bu şekilde oluşturabilir.*/
CREATE USER HAKAN IDENTIFIED BY myPass;

/*SYSDBA gene hızlıca bu şekilde yetkilerini verebilir.*/
GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO HAKAN;