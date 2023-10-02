/*Roller toplu verilir. Rolleri dba verir bir kullanıcı daha ekleyelim.*/
/*Roller obje yetkilerini vermek için tanımlanır daha çok*/
CREATE USER BILGE IDENTIFIED BY BILGE;

GRANT CONNECT , RESOURCE TO BILGE;

/*SELECT VE UPDATE İÇİN BİR ROL OLUŞTURALIM. ROLE create etme yetkisi dba tarafından verilir.*/
GRANT CREATE ROLE TO MEHMET;
CREATE ROLE R_SELUPT;
CREATE ROLE R_INSDEL

GRANT SELECT,UPDATE ON REGIONS TO R_SELUPT;
GRANT INSERT,DELETE ON REGIONS TO R_INSDEL;

/*Rol tanımlama*/
GRANT R_SELUPT TO BILGE;
GRANT R_INSDEL TO CELEBI;

/*
Kullanıcılar kendine atanan rolleri kullanabilmesi için session larında rollerini set etmeleri gerekir.
*/
SET ROLE R_INSDEL;
INSERT INTO MEHMET.REGIONS VALUES(7,'ABC');
commit;

SET ROLE R_SELUPT;
SELECT * FROM MEHMET.REGIONS;

UPDATE MEHMET.REGIONS SET
REGION = 'XYZ'
WHERE REGION_ID = 7;
commit;

/*Rollere yetki vermenin bir avantajı da bir role verdiğin yetkiyi kaldırdığında bu role sahip tüm kullanıcılardan
o yetkiyi almış olursun.*/
REVOKE UPDATE ON REGIONS FROM R_SELUPT;
/*Güncelleme yetkisini aldık bu rol den dolayısıyla bu role sahip tüm kullanıcılardan.*/

/*CELEBI DEN BU ROLÜ ALDIK*/
REVOKE R_INSDEL FROM CELEBI;

/*ROLE Ü KİM OLUŞTURDUYSA O VEYA SYS KALDIRABİLİR.*/
DROP ROLE R_INSDEL;