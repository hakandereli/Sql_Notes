/**
  Composite (Collection) Data types kullanıcı tarafından tanımlanan veri tipleridir.

  Record Type : aşağıdaki şekilde tanımlanır.


  TYPE <type_name> IS RECORD (
        <variable_name> <data_type>,
        <variable_name> <data_type>,
        ...
  );

  user definent , developer definent denir bu tiplere.
  */

  /*aşağıdaki select * into degisken ile yaptığın kısımda değiskenine 3 kolon koydun ama 4 kolon dönüyorsa
    not enouhg values şeklinde hata verir çalıştığında
    tablo dan 4 kolon çağırıyorsun ama eşleşmesi için tipinde 3 kolon verdin dördüncüyü ekle veya yıldız yerine kolonları yaz tek tek
    */

  DECLARE

    TYPE t_dept IS RECORD(
        dept_id         number(4),
        dept_name       hr.departments.department_name%type,
        manager_id      hr.departments.manager_id%type NOT NULL DEFAULT 0
    );

    degisken t_dept;
  BEGIN
        SELECT department_id, department_name, manager_id INTO degisken FROM HR.DEPARTMENTS WHERE DEPARTMENT_ID = 20;
        DBMS_OUTPUT.PUT_LINE(degisken.dept_id || ' ' || degisken.dept_name || ' ' || degisken.manager_id);
  END;