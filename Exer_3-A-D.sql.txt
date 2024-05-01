DELIMITER $$

CREATE PROCEDURE Exer3a (IN num1 INT, IN num2 INT)
BEGIN
    DECLARE mayor INT;
    
    IF num1 > num2 THEN
        SET mayor = num1;
    ELSE
        SET mayor = num2;
    END IF;
    
    SELECT mayor AS 'Mayor valor entre los dos números';
END $$

DELIMITER ;
CALL Exer3a(4,5);



DELIMITER $$

CREATE PROCEDURE Exer3b (IN num1 INT, IN num2 INT, OUT diferencia INT)
BEGIN
   
    IF num1 IS NULL THEN
        SET num1 = 0;
    END IF;
    
    IF num2 IS NULL THEN
        SET num2 = 0;
    END IF;
    
    SET diferencia = ABS(num1 - num2);
END $$

DELIMITER ;
CALL Exer3b(3, 9, @resultado);
SELECT @resultado;


DELIMITER $$

CREATE PROCEDURE EXER3C (IN numero INT)
BEGIN
    CASE numero
        WHEN 0 THEN SELECT 'Cero';
        WHEN 1 THEN SELECT 'Uno';
        WHEN 2 THEN SELECT 'Dos';
        WHEN 3 THEN SELECT 'Tres';
        WHEN 4 THEN SELECT 'Cuatro';
        WHEN 5 THEN SELECT 'Cinco';
        WHEN 6 THEN SELECT 'Seis';
        WHEN 7 THEN SELECT 'Siete';
        WHEN 8 THEN SELECT 'Ocho';
        WHEN 9 THEN SELECT 'Nueve';
        ELSE SELECT '';
    END CASE;
END $$

DELIMITER ;

CALL Exer3C(9);


DELIMITER $$

CREATE PROCEDURE Exer3d (IN IDAutor INT)
BEGIN
    DECLARE num_llibres INT;
    DECLARE nombre_autor VARCHAR(100); 
		
    SELECT COUNT(*) INTO num_llibres
    FROM lli_aut
    WHERE FK_IDLLIB = IDAutor;
    
    SELECT NOM_AUT INTO nombre_autor
    FROM AUTORS 
    WHERE ID_AUT = IDAutor;
    
    IF num_llibres = 0 THEN
        SELECT CONCAT('El autor ', nombre_autor , ' no tiene ningún libro');
    END IF;
    
    IF num_llibres = 1 THEN
        SELECT CONCAT('El autor ', nombre_autor , ' tiene solo un libro');
    END IF;
    
    IF num_llibres > 1 THEN
        SELECT CONCAT('El autor ', nombre_autor , ' tiene muchos libros');
    END IF;
    
    IF num_llibres <= 0 THEN
        SELECT CONCAT('El autor con el ID ', IDAutor , ' no existe');
    END IF;
END $$

DELIMITER ;
CALL Exer3d(2);
