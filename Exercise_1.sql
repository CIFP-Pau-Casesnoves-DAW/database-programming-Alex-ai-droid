DELIMITER $$

CREATE PROCEDURE exer (IN ID INT)
BEGIN
    DECLARE nombre_autor VARCHAR(100);
    SELECT NOM_AUT INTO nombre_autor FROM AUTORS WHERE ID_AUT = ID;
    SELECT nombre_autor;
    
END $$

DELIMITER ;

CALL exer(1);

