/*Kodu tek satırda da yazabilirsin ; lere bakar sadece compiler.*/
/*Her komut ; ile biter önce değişken adı sonra tipi girilir*/
/*
plsql case sensitive değildir küçük büyük aynı algılar
Alışkanlık olarak değişkenler küçük harfle , anahtar kelimeler büyük harfle yazılır.
*/
/*CHAR tipi girilen boyut kadar yer ayır 15 doldursanda doldurmasan hafıza da yer açar
  ancak varchar2 15 dahi versen içine girilen kadar hafıza da yer ayırır.
  */
DECLARE
    wadi       CHAR(15);
    wsoyadi    VARCHAR2(15);
BEGIN
    wadi      := 'Hakan';
    wsoyadi   := 'Dereli';

    DBMS_OUTPUT.PUT_LINE('*' || wadi || '*');--bunun çıktısında aslında hakan dan sonra 15 e kadar boşluk vardır.
    DBMS_OUTPUT.PUT_LINE('*' || wsoyadi || '*');
END;

    /*Bu kod anonymous olduğu için db de saklanmaz sadece o session için geçerlidir.*/
