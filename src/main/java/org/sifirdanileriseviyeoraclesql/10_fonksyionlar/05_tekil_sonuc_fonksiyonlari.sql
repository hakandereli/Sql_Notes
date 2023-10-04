/*
    Sayısal veya karakter fonksiyonları geriye dönüş tiplerine göre isimlendirilmiştir.
    Tekil sonuç fonksiyonları ise geri dönüş tipi parametre geçilen değerlere göre değişibeilir.

    NVL,NVL2,NULLIF,
    GREATEST, LEAST
    DECODE, CASE
    UID,USER,SYS_CONTEXT

*/
/*********NVL(Null Value demek)**********/
--NVL(A,B) :A BOŞSSA B Yİ DÖNER A BOŞ DEĞİLSE A DÖNER
/*A VE B NİN TİPİ AYNI OLMALIDIR YOKSA HATA VERİR, NUMBER ALANI KONTROL EDİYORSAN NUMBER DÖNMEN LAZIM
STRİNG DENİYORSAN STRİNG DÖNERSİN*/
/*KOLONDAKİ BOŞ DEĞERLER YERİNE ÖRNEĞİN 0 BASMAK İÇİN KULLANILIR.*/
SELECT
    FIRST_NAME,
    COMMISSION_PCT,
    NVL(COMMISSION_PCT, 0)
--    NVL(COMMISSION_PCT, 'BOŞ') HATA VERİR
 FROM EMPLOYEES;

/*********NVL2**********/
--3 PARAMETRE ALIR: NVL2(P1,P2,P3) P1 BOŞSA P3 DÖNER DEĞİLSE P2 DÖNER
SELECT FIRST_NAME, SALARY, COMMISSION_PCT,
NVL2(COMMISSION_PCT, SALARY * (1 + COMMISSION_PCT) , SALARY)
FROM EMPLOYEES;
--YUKARIDAKİ ÖRNEK PERSONELİN KOMİSYON ORANI BOŞSA DİREK MAAŞINI DÖN, KOMİSYON BOŞ DEĞİLSE MAAŞINA KOMİSYON HESAPLAYARAK DÖN

/*********NULLIF**********/
--NULLIF(A,B): 2 PARAMETRE ALIR İLK PARAMETRE İKİNCİYE EŞİTSE NULL DÖNER, EŞİT DEĞİLSE P2 DÖNER
SELECT FIRST_NAME, SALARY, COMMISSION_PCT,
NULLIF(SALARY, SALARY - NVL(COMMISSION_PCT , 0))
FROM EMPLOYEES;

/*********GREATEST, LEAST**********/
--GREATEST aldığı parametrelerden en büyüğü döner. STRİNG OLARAK DA ALFABEDEKİ EN SONUNCU OLAN DÖNER LEAST İSE TAM TERSİDİR.
SELECT
    GREATEST(1,2,3,-2,-550,100,5,3,7),
    GREATEST('Hakan','Ahmet','Z','zEYNEP'),
    LEAST(1,2,3,-2,-550,100,5,3,7),
    LEAST('Hakan','Ahmet','Z','zEYNEP')
FROM DUAL;
/*100, Z, -550 , Ahmet*/

/**********DECODE*************/
/*excel deki if mantığına benzer*/
/*Aşağıdaki örnekte join kullanmadan department adlarını kendimiz yazalım*/
/*10 sa bu 20 ise bu uymazsa ise de null döner hiç biri değilse diğer yazarsın excel deki if in aynı mantığı*/
SELECT LAST_NAME, DEPARTMENT_ID,
DECODE(DEPARTMENT_ID, 10, 'Muhasebe',20,'Araştırma',30,'Satış','Diğer')
FROM EMPLOYEES
ORDER BY 2;

/**********CASE*************/
/*SWİTCH CASE MANTIĞI GİBİ BU DA*/
SELECT LAST_NAME, DEPARTMENT_ID,
    CASE DEPARTMENT_ID
    WHEN 10 THEN 'Muhasabe'
    WHEN 20 THEN 'Araştırma'
    WHEN 30 THEN 'Satış'
    ELSE 'DİĞER'
    END AS DEPARTMENT
FROM EMPLOYEES;

