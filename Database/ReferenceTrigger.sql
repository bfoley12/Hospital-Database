delimiter $$
CREATE TRIGGER Prevent_early_Reference_deletion
BEFORE DELETE ON Reference
FOR EACH ROW
BEGIN
    signal sqlstate '45000' set message_text = 'Reference records can not be deleted';
END
$$
delimiter ;