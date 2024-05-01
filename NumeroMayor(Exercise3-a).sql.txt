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
