/*Alt sorgular ana sorgudan önce çalışır.

  Alt sorgular sonucu ana sorguda (Table yerine, kolon yerine ve where içinde) kullanılabilir.
  */


  /*SYNTAX*/
--
-- SELECT COL1, (select col2 from table1) col2
--     From (select ... fro m table2) table 3
--     where col [IN][=][>][<] ... (select coln from ...)

-- 1-Kolon seviyesinde subquery örneği
-- 2-Table seviyesinde subquery örneği
-- 3-where condition içerisinde subquery örneği



--                                              1-Kolon seviyesinde subquery örneği
-- EMLPOYEE_ID | LAST_NAME   | DEPARTMENT_NAME

/*join kullanarak da yapabilirsin.*/
SELECT
    E.EMPLOYEE_ID,
    E.LAST_NAME
    FROM EMPLOYEES E
    JOIN DEPARTMENT D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
order by 1;

/*subquery ile kolonu çektik*/
SELECT
    E.EMPLOYEE_ID,
    E.LAST_NAME
    (SELECT DEPARTMENT_NAME FROM DEPARTMENTS D WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID) DEPT_NAME
FROM EMPLOYEES E
order by 1;

/*Burada yazdığın subquery den tek bir kayıt dönmelidir yoksa hata verir.*/

/*SUBQUERY LER JOIN LERE GÖRE DAHA YAVAŞTIR*/

/*ORACLE SQL developer sorguyu kaç saniye de çektiğini gösterir. İlk çalıştırdığında gerçek değeri alırsın ancak ikinci çalıştırdığında
  cache den vereceği için gerçek sonucu elde edemessin*/

--                                              2-Table seviyesinde subquery örneği

/*From dan sonra bir subquery çalıştırarak gelen sonuca bir tablo gibi davranırsın. ALİAS da verebilirsin*/
SELECT BOLGE_ISMI, ULKE_ADI FROM
             (
                SELECT
                R.REGION_ID BOLGE_NO,
                R.REGION_NAME BOLGE_ISMI,
                C.COUNTRY_ID ULKE_NO,
                C.COUNTRY_NAME ULKE_ADI
                FROM REGIONS R
                JOIN COUNTRIES C ON C.REGION_ID = R.REGIONS_ID;
            ) X
-- WHERE X.REGION_NAME = 'Europe';
                JOIN LOCATIONS L ON L.COUNTRY_ID = X.ULKE_NO;
/*KOLONLARA İÇERİDE VERDİĞİN ALİAS LAR İLE DIŞARIDA YAZDIKLARIN EŞİT OLMALIDIR.*/
/*sUB QUERY İLE BAŞKA BİR TABLOYU DA JOİNLEYEBİLİRSİN.*/

--                                              3-WHERE CONDITIONS İÇİNDE subquery örneği
/*DAVIES İSİMLİ KİŞİDEN SONRA İŞE GİRENLERİ LİSTELEYELİM.*/
SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'DAVIES';

SELECT LAST_NAME , TO_CHAR(HIRE_DATE, 'DD/MM/YYYY') TARIH FROM EMPLOYEES
WHERE HIRE_DATE > TO_DATE('29/01/2005', 'DD/MM/YYYY')

-- YUKARIDAKİ İKİ SORGU YERİNE BİR ALT QUERY EKLEYEREK DE YAPABİLİRİZ.

SELECT LAST_NAME , TO_CHAR(HIRE_DATE, 'DD/MM/YYYY') TARIH FROM EMPLOYEES
WHERE HIRE_DATE > (SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'DAVIES');

--     ÖNCE ALT SORGULAR ÇALIŞTIRILIR.
/*gene sorgudan tek sonuç dönmeli ki hata vermesin.*/
/*birden fazla sonuç için in kullanabilirsin.*/

-- 4 - unvanı taylor ile aynı olup taylor dan daha fazla maaş alanlarını listeleyelim.
/*SUBQUERY KULLANMADAN*/
SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    JOB_ID,
    SALARY
FROM EMPLOYEES
WHERE LAST_NAME = 'Taylor' AND EMLPOYEE_ID = 176;

SELECT LAST_NAME, JOB_ID , SALARY
FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP' AND SALARY > 8500;

/*İKİ ADIMDA YAZDIK ŞİMDİ SUBQUERY İLE YAZALIM*/

SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > (
                SELECT SALARY FROM EMPLOYEES
                  WHERE LAST_NAME = 'TAYLOR' AND EMPLOYEE_ID =176
                )
    AND JOB_ID =
        (
        SELECT JOB_ID FROM EMPLOYEES
        WHERE LAST_NAME = 'Taylor' AND EMPLOYEE_ID =176

        )
;


--5 EN DÜŞÜK MAAŞ ALAN KİŞİYİ BULALIM.
SELECT MIN(SALARY) FROM EMPLOYEES;
SELECT LAST_NAME , JOB_ID ,SALARY FROM EMPLOYEES WHERE SALARY = 2100;

/*SUBQUERY İLE YAZALIM*/


SELECT LAST_NAME , JOB_ID, SALARY,
       (
        SELECT DEPARTMENT_NAME FROM DEPARTMENTS D
       WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
       ) AS "Bölüm Adı"
FROM EMPLOYEES E
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);

--6 50 nolu bölümdeki en düşük maaştan daha yüksek maaş alan bolumlerdeki en düşük maaşı bölüm bazında listeleyelim.

/*Burada gövde sorugu ana sorgu en düşük maaşı bölüm bazında listelemek daha sonra devamını iç sorguları yazarsın.*/
SELECT
        DEPARTMENT_ID,
       MIN(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
-- HAVING MIN(SALARY)  > 2100;
HAVIN MIN(SALARY) > (SELECT MIN(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID =50);

SELECT MIN(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID =50;

-- MIN GİBİ GROUP FONKSİYONLARI WHERE CONDİTION İÇİNDE YAZILAMAZ
-- BUNUN İÇİN HAVING VARDIR


--7 UPDATE İÇİNDE SUBQUERY KULLANIMI

-- 60 NOLU BOLUMDE CALISANLARIN MAASLARINI 50 NOLU BOLUMDE CALINSANLARIN EN BÜYÜK MAAŞI İLE EŞİTLEYELİM
SELECT DEPARTMENT_ID , LAST_NAME, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = 60;

SELECT MAX(SALARY) FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

UPDATE EMPLOYEES
    SET SALARY = (
        SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT = 60
      )
    WHERE DEPARTMENT_ID = 60


--8 DELETE İÇERİSİNDE SUBQUERY KULLANIMI

-- SOYİSMİ (LAST_NAME) TEKRAR EDEN KAYITLARDAN SADECE BİR TANESİ KALSIN YANİ UNİQUE OLSUN
-- ORACLE DATABASE DE TUTULAN HER KAYDIN FİZİKSEL ADRESİ VARDIR BU DA ROWID ŞEKLİNDE BELİRTİLİR.
-- 10 BYTE VERİ TUTAR ROWID
-- ROW ID NORMAL SORGULAR DA SEN ÇAĞIRMADIĞIN SÜRECE GÖZÜKMEZ GİZLİDİR
-- İNDEX LERDE KAYDA ERİŞİM HIZINI ARTIRIR ANCAK BİR KAYDA ERİŞMENİN EN HIZLI YOLU ROWID SİNİ KULLANMAKTIR.
SELECT ROWID, LAST_NAME, SALARY FROM EMPLOYEES;

/*TEKRAR EDEN KAYITLARI SİLMEK İÇİN ÖNCELİKLE TEKRAR EDEN VERİLERİ TESPİT ETMEK GEREKİR TABLONUN BİR YEDEĞİNİ ALALIM*/

CREATE TABLE EMPLOYEES2 AS SELECT * FROM EMPLOYEES;
-- BU İFADE TABLONUN BİR KOPYASINI OLUŞTURUR VE İÇERİSİNDEKİ VERİLERİ DE KOPYALAR.
-- BUNU PARENT CHİLD İLİŞKİSİNİ TAKILMAMAK İÇİN YAPABİLİRSİN FK LARI KOPYALAMIYOR


SELECT LAST_NAME , COUNT(*) FROM EMPLOYEES2 GROUP BY LAST_NAME HAVING COUNT(*) > 1;

DELETE FROM EMPLOYEES2 WHERE ROWID NOT IN (
                                    SELECT MAX(ROWID) FROM EMPLOYEES GROUP BY LAST_NAME
                                 )
/*ROW ID Sİ EN BÜYÜK OLANINI BIRAKIR KALANINI SİLER.*/

/*FINISH*/