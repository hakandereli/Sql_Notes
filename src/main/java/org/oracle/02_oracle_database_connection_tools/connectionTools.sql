/*
    Oracle Database Connection Tools
        En Çok Kullanılanlar:
            *Toad (Ücretli - grafiksel arayüzü var)
            *PL/SQL Developer (Ücretli - grafiksel arayüzü var)
            *SqlCl (indirilebilir - komut satırı)
            *Sqlplus (otomatik yükler - komut satırı)
            *SQL Developer (indirilebilir - grafiksel arayüzü var)


            komut satırını açıp sqlplus / as sysdba dersen sqlplus yüklü geliyor zaten açar.
            Burada oturum istemez zaten windows daki kullanıcıyı kullanıyor.(operation system authentication)
            SQL> şeklinde değişir komut satırı

            SHOW USER diyerek bağlı kullanıcıyı görebilirsin. USER is "SYS" yazar.

            exit ile çıkar.

           sqlplus SYS/mypassword as sysdba ve sqlplus SYSTEM/mypassword as sysdba yazarak verdiğin şifre ile bağlanabilirsin.
*/
sqlplus / as sysdba
sqlplus SYS/mypassword as sysdba
sqlplus SYSTEM/mypassword as sysdba
SHOW USER
exit

/*veritabanın ismini sorgulama. Buradaki v$database bir view dir.*/
select name from v$database;

/*veritabanın global name ini sorgula  test.hakandereli.com gibi girdiğin kısım dır bu SID yi de tanımladığın da ekranda verirsin.*/
select GLOBAL_NAME FROM GLOBAL_NAME;

/*grafiksel arayüz için oracle sql developer indirebilirsin. Bu çalışabilmek için JDK ister*/

/*
sql developer indirdikten sonra açarsın direk exe dosyasından tıklayarak çalıştırırsın.

bağlandı eklemek için sol üstten yeşil artıya tıklarsın.

bağlantı ismi olarak isimlendirme VERİTABANIADI_KULLANICIADI şeklinde genel olarak. şirketlerin kendi isimlendirmeleri olabilir.

Örneğin: TEST_SYS

kullanıcı adı şifreni girersin bağlantı da roller vardır SYS ve SYSTEM ile bağlanmak için ROLE SYSDBA seçilmelidir.

Connection Type ler vardır.
Basic, Cloud Waller , Custom JDBC, Local/Bequeath, LDAP, SSH, TNS vs. basic seçicez.

hostname: veritabanımızın kurulu olduğu makinin adı veya ip sidir. local deki için localhost yazılabilir.

port:1521

SID tanımladığın TEST örneğin veya ServiceName TEST.hakandereli.com gibi vermiştik.

bu veriler aslında listener in yani controller in verileri gibi düşün.

save ile kaydedersin. sağ tık properties ile de tanımladığın listener verilerine erişebilirsin.

veritabanına bağlanmada problem olursa service lere bakmak gerekir windows için services a girdiğin de oracle ile başlayan
service ler running durumunda olmalıdır yoksa veritabanı servisleri çalışmıyor demektir.

durdurma işleme buradan yapılır listener test açıp kapayan servisler çalışır burada.
*/