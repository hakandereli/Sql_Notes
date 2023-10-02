/*
DCL komutları grant ve revoke dur

Yetki Türleri 2 ye ayrılır:
        1-Sistem Yetkileri(System privileges)
            1.1 Create
                1.1.1 Session
                1.1.2 User: kullanıcı oluşturma yetkisi
                1.1.3 Table : Tablo oluşturma yetkisi
                1.1.4 View
                1.1.5 Tablespace
                ....
        Bu tarz komutlar yani system yetkileri dba lerde dedir genelde genel kullanıcılar bu yetkiler verilmez.

            1.2 Connect [database]: Bağlanma yetkisi
            1.3 Alter
                1.3.1 Session
                1.3.2 User
                1.3.3 Table
                1.3.4 View
                1.3.5 Tablespace
                ...
            1.4 Drop
                1.4.1 User
                1.4.2 Table
                1.4.3 View
                1.4.4 TableSpace
                ...
            1.5 Backup & Restore Database: yedekleme ve geri dönme

System yetkilerini DBA yetkili kullanıcılar verebilir.

        2-Nesne Yetkileri(object privileges)
            2.1 Alter : tanımları değiştirme yetkisi
            2.2 Delete: Tablo daki kayıtları silme yetkisi
            2.3 Index : tablo üzerinde index oluşturma yetkisi
            2.4 Insert: Tabloya kayıt ekleme yetkisi
            2.5 References : referens verme yetkisi FK
            2.6 Select: Sorgulama yetkisi
            2.7 Update : tablodaki kayıtları güncelleme yetkisi

Nesme yetkilerini nesnenin sahibi veya yetkilendirilmiş kullanılacar verebilir.
Yetkiyi verirken WITH GRANT OPTION parametresi kullanılırsa örneğin verilen select yetkisini başkasına da verilen kişi verebilir.
*/


/*Yetki Verme*/
GRANT <Privs> ON <Object> TO <user>;
/*Yetki Alma*/
REVOKE <Privs> ON <Object> FROM <user>;

/*System yetkilerini verebilmek için SYS veya SYSTEM yani dba yetkili kullanıcılara bağlanmak ve komutları burada çalıştırmak gerekir.*/

/*Senaryo şu şekilde: Bir şema daki nesnelere, yeni bir kullanıcı oluşturup yetkileri verielcek ve daha sonra bu yetkiler geri alanacak*/
/*kULLANICI ADI VE ŞİFRESİ ABUZER olan bir user oluşturduk.*/
CREATE USER ABUZER IDENTIFIED BY ABUZER;
GRANT CONNECT, RESOURCE TO ABUZER; /*Bu yetki verilmesse kullanıcı session açamaz bağlanma ve kaynak kullanma yetkisidir.*/

/*Tabs sanal bir tablodur bir şemanın içerisinde hangi tablolar olduğu görmek için kullanılır aşağıdaki sorgu*/
SELECT TABLE_NAME FROM TABS;

/*ABUZER -> HAKAN şemasının objelerindeki regions ı sorgula eğer yetkisi yoksa bu tablo yok hatası vericek*/
SELECT * FROM HAKAN.REGIONS;

/*Yetkiyi HAKAN YADA DBA VEREBİLİR*/
GRANT SELECT ON REGIONS TO ABUZER;