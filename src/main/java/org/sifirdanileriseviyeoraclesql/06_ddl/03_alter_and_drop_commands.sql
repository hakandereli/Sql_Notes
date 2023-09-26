/*Drop un farklı kullanımları vardır örneğin constrainleri silmek gibi, kullanıcı silmek gibi*/

/*CONSTRAINT İN ADI VE HANGİ TABLO DA TANIMLI OLDUĞU LAZIM SADECE*/
ALTER TABLE DEPARTMENTS DROP CONSTRAINT DEPT_MGR_ID;

/*Tablo yu silmek için bunu kullanırsın ancak bu tabloyu reference eden child lar varsa bu komut hata verir.*/
DROP TABLE REGIONS;

/*Bu ŞEKİLDE YAZARSA REFERE EDEN CHILD TABLOLARDAKİ FK LARI SİLER
ve Regions tablosunu siler daha sonra.
Eklediğin fk ların hepsi uçar buna bağlı olan dikkatli ol çalıştırırken.
Hibernate daha sonra ekler belki ama hibernate fk yi oluşturmadan kayıt girmeye çalışan olursa
veri bozulur tutarsızlaşabilir.
*/
DROP TABLE REGIONS CASCADE CONSTRAINTS;


/*İlişkileri silmeden önce görüntülemek istersen eğer table name e silmek istediğin parent tablonun ismini yazman yeterli*/
SELECT
    a.table_name AS child_table,
    a.column_name AS child_column,
    a.constraint_name AS constraint_name,
    c.table_name AS parent_table
FROM
    user_cons_columns a
JOIN
    user_constraints b
ON
    a.constraint_name = b.constraint_name
JOIN
    user_constraints c
ON
    b.r_constraint_name = c.constraint_name
WHERE
    b.constraint_type = 'R'
AND
    c.table_name = 'JOBS';


/********************/
DROP TABLE COUNTRIES CASCADE CONSTRAINTS;

/*Kullanıcı silme : dikkat bu işlem kullanıcı sildiği için kullanıcının oluşturduğu tüm nesneleri(tablo,constraitnt vs...)
bunlarıda siler.

kullanıcı silme işlemi yetki gerektirir. SYS veya SYSTEM ile bağlanarak kullanıcı silinebilir.

SYS de dahil olsan kullanıcı eğer conn olduysa onu silemessin bağlantısını disconnect ile koparması gerekir.
*/
DROP USER HAKAN;

/*CASCADE demessen nesnelerini kalır db de*/
DROP USER HAKAN CASCADE;































