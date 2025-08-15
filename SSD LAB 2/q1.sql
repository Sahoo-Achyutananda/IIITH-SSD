-- ListAllSubscribers() – Stored procedure that uses a cursor to iterate through all
-- Subscribers and prints their names.

USE SSDLAB2;

DELIMITER //
CREATE PROCEDURE ListAllSubscribers()
BEGIN
	DECLARE done INT DEFAULT 0;
    DECLARE subName VARCHAR(255);
    
    DECLARE cur CURSOR FOR 
		SELECT SubscriberName FROM Subscribers;
	
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    readLoop : LOOP
		FETCH cur INTO subName;
        IF done THEN
			LEAVE readLoop;
		END IF;
        
        SELECT subName AS SubscriberName;
	END LOOP;
    CLOSE cur;
END // 
DELIMITER ;

CALL ListAllSubscribers();

-- It generated all Names but each in a separate Result Section
