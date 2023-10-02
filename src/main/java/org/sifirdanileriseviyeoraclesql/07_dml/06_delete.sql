/*Bu şekilde yazarsan tüm kayıtları siler dikkatli ol*/
/*DML sorgusu olduğu için kalıcı olarak yazdırmak için commit lazım yoksa sadece o session ı bağlar bu sorgu*/
DELETE FROM EMPLOYEES_COPY;
commit;

/*Eğer commitlediysen yedek tablo tuttuysan oradan dönersin yada backup lardan dönersin.*/

/*Kopya tablosundan dönmek veya kolonları isimleri aynı tabloda verileri kopyalamak için aşağıdaki komutu kullanabilirsin*/
INSERT INTO EMPLOYEES_COPY SELECT * FROM EMPLOYEES;
/*Values yazmadan direk sorguyu yazdık.*/
commit;


DELETE FROM EMPLOYEES_COPY WHERE DEPARTMENT_ID = 90;
commit;


