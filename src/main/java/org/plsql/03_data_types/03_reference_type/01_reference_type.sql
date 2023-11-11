/*Reference Veri tipleri ile geliştirilen uygulamalarda bakım onarım maliyetleri düşüktür

  2 tip vardır
  1- %TYPE
  2- %ROWTYPE

**********************************************1 - %TYPE ***************************************
Senaryo : department tablosundan , department_id si 10 olan kaydı ekrana listeleyelim.

  PLSQL İÇERİSİNDE Kİ SELECT LER İNTO YAPILMAKTADIR. Değeri direk alamassında bir değişken üzerinden alırsın.

*/

-- (STATİK VERİ TİPİ)
--Klasik yöntem referans tip kullanılmadan yapılan yöntem.
/*eğer department tablosunda ileride atıyorum department name 30 a sığmadı 40 yapman lazım diğelim hem tabloyu güncelliycen
  hem aşağıdaki plsql yapısını güncellemen lazım ama referans tip kullanırsan tabloyu güncellemen yeterli.
  NUMBER VERİYİ VARCHAR2 DE YAPABİLİR TİPİNİ DE DEĞİŞTİREBİLİR YANİ
  */

DECLARE
    WDEPARTMENT_ID      NUMBER(4);
    WDEPARTMENT_NA      VARCHAR2(30);
    WMANAGER_ID         NUMBER(6);
    WLOCATION_ID        NUMBER(4);
BEGIN
    SELECT * INTO WDEPARTMENT_ID, WDEPARTMENT_NAME, WMANAGER_ID, WLOCATION_ID
    FROM HR.DEPARTMENTS
    WHERE DEPARTMENT_ID = 10;

    DBMS_OUTPUT.PUT_LINE(WDEPARTMENT_ID || ' ' || WDEPARTMENT_NAME || ' ' || WMANAGER_ID || ' ' || WLOCATION_ID);
END;

--Referans tip yöntemi (DİNAMİK VERİ TİPİ)
DECLARE
--     WDEPARTMENT_ID NUMBER(4);
--     WDEPARTMENT_NAME VARCHAR2(30);
--     WMANAGER_ID NUMBER(6);
--     WLOCATION_ID NUMBER(4);

    WDEPARTMENT_ID      HR.DEPARTMENTS.DEPARTMENT_ID%TYPE;
    WDEPARTMENT_NAME    HR.DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    WMANAGER_ID         HR.DEPARTMENTS.MANAGER_ID%TYPE;
    WLOCATION_ID        HR.DEPARTMENTS.LOCATION_ID%TYPE;
BEGIN
    SELECT * INTO WDEPARTMENT_ID, WDEPARTMENT_NAME, WMANAGER_ID, WLOCATION_ID
    FROM HR.DEPARTMENTS
    WHERE DEPARTMENT_ID = 10;

    DBMS_OUTPUT.PUT_LINE(WDEPARTMENT_ID || ' ' || WDEPARTMENT_NAME || ' ' || WMANAGER_ID || ' ' || WLOCATION_ID);
END;

--**********************************************2 - %ROWTYPE ***************************************
/* %TYPE TABLOLARIN VEYA VİEW LARIN KOLONLARI İÇİN %ROWTYPE İSE TABLE VEYA VİEW LAR İÇİN KULLANILRI.

    %ROWTYPE KISALTIR KODU ASLINDA TABLONIN KOLONLARINDA DEĞİŞİKLİK OLURSA HATA YA SEBEP OLABİLİR.
    REFERENAS TİPLER KLASİK TÜRLERE GÖRE DAHA YAVAŞ ÇALIŞIR ANCAK BAKIM VE HATA AÇISINDAN DAHA KULLANIŞLIDIR.
    EĞER PERFORMANS ÇOK ÖNEMLİYSE STATİK YÖNTEM TERCİH EDİLEBİLİR.
    */
DECLARE

    r_dept          HR.DEPARTMENTS%ROWTYPE;
BEGIN

    SELECT * INTO r_dept FROM HR.DEPARTMENTS WHERE DEPARTMENT_ID = 20;
    DBMS_OUTPUT.PUT_LINE(r_dept.DEPARTMENT_ID || ' ' || r_dept.DEPARTMENT_NAME || ' ' || r_dept.MANAGER_ID || ' ' || r_dept.LOCATION_ID);
END;