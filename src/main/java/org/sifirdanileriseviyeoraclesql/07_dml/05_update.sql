/*
Veritabanında değişiklik yapılan işlemler de insert, update , delete den sonra commit veya rollback
yazmalısın yoksa kalıcı hale getiremessin.

Update table_name
SET
    column1 = value1,
    column2 = value2,
    column3 = value3,
    ....
WHERE condition;

DELETE FROM table_name
WHERE condition;

TCL - Commit ve Rollback Syntax

Commit; öncesinde yazılan dml komutlarını kalıcı hale getirir değişiklikleri.

Rollback; yapılan değişikleri geçersiz hale getirir.

auto commit açıksa yazdıkların zaten otomatik commitlenir.

DDL(Create, Alter , Drop) komutları DML(insert, update, delete) komutlarını otomatik olarak commit eder.

Gene bu işlem oturum(session) kapatldığında otomatik commit edilir.
*/
DELETE FROM EMPLOYEES;
/*bU tablo da fk varsa silmez önce parent indeki kaydı silmen gerekir.*/

/*Tablonun kopyasını oluşturabilirsin bu şekilde. Bu komut indeksleri, fk ları vs kopyalamadan tablonun yapısını ve içindeki kayıtları kopyalar.*/
CREATE TABLE EMPLOYEES_COPY AS SELECT * FROM EMPLOYEES;

/*Yapısını göster.*/
DESC EMPLOYEES_COPY;

/*Update ve delete kullanılırken dikkatli olunmalı eğer where condition kullanmassan tüm verileri silebilir veya güncelleyebilirsin.*/

/*employee id si 100 olan patron dur patron hariç tüm çalışanlara yüzde 20 zam yapalım ve komisyonlarını yüzde 25 yapalım*/
/*farklı demeek için <> veya != kullanabiliriz.*/

/*Veritabanında bir kullanıcı birden fazla session açabilir açtığın sesssion üzerinde yaptığın değişiklikler db yi değişitriyorsa
commit etmen gerekiyor yoksa aynı kullanıcı bir farklı bir session üzerinde kayıtları farklı görebilir
kalıcı hale getirmek için commit i kullanman gerekir.
*/
UPDATE EMPLOYEES_COPY SET
    SALARY = SALARY * 1.20 ,
     COMMISSION_PCT = 0.25
WHERE EMPLOYEE_ID <> 100;

COMMIT;

/*SQL PLUS DA EKRANDAKİ KOMUTLARI TEMİZLE DEMEK*/
CLEAR SCR;

/*101 VE 102 SİCİL NUMARALI ÇALIŞANLARIN MAAŞLARINI 400 DOLAR DÜŞÜRÜP KOMISYON ORANLARINI SIFIRLAYALIM*/
UPDATE EMPLOYEES_COPY SET
    SALARY = SALARY - 400,
     COMMISSION_PCT = NULL
WHERE EMPLOYEES_ID = 101 OR EMPLOYEE_ID = 102;

COMMIT;

/*Eğer where condition yazmadan çalıştırdın ve hata yaptığını anladın commitlemedin rollback; yazarak geri alabilirsin.
yaptığın işlem zaten sadece senin session ında geçerli şuan sadece
*/
UPDATE EMPLOYEES_COPY SET
    SALARY = SALARY - 400,
     COMMISSION_PCT = NULL;

ROLLBACK;

/*ALTER , CREATE, DROP KOMUTLARI HANGİ TABLODA OLDUĞU ÖNEMSENMEKSİZİN COMMMİT İŞLEMİNİ OTOMATİK YAPAR SESSION ÜZERİNDEN DB YE*/

/*Çalışanlara zam yapmak için bir tabloya kopyaladın tabloyu ve burada yüzde 20 zam yaptın hepsine ancak daha sonra vazgeçtin
Bu tabloya zamsız olan maaşları geri getirmek istiyorsun bir tablonda zamlı değerler var diğerinde zamsız.

Bir iç sorgu yazarak bunu çözersin.
*/
UPDATE EMPLOYEES_COPY A SET
A.SALARY = (SELECT B.SALARY FROM EMPLOYEES B WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID)

/*BU ŞEKİLDE HEPSİNİ YAPARSIN VEYA DIŞTAKİ SORGUNA WHERE EKLEYEREK ATIYORUM 100 NOLU DEPARTMANDA ÇALIŞANLARA
ZAM YAPMAKTAN VAZGEÇTİM DE DİYEBİLİRSİN.*/
UPDATE EMPLOYEES_COPY A SET
A.SALARY = (SELECT B.SALARY FROM EMPLOYEES B WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID)
WHERE A.DEPARTMENT_ID = 100;

/*BİRDEN FAZLA TABLO DA İŞLEM YAPARKEN ALİAS VERMEYİ UNUTMA*/

/*
BİR DEĞİŞİKLİK YAPTIN DML İLE İLGİLİ AMA DAHA COMMİTLEMEDİN ESKİ HALİNİ ROLLBACK YAPMADAN FARKLI BİR
SESSİON AÇARAK GÖREBİLİRSİN COMMİTLEMEYEN SORGULAR DB YE KALICI OLARAK KAYDEDİLMEZ SADECE O SESSİON I BAĞLAR.*/

commit;