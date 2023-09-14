/*
ORACLE 19C
Her hangi bir bilgisayara oracle db kurabilmek için:
    1. Minimum 2gb ram olmalı bu da yüzde 40 olmalı. Bilgisayar da en az 5 gb ram olmalıdır.
     1.1 100 gb ramin varsa 40 gb varsayılan oracle db ye ayrılır.
    2. 10gb hard disk olmalı en az.
    3. Intel EM64T veya AMD64 üzeri işlemci mimarisi olmalıdır.
    4. Ekran kartının çözünürlüğü 1024*768 pixel olmalı en az.
*/
/*
Bilgisayar ve Kullanıcı ismi kısıtları:
    1. Bilgisayar İsmin de ve Kullanıcı İsminde Boşluk veya Türkçe karakter olamaz.
    2. Kurulum ve kullanımda işlem yapacak Kullanıcı local administrator grubunda olmalıdır.

hostname: komutu ile bilgisayar ismi kontrol edilebilir.
whoami: komutu windows a bağlandığın kullanıcın ismini öğrenebilirsin.
net localgroup Administrators: administrator local group un daki kullanıcıları gösterir.
*/
/*
    Oracle 19c indirmek için:
    edelivery(teslimat demek)
    edelivery oracle şeklinde aratıp siteye register olman gerekir ancak ücretli değil.
    https://edelivery.oracle.com/osdc/faces/SoftwareDelivery bu adresten işletim ve oracle sürümü seçerek indiriebilirsin.
    DLP:		Oracle Database 19c 19.3.0.0.0 ( Oracle Database In-Memory, Oracle Database Vault )
    view items sepetine ekler buradan sadece veritabanını indir gerikalanını değil.
    işletim sistemini de seç indir 64 bittir 32 bit versiyonu yok
    sözleşmeyi kabul edip indir dediğinde yükleyiciyi indirir.
    c/ora19c şeklinde home directory oluştur. bu klasöre indir.
    bilgisayar da işletim sisteminin kurulu olduğu diske normalde db yüklenmez D veya E gibi diğer disklere yüklenir ki
    sistem çökerse db yi kaybetmeyelim. Bu local için böyle prod da genelde db için ayrı makine olur yedekli vs bir dünya
    işi var.
 */
/*

    setup yönetici olarak kurulmalı.

    Setup Software only ile kurulur
    DBCA database management confugiration asistant ile ayarları yapılır.

    database owner user windows built in account ile windows taki kullanıcı owner olur.

    c:\app\kullanıcıAdı altına kurar. Burası oracle base dir.

    aslında bu kurulum işlemi değil setup ile dosyaları yüklemiş olursun oracle base e.


    2. aşamada dbca ile kurulum ve konfigürasyon işlemleri yapılır.

    komut sistemini admin olarak açıp dbca yazdığında asistanı açar.

    sistemi yormak istemiyorsan sadece deneme yapacaksan testcontainers üzerinden docker ile oracle-xe kurabilirsin.

    https://testcontainers.com/modules/oracle-xe/

    tüm db araçlarını vs hepsi kurulabiliyor bu siteden docker ile.

    dbca yı açtıktan sonra eğer sürekli aynı kurulumları yapıyorsan farklı müşterilerine burada template oluşturup bunu kullanabilirsin.

    template in yoksa yeni diyip devam edersin.

    {ORACLE_BASE} ile belirtilir base

    global data base name ve SID vardır.
    global : dış dünyadaki ismi
    SID: system identfier yerel deki ismidir.
    örnek global : TEST.hakandereli.com
    SID globalin ilk kısmı ile aynı başlar.

    File system de tut diyip aşağıdaki dizinde saklar.
    {ORACLE_BASE}\oradata\{DB_UNIQUE_NAME}

    recovery için şurada saklar seçersen: {ORACLE_BASE}\fast_recovery_area\{DB_UNIQUE_NAME}

    veritabanına dışarıdan gelen bağlantı isteklerini dinler bunu bir listener ile yapar.
    Bir listener yani controller gibi yaratırsın. bu kullanıcı adı şifre kısıtlar sağlanıyorsa istekleri iletir db ye.

    listener tanımlarsın ve varsayılan 1521 dir port oracle istersen değiştirebilirsin.
    c:\ora19c ye açar bunu kurulum dosyalarını açtığın yere

    Oracle ram in ne kadarı nı kullansın seçersin varsayılan yüzde 40 dır bu da.

    Sizing sekmesinde process vardır bu veritabanında aynı anda kaç işlem yapılacağı vardır.
    varsayılan process 640 dır.

    chracter setten türkis 8859-9 olanı seçersin.

    daha sonra sample schemas da hr ile ilgili örnek bir şema ve 4-5 tablo vardır bunları istersen ekleyebilirsin.

    EM: enterprise manager vardır bu bir tarayıcı üzerinden görülemeyi sağlar varsayılan portu 5500

     User Credentials: kullanıcı yetkilendirme

     Oracle veritabanı içerisinde iki tane DBA yetkili süper user gelir SYS ve SYSTEM şeklinde bunların şifresini belirlersin.

    template veya script olarak konfigürasyonları saklamak ister misin diye sorar.

    veritabanı kuruldu.

*/