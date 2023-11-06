-- exception isteğe bağlıdır run time daki hataları yakalamak için yazılan bloklardır

-- Hata Türleri
--     1- Compile Error - derleme esnasında
--     2- Run time error - çalışma esnasında

-- compile error zaten yazarken seni uyarıyor yada derlerken hata verecek çalışmayacaktır
--     ama her hata derlenirken olacak diye bir şey yok programın akışı sırasında patlayacak kodların varsa bunları exception
--     ile yaklaman gerekir yoksa program kontrolsüz sonlanır interrup denir buna

CREATE OR REPLACE FUNCTION BOLME (A IN NUMBER , B IN NUMBER) RETURN NUMBER
IS
C NUMBER;
BEGIN
    C := A/B;
    RETURN (C);
END;

--hata vermez 2.5 çıktı verir.
SELECT BOLME(5,2) FROM DUAL;

--hata verir 0 a bölme hatası interrup olur kesilir eğer exception ifadesini yazmassanç
DECLARE
    D NUMBER;
BEGIN
    D := BOLME(10,0);
    DBMS_OUTPUT.PUT_LINE(D);
        -- pek çok hazır exception vardır ZERO_DIVIDE sadece bir tanesi
        --SQLERRM - SQL ERROR MESSAGE DEMEKTİR ORA-01476: Divisor is equal to zero gibi
    EXCEPTION WHEN ZERO_DIVIDE THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;