/*********UID VE USER*****/
/*UID User Identifier demektir oracle db de her user için bir id oluşturulur*/
/*hangi kullanıcı ile bağlandıysan onu verir aşağıda örneğin 25 HAKAN yazar*/
--UID VE USER FONKSİYONLARI PARAMETRESİZ FONKSİYONLARDIR
/*sys 0 ve system 1 dir*/
SELECT UID,USER FROM DUAL;

--BAĞLI OLDUĞUMUZ KULLANICIYI SORGULARIZ BÖYLE
SHOW USER;

/*********SYS_CONTEXT*****/
/*Bağlı kullanıcıyla ilgili bilgiler elde etmek için kullanılır
kullanıcı adı, dba yetkisi var mı ,
hangi makine üzerinden bağlanıyor, kaç instance li kurulmuş biz tek instance i kurduk 1 verir,
bağlandığımız ip,
bağlandımız db nin adı
gibi sorgulayabilirsin.
*/
SELECT
    SYS_CONTEXT('USERENV','SESSION_USER') AS USERNAME,
    SYS_CONTEXT('USERENV','ISDBA') AS ISDBA,
    SYS_CONTEXT('USERENV','HOST') AS HOST,
    SYS_CONTEXT('USERENV','INSTANCE') AS INSTANCE,
    SYS_CONTEXT('USERENV','IP_ADRESS') AS IP,
    SYS_CONTEXT('USERENV','DB_NAME') AS DBNAME
FROM DUAL;

/*
    SYS_CONTEXT, UID, USER VS VERİTABANINDA YAPILAN İŞLEMLERİN LOGLANMASI İÇİN KULLANILAN METHODLARDIR TABİ FARKLI YÖNTEMLERİDE VAR
    DBA YAPAR ZATEN BURALARI
*/

/*
Oracle veritabanında yapılan işlemler, genellikle "log" olarak adlandırılan çeşitli günlük dosyalarına kaydedilir.
Bu günlükler, veritabanının izlenmesi, sorunların teşhis edilmesi ve geri dönüş noktalarının oluşturulması gibi çeşitli
amaçlar için kullanılır. İşte Oracle veritabanında yapılan işlemlerin nasıl loglandığına dair temel bilgiler:

Redo Log Files (Yineleme Günlüğü Dosyaları):

Redo log dosyaları, veritabanı işlemlerinin kaydedildiği temel günlüklerdir. Bu dosyalar, her işlem veya değişiklik
 öncesi ve sonrası durumu kaydeden bilgileri içerir.
Redo log dosyaları, ACID (Atomik, Tutarlı, İzole, Dayanıklı) özelliklerini sağlamak için kullanılır.
Redo log dosyaları veritabanı tarafından otomatik olarak yönetilir ve döngüsel olarak kullanılır.

Archive Log Files (Arşiv Günlüğü Dosyaları):

Archive log dosyaları, redo log dosyalarının eski sürümlerinin saklandığı günlüklerdir. Bu dosyalar, geri
 dönüş noktalarının oluşturulması ve veritabanının kurtarılması için kullanılır.
Veritabanı yöneticisi tarafından düzenli olarak arşiv günlüğü alma işlemi yapılarak bu dosyalar oluşturulur.
Audit Trails (Denetim İzleri):

Oracle veritabanı, denetim izleri adı verilen günlükler aracılığıyla kullanıcı etkinliklerini izler
. Bu izler, kimin ne tür işlemler gerçekleştirdiğini kaydeder.
Denetim izleri, güvenlik gereksinimlerini karşılamak ve yetkilendirilmemiş erişimleri izlemek için kullanılır.
Trace Dosyaları:

Oracle veritabanı, performans sorunlarını teşhis etmek ve çözmek için trace dosyalarını kullanır.
Bu dosyalar, SQL sorgularının ve veritabanı işlemlerinin ayrıntılı izlemesini sağlar.
Trace dosyaları, özellikle veritabanı performansı sorunlarına odaklanan veritabanı yöneticileri veya geliştiriciler
 tarafından kullanılır.
Oracle veritabanında loglama işlemleri, veritabanı yöneticisi tarafından yapılandırılabilir ve izlenebilir.
 Logların türleri, seviyeleri ve saklama süreleri yönetici tarafından belirlenebilir. Bu loglar, veritabanı güvenliğini
  ve bütünlüğünü sağlamak, performans sorunlarını teşhis etmek ve veritabanı yönetimi için önemli bir rol oynar.
*/
