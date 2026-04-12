DELIMITER //

CREATE PROCEDURE ProsesPayrollKaryawan()
BEGIN   
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_gaji DECIMAL(12,2);
    DECLARE v_pajak DECIMAL(12,2);
    DECLARE v_bersih DECIMAL(12,2);

    DECLARE cur_payroll CURSOR FOR 
        SELECT id_karyawan, gaji_pokok FROM karyawan;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    TRUNCATE TABLE payroll_result;

    OPEN cur_payroll;

    read_loop: LOOP
        FETCH cur_payroll INTO v_id, v_gaji;

        IF done THEN 
            LEAVE read_loop;
        END IF;

        IF v_gaji >= 10000000 THEN
            SET v_pajak = v_gaji * 0.15;
        ELSEIF v_gaji > 5000000 THEN
            SET v_pajak = v_gaji * 0.10;
        ELSE
            SET v_pajak = v_gaji * 0.05;
        END IF;

        SET v_bersih = v_gaji - v_pajak;

        INSERT INTO payroll_result (id_karyawan, pajak, gaji_bersih)
        VALUES (v_id, v_pajak, v_bersih);

    END LOOP;

    CLOSE cur_payroll;

END //

DELIMITER ;