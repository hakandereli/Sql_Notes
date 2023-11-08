/*Bu örnekte veri tiplerinin aşırı yüklenmesi yani alabileceği eşikten daha düşük veya yüksek veriler girilecek*/

/*değişkenlere değerler declare kısmında tanımlandığı yerde atanabilir yada run time da begin kısmında atanabilir.
  eğer fonksiyon sa dışarıdan alabilir.*/
/*2147483647 PLS_INTEGER in max değeridir.*/

/*2147483648 olursa numeric overflow hatası verir.

toplama işlemini önce p1 + p2 önce toplar bunlardan uygun olan bir tip varsa örneğin p2 yi kullanarak eşitliğin karşısına atar.
  */

/*bu hata verir*/
DECLARE
    p1 PLS_INTEGER := 2147483647;
    p2 PLS_INTEGER := 1;

    n NUMBER;
BEGIN
--     p2 := 54;
    n := p1 + p2;

    DBMS_OUTPUT.PUT_LINE(n);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(n, '999,999,999,999.99'));
END;


/*Bu hata vermez pls i bir artırınca number tipi bu değeri taşıyabilir p2 yi karşıya atar.*/
DECLARE
    p1 PLS_INTEGER := 2147483647;
    p2 NUMBER := 1;

    n NUMBER;
BEGIN
--     p2 := 54;
    n := p1 + p2;

    DBMS_OUTPUT.PUT_LINE(n);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(n, '999,999,999,999.99'));
END;


    /*BİNARY İNTEGER PLS İLE AYNIDIR PLS DAHA GÜÇLÜDÜR.*/
    /*bu hata verir*/
DECLARE
    p1 BINARY_INTEGER := 2147483647;
    p2 BINARY_INTEGER := 1;

    n NUMBER;
BEGIN
--     p2 := 54;
    n := p1 + p2;

    DBMS_OUTPUT.PUT_LINE(n);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(n, '999,999,999,999.99'));
END;

/*Bu hata vermez  p1 i bir artırınca number tipi bu değeri taşıyabilir p2 yi karşıya atar.*/
DECLARE
    p1 BINARY_INTEGER := 2147483647;
    p2 NUMBER := 1;

    n NUMBER;
BEGIN
--     p2 := 54;
    n := p1 + p2;

    DBMS_OUTPUT.PUT_LINE(n);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(n, '999,999,999,999.99'));
END;

