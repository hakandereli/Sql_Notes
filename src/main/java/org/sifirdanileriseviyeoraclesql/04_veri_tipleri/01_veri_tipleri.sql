/*
          Data Types
    1-Character Data Types
    2-Numeric Data Types
    3-Binary Data Types
    4-Time And Date Data Types
    5-Other Data Types
        5.1-XML Data Types
        5.2-Spatial Data Types
        5.3-JSON Data Types
        5.4-Object Data Types
        5.5-User-Defined Data Types
*/
/*
Chracter Data Types
    Görsel de mevcut
    MAX_STRING_SIZE parametresini görüntülemek için
*/
SHOW PARAMETER MAX_STRING_SIZE;

/*
nchar national yani unicode tutar.

Oracle'da "CHAR" ve "NCHAR" arasındaki temel fark, karakter kodlamasıdır. "CHAR" veri türü,
veritabanının yerel karakter kümesine (örneğin, ISO-8859-1 veya Windows-1252) dayalı olarak
 karakterleri saklar. Bu nedenle, sınırlı bir karakter kümesini temsil eder ve
  bazı diller veya semboller bu karakter kümesinde doğru bir şekilde saklanamaz.
  Ancak "NCHAR" veri türü, Unicode karakter setini kullanarak tüm dilleri ve sembolleri
  destekler. Bu, uluslararası uygulamalar için idealdir.

Unicode, bilgisayar sistemlerinde ve yazılım uygulamalarında metinlerin ve sembollerin temsil edilmesi için kullanılan
 bir karakter kodlama standardıdır.
 Unicode, dünya genelinde farklı alfabe, sembol ve dil karakterlerini temsil etmek için
 tasarlanmış bir karakter setidir. Bu karakter seti, dünya çapındaki farklı dillerin,
  sembollerin ve yazı sistemlerinin uygun bir şekilde temsil edilmesini sağlar.

Unicode, her karakteri benzersiz bir sayısal değerle temsil eder.
 Bu sayısal değerlere "Unicode kod noktası" veya "Unicode code point" denir. Örneğin,
 Latin harfi "A" Unicode'da U+0041 olarak temsil edilir.

Unicode'in avantajları şunlar içerir:

Evrensel Uyumluluk: Unicode, dünya genelindeki tüm dilleri ve sembolleri temsil etme
 kabiliyetine sahiptir, bu nedenle farklı yazı sistemlerini ve dilleri destekler.
Geniş Karakter Kapsamı: Unicode, matematik sembollerinden emoji'ye kadar geniş bir karakter
 yelpazesini içerir.
Çapraz Platform Desteği: Unicode, farklı işletim sistemleri ve
 yazılım platformları arasında sorunsuz metin alışverişi sağlar.
Geleceğe Uygunluk: Unicode, yeni karakterlerin eklenmesini ve
 dillerin genişletilmesini destekleyen bir yapıya sahiptir.
Unicode, metin işleme, web geliştirme, veritabanı yönetimi ve
 diğer birçok bilgisayar uygulamasında kullanılır. Bu standart, dil ve
  kültür çeşitliliğini desteklemek ve metin tabanlı bilgiyi evrensel olarak paylaşılabilir
   hale getirmek için büyük bir öneme sahiptir.
*/