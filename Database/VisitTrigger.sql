delimiter $$
CREATE TRIGGER Prevent_early_Visit_deletion
BEFORE DELETE ON Reference
FOR EACH ROW
BEGIN
    signal sqlstate '45000' set message_text = 'Visit records can not be deleted';
END
$$
delimiter ;