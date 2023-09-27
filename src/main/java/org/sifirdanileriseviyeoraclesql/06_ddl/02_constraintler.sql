/*
 Er diagramını görmek için oracle sql developer da VIEW -> Data Modeller -> Browser -> Relational Model e sağ tıklayıp new
 dersin daha sonra tabloarı buraya sürükleyerek ilişkilerini görebilirsin.
 Henüz tablolardaki ilişkileri tanımlamadık.

*/

/*
    Constraints : Kısıtlamalar demek
    FK(Foreign Key), PK(Primary Key), CHECK CONSTRAINT, NOT NULL CONSTRAINT VS....

    Neden Constraint Tanımlanmalıdır?
    Integrity(Butunluk)
    Consistency(Tutarlılık)
    Reliability(Güvenirlik)

    Sağlamak için constraintler tanımlanmalıdır. RDBMS db lerin temeli bu ilkelere dayanır.

*/
/*
    Primary Key(Birincil Anahtar) : Bir tablodaki verilere doğrudan erişebilmek için kullanılan benzersiz alandır.
    Primary key kolona NULL değer girilemez.
    Örneğin: TCKNO, EMAIL, SGK NO, OGRENCI NO , PASAPORT NO , Plaka no, Kayıt sıra no gibi...

    Kural:
    1-Bir tabloda sadece bir tane primay key tanımlanabilir.
    2-Primary Key tablodaki birden fazla kolon üzerinde tanımlanabilir.
*/
/*
    Foreign Key(Yabancı Anahtar): RDBMS yapıdaki veritabanlarındaki iki tabloyu birbirine bağlamak ve bunları uygulamak için
    kullanılan sütun veya sütunların birleşimidir. Referans Key olarak da isimlendirilir.

    Foreign Key tanımlamadaki temel amaç tekrarlı bilgilerden kaçınmaktır.

    Kural:
    Bir tabloda istenildiği kadar FK tanımlanabilir.
    Foreign Key in diğer tablodaki referans olarak alacağı kolon primary key veya unique key olmak zorundadır.
*/

/*PK veya FK tablo oluştururlurken den tanımlanabilir yada daha sonradan eklenebilir.*/

ALTER TABLE REGIONS ADD(
    CONSTRAINT REG_ID_PK PRIMARY KEY(REGION_ID)
);
/*******************************/
ALTER TABLE COUNTRIES ADD(
    CONSTRAINT COUNTR_REG_FK FOREIGN KEY(REGIONS_ID) REFERENCES REGIONS(REGION_ID)
);
/*******************************/
ALTER TABLE COUNTRIES ADD(
    CONSTRAINT COUNTR_ID_PK PRIMARY KEY(COUNTRY_ID)
);


/*******************************/
/*FK ve PK yi tek seferde aşağıdaki şekilde de ekleyebilirsin.*/
ALTER TABLE LOCATIONS ADD(
    CONSTRAINT LOCATION_ID_PK PRIMARY KEY(LOCATION_ID),
    CONSTRAINT LOCATION_COUNT_FK FOREIGN KEY(COUNTRY_ID) REFERENCES COUNTRIES(COUNTRY_ID)
);


/*Tabloya kolon ekleme FK için örneğin*/
ALTER TABLE DEPARTMENTS ADD LOCATION_ID NUMBER(4);

/*******************************/
ALTER TABLE DEPARTMENTS ADD(
    CONSTRAINT DEPT_ID_PK PRIMARY KEY (DEPARTMENT_ID),
    CONSTRAINT DEP_LOC_FK FOREIGN KEY (LOCATION_ID) REFERENCES LOCATIONS(LOCATION_ID)
);


/*******************************/

/*Oracle da komutlar case sensitive değildir büyük yada küçük yazarak çalışıtırılabilir.*/

ALTER TABLE JOBS ADD(
    CONSTRAINT JOB_ID_PK PRIMARY KEY(JOB_ID)
);

ALTER TABLE EMPLOYEES ADD DEPARTMENT_ID NUMBER(2);

/*Bir fk kendi tablosunu refere edebilir burada çalışanın kullanıcısını işaretlemektir.
Yönetici de bir çalışandır.
*/
ALTER TABLE  EMPLOYEES ADD(
    CONSTRAINT EMP_EMP_ID_PK PRIMARY KEY(EMPLOYEE_ID),
    CONSTRAINT EMP_DEPT_FK FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID),
    CONSTRAINT EMP_JOB_FK FOREIGN KEY(JOB_ID) REFERENCES JOBS(JOB_ID),
    CONSTRAINT EMP_MANAGER_FK FOREIGN KEY(MANAGER_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID)
);


/*Karşılıklı 2 tablo birbirine fk da verebilir.*/
ALTER TABLE DEPARTMENTS ADD(
    CONSTRAINT DEPT_MGR_ID FOREIGN KEY(MANAGER_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID)
);

/*Aşağıda PK için 2 kolon tanımı yapıldı 2 si bir den tek pk yı oluşturur.*/
ALTER TABLE JOB_HISTORY ADD(
    CONSTRAINT JHIST_EMP_ID_ST_DATE_PK PRIMARY KEY(EMPLOYEE_ID, START_DATE),
    CONSTRAINT JHIST_JOB_ID_FK FOREIGN KEY(JOB_ID) REFERENCES JOBS(JOB_ID),
    CONSTRAINT JHIST_EMP_ID_FK FOREIGN KEY(EMPLOYEE_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID),
    CONSTRAINT JHIST_DEPT_FK FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID)
);

/*fk ve pk veritabanın daki verilerin doğruluğunu güvenliği sağlar örneğin fk
tanımladığın bir tabloda veri girmek için fk nin refere ettiği tabloda veri olmalı
fk işaret ettiği kolon dolu olmalıdır.*/

/*ER dıagramı çıkarma işlemine veri modelleme denir projeye başlamadan önce kesinlikle
yapılması gerekir bu diagram elinde olursa çok da rahat geliştirirsin kodunu
normalizasyon da yapmış olursun aslında bu sırada.
*/


/*FK aslında Parent(Baba) - Child(Oğul) ilişkisidir.
child üzerine fk eklenen tablodur.
Parent referense edilen tablodur.

fk lar veri bütünlüğünü sağlar.
baba yoksa çocuksa yoktur. Çocuka veri girmek için baba da kayıt olmalıdır.

Veri girişi parent dan child a doğrudur.
Veri silinmesi de child dan parent a doğrudur.

Yani babada veri olmadan çocuğa veri girilemez.
Parent da veri silmek için önce child ki kaydı silinmelidir.

*/









