-- içinde bulunduğumuz günün ismini yazan bir program (named block ile yaz.)
-- named block olarak yazabilmek için stored procedure veya function yazman lazım ileride bunlar anlatıcak şuan yaz geç sadece

CREATE OR REPLACE FUNCTION GET_DAY_NAME(P_TARIH DATE) RETURN VARCHAR2
IS

BEGIN
    RETURN(TO_CHAR(P_TARIH, 'DAY'));
END;

-- plsql fonksiyon ve procedure çalıştırabilmek için
--     select, update dml komutları kullanılır yada unnamed bloklar kullanılır.

SELECT GET_DAY_NAME(SYSDATE) FROM DUAL;


DECLARE
    WGUN VARCHAR2(50);
BEGIN
    WGUN := GET_DAY_NAME(SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Bu gün ' || WGUN);
END;

-- unnamed olanlar veritabanında saklanmıyor unutma session ı kapattığında kaybolur bu yapı session i kapatmadıysan
--     oluşturduğun unnamed fonksiyonu kullanabilirsin ancak session kapatılıp tekrar açıldığında kayblolur.

--     stored procedure ve functionlar böyle değil şema üzerinden Functions a çift tıklarsan veritabanını eklediğin ve saklanan
--     procedure ve function ları görebilirsin.