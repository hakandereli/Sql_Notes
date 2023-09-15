/*
 Create User

 Bir kullanıcının db ye erişilmesi için oturum açılmalıdır. Bir kullanıcı hesabını bir den fazla kişi de kullanabilir.
 Bir grup oluşturup gruplarada yetki vs ataması yapılabilir.

 İlgili sysntax i görsellerde mevcut

 tablespace sanal bir nesnedir. Tablespace ile kullanıcının yapabileceği işlemleri belirleyebiliriz.
 quota ile belirtilen limitler sınırlar tanımlanabilir.
 profiller tanımlanabilir.
 Şifresini süreli tanımlaybilirsin.(expire ile tanımlarsan ilk bağlandığında şifresini değiştirmesini ister)
 account ile lock veya unlock yapılabilir. lock lanan kullanıcı bağlanamaz.

*/
/*
hakan kullanıcı ve myPass şifresi ile bir kullanıcı oluştur.
bu kullanıcı users tablespace in de oluştursun objelerini

10m obje yaratabilir yada data store edebilir. limitsiz dersen sınır yoktur.
quota unlimited | 10M on users
| işareti veya demektir. users tablespace inde

temporary geçici tablespace i TEMP olsun

password expire ilk bağlandığında şifresini değiştirmesi gerekir.

account LOCK | UNLOCK
*/
create user HAKAN identified by myPass
default tablespace users
quota unlimited on users
temporary tablespace TEMP
account unlock


/*
 Grant Privileges To User
 Granting

 yetki vermek için <> içerisine yetkisi to dan sonra kullanıcı yazılır.
 grant <privs> to user;
 örn: connect bağlanma yetkisidir.
 */
grant connect to HAKAN;


/*
 Revoke Privileges From User

 yetkiyi almak için revoke sonra hangi yetki alınacak from hangi kullanıcıdan alınacak
 revoke <privs> from user
*/
revoke connect from HAKAN;


/*
 Drop User

  Veritabanından bu kullanıcı silmek için kullanılır.
  Sileceğimiz kullanıcının şemasında objeleri varsa cascade kullanmanız gerekir.
  Drop User <USERNAME>[CASCADE]
*/
drop user HAKAN cascade;

/*
    Bu işlemleri dba ler yapabilir sıradan kullanıcılara bu yetkiler verilmez.
*/

/*
    Oracle içerisinde çalıştırabilir objeler ora19c\bin altında yer alır.
    sqlplus.exe ye shotcut oluşturabilirsin.
*/




