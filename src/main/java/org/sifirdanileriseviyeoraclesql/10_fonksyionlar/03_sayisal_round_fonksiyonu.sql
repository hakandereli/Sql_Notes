/*
Round sayıları yuvalama fonksiyonudur.

2 parametre alır : yuvalanacak sayı, kaç hane yuvalanacak.
örneğin , 0 virgülden sonraki ilk basamak , 1 virgülden sonra ki 2 inci basamak.
Negatif yönde de -1 yazarken virgülden önceki ilk basamak

default zaten sıfırdı
*/

select round(1234.5678, 0), round(1234.5678)
round(1234.5678 , 1), round(1234.5678,2)
round(1234.5678 , -1), round(1234.5678,-2)
from dual;
/*
Çıktı

1235, 1235, 1234,6,1234.57, 1230, 1200
*/

/*ÇIKTISI VAR*/
SELECT LEVEL - 1, ROUND(1234.5678 , LEVEL -1)
 FROM DUAL CONNECT BY LEVEL < 6;


/*ÖRNEK 2 GÖRSELİ VAR
BURADAKİ || VEYA CONCAT STRİNG BİRLEŞTİRME CONCATANATION DİR , STRİNG E ÇEVİRMEK İÇİNSE TO_CHAR KULLANILIR.
*/
SELECT LEVEL - 1, 'ROUND(1234.5678 ,'|| TO_CHAR(LEVEL -1)||')'),
ROUND(1234.5678, LEVEL -1)
 FROM DUAL CONNECT BY LEVEL < 6;
