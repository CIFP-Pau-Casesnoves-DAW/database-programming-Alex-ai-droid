DELIMITER $$

CREATE TRIGGER ComprovarInsert
AFTER INSERT ON book
FOR EACH ROW
INSERT INTO comprovante (usuario_name, codigo_libro, operacion, new_title)
VALUES (USER(), NEW.BOOK_CODE, 'ALTA', NEW.TITLE);

END$$
DELIMITER ;

//////////////////////////////////////////////////////////////////////////////////
DELIMITER $$

CREATE TRIGGER ComprovarUpdate
AFTER UPDATE ON book
FOR EACH ROW
INSERT INTO comprovante (usuario_name, codigo_libro, operacion, old_title, new_title)
VALUES (USER(), OLD.BOOK_CODE, 'MODIFICACION', OLD.TITLE, NEW.TITLE)
$$
DELIMITER ;
////////////////////////////////////////////////////////////////////////////////////

DELIMITER $$

CREATE TRIGGER comprovarDelete
AFTER DELETE ON book
FOR EACH ROW
INSERT INTO comprovante (usuario_name, codigo_libro, operacion, old_title)
VALUES (USER(), OLD.BOOK_CODE, 'BAIXA', OLD.TITLE)

$$
DELIMITER ;

---------------------------------------------------------------------------------------
-- creación de la tabla donde se guardara la información 

USE library;

CREATE TABLE Comprovante (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Data_i_Hora_Modificacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_name VARCHAR(50) NOT NULL,
    codigo_libro CHAR(4) NOT NULL,
    operacion ENUM('ALTA','BAIXA','MODIFICACIO') NOT NULL,
    old_title CHAR(150),
    new_title CHAR(150)
);

-- insertacion, actualización i Eliminación de datos con su respectiva comprovacion del funcionamiento

INSERT INTO book (BOOK_CODE, TITLE, LANGUAGE, EDITION_NUM, AUTHOR_CODE, PUBLISHER_CODE) 
VALUES ('TEST', 'Llibre de Prova', 'CA', 1, 1, 1);
SELECT * FROM comprovante;
SELECT * FROM book WHERE TITLE = 'LLibre de prova'; 



UPDATE book 
SET TITLE = 'Teo va a la granja'
WHERE BOOK_CODE = 'TEST';

SELECT * FROM comprovante;
SELECT * FROM book WHERE TITLE = 'Teo va a la granja';


DELETE FROM book WHERE BOOK_CODE = 'TEST';
SELECT * FROM comprovante;
