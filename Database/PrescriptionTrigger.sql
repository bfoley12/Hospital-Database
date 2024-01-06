delimiter $$
CREATE TRIGGER Prevent_early_Prescription_deletion
BEFORE DELETE ON Prescription
FOR EACH ROW
BEGIN
    signal sqlstate '45000' set message_text = 'Prescription records can not be deleted';
END
$$
delimiter ;