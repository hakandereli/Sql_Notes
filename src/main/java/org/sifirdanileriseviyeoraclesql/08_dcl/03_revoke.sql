/*Yetkileri geri almak için revoke komutu kullanılır.*/


/*Transaction devam ederken revoke yapılamaz commit veya rollback ile transaction sonlandırılmalıdır.*/

/*Hangi Yetkiler kimlerde var hangi nesneler üzerinde var*/
SELECT * FROM USER_TAB_PRIVS_MADE;
/*Bu bir view dir kimlere , hangi tabloda, kim yetki vermiş, hangi yetkiyi vermiş, bu yetkileri deveredebilir mi? bunları görürsün*/
/*Görselini ekledim kontrol et*/

/*SELECT YETKİSİNİ ALDIN ADAMIN*/
REVOKE SELECT ON REGIONS FROM HAKAN;
REVOKE DELETE, UPDATE ON REGIONS FROM HAKAN;
REVOKE INSERT ON REGIONS FROM HAKAN;

/*
Veritabanına bağlanma yetkisi olan herkese select yetkisi vermek istiyorsan PUBLIC rolü vardır oracle da bu rolü kullanabilirsin.
Bu rol varsayılan tüm kullanıcalara tanımlıdır.
*/
GRANT SELECT ON REGIONS TO PUBLİC;
/*
Public e yetki vermek doğru bir işlem değildir. Kendi özel yarattığın rollere yetki vermek en mantıklısıdır.
*/