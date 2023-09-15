/*Function ları görmek için*/
SELECT text
FROM all_source
WHERE type = 'FUNCTION'
    AND owner = 'my_db_test'
    AND name = 'MENU_UST_GETIR'
ORDER BY line;


/*Nested function db ye kaydedilmez*/
SELECT * FROM PBS_ORGANIZASYON po

--Prosedure ve Function farklıdır. Function değer döndürmek zorunda iken prosedürde böyle bir zorunluluk yoktur.
--Yada prosedure de in,out,inout yazarak dönüş sağlayabilirsin.

DECLARE
-- FONKSYİON DA KULLANILACAK DEĞERLER TANIMLANIR.
	FUNCTION <fonksiyon_adi>(parametreler) RETURN <dönecek verinin tipi> IS <fonksiyon içerisinde kullanılanacak değişkenler>

	--Function un çalıştıracağı kısım, yapacağı işlem
	BEGIN

		RETURN (data);
		EXCEPTION
	END
BEGIN -- Main block

	--FONKSİYON DA İŞİN BİTİNCE main block tan çağırırsın.
	wsonuc := <func_name>(PARAMETER VALUES); --CALL func
END;

/*Nested örnek*/
DECLARE
	x NUMBER;
	FUNCTION hakan_toplam(a number, b number) RETURN number IS

	 c NUMBER;
	BEGIN
		c := a + b;
		RETURN(c);
	END;


BEGIN
	x := hakan_toplam(3,2);
	dbms_output.put_line('Toplam = ' || x);
END;

/******* kalıcı fonksiyon procedur *** // STANDALONE

/*Standalone Functions Syntax*/
/* Bu şekilde yazıldığın da veritabanında saklanır bunlar.*/
CREATE [OR REPLACE] FUNCTION <function_adi> (Parametreler) IS
	RETURN <data_type>


DROP FUNCTION<functin_adi>;

