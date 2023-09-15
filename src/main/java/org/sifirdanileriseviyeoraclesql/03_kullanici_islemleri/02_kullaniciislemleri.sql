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

/*buraya kadar bağlanabilir ama tablespace üzerindeki yetkileri tanımlanmadığı için her hangi bir obje oluşturamaz.*/