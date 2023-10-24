/*Cross join matematikteki kartezyen çarpım ile aynıdır. Oluşacak tablodaki
  kayıt sayısı m*n kadar olacaktır. iki tablodaki verierin hepsinin birbiriyle çarpılması kadardır.*/

SELECT COUNT(*) FROM EMPLOYEES;
SELECT COUNT(*) FROM DEPARTMENTS;
SELECT 107 * 27 FROM DUAL; -- 2889

-- cross join daha çok test için veri üretmede kullanılır.

/*GELENEKSEL FORMAT*/
SELECT
    LAST_NAME,
    DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS;

/*ANSI FORMAT*/
SELECT
    LAST_NAME,
    DEPARTMENT_NAME
FROM EMPLOYEES CROSS JOIN DEPARTMENTS;
