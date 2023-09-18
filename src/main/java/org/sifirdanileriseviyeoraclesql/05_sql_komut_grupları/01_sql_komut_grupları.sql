/*Sql Komut grupları - Oracle SQL language Statements*/

/*
    DDL (Data Definition Language) :
        Veri yapısı tanımlama , database , table , view, fonksiyon, prosedure, package gibi veri yapılarını
--        TANIMLAMA, DEĞIŞTIRME ve SILME komutlarıdır.
        Veri yapıları üzerinde işlem yapılır.
        1. Create
        2. Alter
        3. Drop

    DML (Data Manupulation Language):
        Veriler üzerinde işlem yapılır.
        1. Select
        2. Insert
        3. Update
        4. Delete

    DCL (Data Control Language):
        Nesne üzerindeki yetki işlemleri için kullanılır.
        Oracle da yetki 2 türlüdür system privilege, object privilege dir.
        1. Grant
        2. Revoke

    TCL (Transaction Control Language)
        Transaction: INSERT, UPDATE, DELETE (SELECT bir transaction değildir.) sorgularının sonuçları birer transaction dır. Bunlar birer işlemdir.
        Bu işlemlerinin veritabnında kalıcı olarak saklanması TCL komutları kullanılır.
        Commit edilmeyen sorgular db de kalıcı olarak saklanmaz.
        Rollback ile ise kalıcı olarak saklamadan geri alınabiliriz.
        1. Commit
        2. Rollback

        /************************************************************
        DDL işlemleri DML işlemlerini otomatik commit eder !!!
        Yani bir insert yaptın ama daha commitlemedin peşinde bir ddl sorgusu çalıştırırsan DML i otomatik commit eder.
        ************************************************************/
*/