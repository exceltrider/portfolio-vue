DELIMITER //

CREATE PROCEDURE contoh_filter()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT;

    outer_loop: LOOP
        IF i > 3 THEN
            LEAVE outer_loop;
        END IF;

        SET j = 1;

        inner_loop: LOOP
            IF j > 3 THEN
                LEAVE inner_loop;
            END IF;

            IF (i * j) MOD 2 = 0 THEN
                SELECT CONCAT(i, ' x ', j, ' = ', i*j, ' (Genap)') AS hasil;
            END IF;

            SET j = j + 1;
        END LOOP inner_loop;

        SET i = i + 1;
    END LOOP outer_loop;

END //

DELIMITER ;