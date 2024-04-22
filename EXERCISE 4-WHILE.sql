DELIMITER //

CREATE PROCEDURE ex3(start_num INT, end_num INT)
BEGIN
    DECLARE current_num INT;
    
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_result (num INT);
    
    SET current_num = start_num;
    
    WHILE current_num <= end_num DO
        IF current_num % 5 = 0 THEN
            INSERT INTO temp_result VALUES (current_num);
        END IF;
        SET current_num = current_num + 1;
    END WHILE;
    
    SET current_num = start_num;
    
    WHILE current_num <= end_num DO
        IF current_num % 3 = 0 THEN
            INSERT INTO temp_result VALUES (current_num);
        END IF;
        SET current_num = current_num + 1;
    END WHILE;
    
    SELECT * FROM temp_result;
    
    DROP TEMPORARY TABLE IF EXISTS temp_result;
    
END //

DELIMITER ;

