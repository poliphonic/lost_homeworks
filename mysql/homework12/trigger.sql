/*
Установим триггер, который не позволит при вставке в таблицу review 
добавить занчения grade меньше единицы или больше 10.
 */

DELIMITER //

DROP TRIGGER IF EXISTS grades_from_1_to_10_insert//

CREATE TRIGGER grades_from_1_to_10_insert BEFORE INSERT ON reviews
FOR EACH ROW
BEGIN
    IF NEW.grade < 0 OR NEW.grade > 11 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert Canceled. Grade must be between 1 and 10!';
    END IF;
END//

DELIMITER ;
