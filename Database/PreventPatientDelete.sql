delimiter $$
CREATE TRIGGER Prevent_early_deletion
BEFORE DELETE ON Patient
FOR EACH ROW
BEGIN
    signal sqlstate '45000' set message_text = 'Records can not be deleted';
END
$$
delimiter ;