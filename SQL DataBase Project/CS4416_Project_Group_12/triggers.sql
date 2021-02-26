-- NOTE: For some reason this SQL file imports into phpmyadmin with errors. However, all the statements work perfectly if you copy and paste them individually into the sql text box. 

--
-- Triggers
--

--
-- DeleteMember procedure:
--

Delimiter //
CREATE PROCEDURE DeleteMember( IN mid CHAR(10))
MODIFIES SQL DATA
BEGIN
DELETE FROM members
WHERE member_id = mid;
END;//

--      
-- DoesMemberExist function:
--

DELIMITER // 
CREATE FUNCTION DoesMemberExist ( mid char(10)) 
RETURNS INTEGER 
READS SQL DATA 
BEGIN 
IF( NOT EXISTS(SELECT 1 FROM members WHERE member_id = mid) 
AND 
EXISTS(SELECT 1 FROM rented_equipment_log WHERE member_id = mid) ) 
THEN RETURN 0;
ELSE RETURN 1;
 END IF; 
END;

--
-- UpdateRented trigger:
-- 

Delimiter //
CREATE TRIGGER UpdateRented
AFTER DELETE ON members
FOR EACH ROW BEGIN
DECLARE MC INTEGER;
	SELECT DoesMemberExist(OLD.member_id) INTO MC;
IF (MC = 0) THEN
		DELETE FROM rented_equipment_log WHERE member_id = OLD.member_id;
END IF;
END;

--
-- AddLoan procedure (needed for UpdateQuantity trigger):
--
Delimiter //
CREATE PROCEDURE AddLoan(mid CHAR(10), m VARCHAR(30), t VARCHAR(20), date DATE)
MODIFIES SQL DATA
BEGIN
INSERT INTO rented_equipment_log (member_id, model, type, date_taken)
	VALUES (mid, m, t, date);
END;//

--
-- UpdateQuantity trigger:
--

delimiter // 
CREATE TRIGGER UpdateQuantity 
AFTER INSERT ON rented_equipment_log 
FOR EACH ROW BEGIN 
UPDATE equipment e
 SET e.quantity = e.quantity - 1 
WHERE e.model = NEW.model; 
END;//


	
